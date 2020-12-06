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
       let id = data.id {
        return Card(id: id,
                    drag: 0,
                    degree: 0,
                    restaurant: data)
    }
    return nil
}

class SwipeObserver : ObservableObject{
    
    @Published var cards = [Card]()
    let publisher: Publishers.CompactMap<Publishers.ApolloFetch<RestaurantDataQuery>, [Card]>
    var subscriber: AnyCancellable? = nil
    
    init() {
        cards = []
        
        publisher = Network.shared.apollo.fetchPublisher(query: RestaurantDataQuery(location: "Ann Arbor", top: 5))
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
