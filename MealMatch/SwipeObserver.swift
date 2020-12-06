//
//  SwipableObserver.swift
//  MealMatch
//
//  Created by Christina Fosheim-Hoag on 12/4/20.
//

import SwiftUI
import Combine
import Apollo
import ApolloCombine

func resultToCard(data: RestaurantDataQuery.Data.Search.Business?) -> Card? {
    if let data = data,
       let name = data.name,
       let hours = data.hours?.first??.isOpenNow,
       let categories = data.categories,
       let imageURLs = data.photos {
        return Card(id: 0,
                    drag: 0,
                    degree: 0,
                    restaurant: Restaurant(id: 0,
                                           name: name,
                                           hours: hours ? "Open Now!" : "Closed",
                                           category: categories.first??.title ?? "",
                                           imageUrl: (imageURLs.first ?? "")!))
    }
    return nil
}

class SwipeObserver : ObservableObject{
    
    @Published var cards = [Card]()
    let publisher: Publishers.CompactMap<Publishers.ApolloFetch<RestaurantDataQuery>, [Card]>
    var subscriber: AnyCancellable? = nil
    
    init() {
        cards = []
        
//        self.cards.append(Card(id: 0, drag: 0, degree: 0, restaurant: Restaurant(id: 0, name: "Italian Restaurant", hours: "idk", category: "italian", imageUrl: "https://www.inspiredtaste.net/wp-content/uploads/2019/03/Spaghetti-with-Meat-Sauce-Recipe-1-1200.jpg")))
        //Skipping for brevity
        
        publisher = Network.shared.apollo.fetchPublisher(query: RestaurantDataQuery(location: "Ann Arbor", top: 1))
            .compactMap({ return $0.data?.search?.business?.compactMap(resultToCard)})

        self.setupGQLSubscriber()
    }
    
    func setupGQLSubscriber() {
        self.subscriber =
            publisher.sink { (_) in
            
            } receiveValue: { (cards) in
                self.cards.append(contentsOf: cards)
            }
    }
    
    func update(id : Card,value : CGFloat,degree : Double){
        
        for i in 0..<self.cards.count{
            
            if self.cards[i].id == id.id{
                
                self.cards[i].drag = value
                self.cards[i].degree = degree
            }
        }
    }
}
