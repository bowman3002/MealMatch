//
//  RestaurantCard.swift
//  MealMatch
//
//  Created by Christina Fosheim-Hoag on 12/4/20.
//

import SwiftUI

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RestaurantCard: View {
    private var width: CGFloat
    private var height: CGFloat
    private var restaurant: Restaurant
    
    init(width: CGFloat, height: CGFloat, restaurant: Restaurant) {
        self.width = width > 0 ? width : 0
        self.height = height > 0 ? height : 0
        self.restaurant = restaurant
    }
    
    var body: some View {
        VStack {
            RemoteImage(url: self.restaurant.imageUrl)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            
            ZStack {
                Color.white
                VStack {
                    Text(self.restaurant.name)
                        .font(.title)
                    Text("Hours:" + self.restaurant.hours)
                    Text("Category:" + self.restaurant.category)
                }
            }
            .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
        }
        .frame(width: self.width, height: self.height, alignment: .topLeading)
    }
}






