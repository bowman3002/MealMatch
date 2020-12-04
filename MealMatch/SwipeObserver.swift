//
//  SwipableObserver.swift
//  MealMatch
//
//  Created by Christina Fosheim-Hoag on 12/4/20.
//

import SwiftUI

class SwipeObserver : ObservableObject{
    
    @Published var cards = [Card]()
    
    init() {
        
        self.cards.append(Card(id: 0, drag: 0, degree: 0, restaurant: Restaurant(id: 0, name: "Italian Restaurant", hours: "idk", category: "italian", imageUrl: "https://www.inspiredtaste.net/wp-content/uploads/2019/03/Spaghetti-with-Meat-Sauce-Recipe-1-1200.jpg")))
        //Skipping for brevity
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
