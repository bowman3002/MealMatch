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
    @Binding private var restaurant: RestaurantDataQuery.Data.Search.Business
    
    init(width: CGFloat, height: CGFloat, restaurant: Binding<RestaurantDataQuery.Data.Search.Business>) {
        self.width = width > 0 ? width : 0
        self.height = height > 0 ? height : 0
        self._restaurant = restaurant
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            RemoteImage(url: (self.restaurant.photos?.first ?? "") ?? "")
                .aspectRatio(contentMode: .fit)
            
            RestaurantDetailView(restaurant: $restaurant)
        }
        .frame(width: self.width, height: self.height, alignment: .topLeading)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20.0)
                .stroke(Color("CardBorder"), lineWidth: 5.0)
        )
    }
}






