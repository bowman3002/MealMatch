//
//  SwipableCard.swift
//  MealMatch
//
//  Created by Christina Fosheim-Hoag on 12/4/20.
//

import SwiftUI

struct SwipableCardStack : View {

    @EnvironmentObject var observer : SwipeObserver
    let matchService = MatchService()
    
    var body : some View{
        VStack{
            GeometryReader{geo in
                
                ZStack{
                    
                    ForEach(self.observer.cards){card in
                        
                        RestaurantCard(width: geo.size.width-40, height: geo.size.height - 80, restaurant: .constant(card.restaurant))
                            .gesture(DragGesture()
                                
                                .onChanged({ (value) in
                                    
                                    self.matchService.delegate?.matchDetected(manager: matchService, matchString: "")
                                    
                                    
                                    if value.translation.width > 0{
                                        
                                        if value.translation.width > 30{
                                            self.observer.update(id: card, value: value.translation.width, degree: 12)
                                        }
                                        else{
                                            self.observer.update(id: card, value: value.translation.width, degree: 0)
                                        }
                                    }
                                    else{
                                        
                                        if value.translation.width < -30{
                                            self.observer.update(id: card, value: value.translation.width, degree: -12)
                                        }
                                        else{
                                            self.observer.update(id: card, value: value.translation.width, degree: 0)
                                        }
                                    }
                                    
                                }).onEnded({ (value) in
                                    
                                    if card.drag > 0{

                                        if card.drag > geo.size.width / 2 - 40{
                                            self.observer.update(id: card, value: 500, degree: 0)
                                            self.matchService.send(restaurantName: "right")
                                        }
                                        else{
                                            self.observer.update(id: card, value: 0, degree: 0)
                                        }
                                    }
                                    else{

                                        if -card.drag > geo.size.width / 2 - 40{
                                            self.observer.update(id: card, value: -500, degree: 0)
                                            self.matchService.send(restaurantName: "left")
                                        }
                                        else{

                                            self.observer.update(id: card, value: 0, degree: 0)
                                        }
                                    }
                                    
                                })
                        ).offset(x: card.drag)
                            .scaleEffect(abs(card.drag) > 100 ? 0.8 : 1)
                            .rotationEffect(.init(degrees:card.degree))
                            .animation(.spring())
                        
                    }
                }.frame(width: geo.size.width, height: geo.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct SwipableCardStack_Previews: PreviewProvider {
    static var previews: some View {
        SwipableCardStack().environmentObject(SwipeObserver())
    }
}
