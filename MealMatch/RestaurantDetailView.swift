//
//  RestaurantDetailView.swift
//  MealMatch
//
//  Created by Austin Dumm on 12/6/20.
//

import SwiftUI

struct RestaurantDetailView: View {
    @Binding var restaurant: RestaurantDataQuery.Data.Search.Business
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            Color("CardBackground")
            VStack {
                Text(self.restaurant.name ?? "")
                    .font(.title)
                Text("Category: \(self.restaurant.categories?.first??.title ?? "")")
                Spacer()
                HStack {
                    Text((self.restaurant.hours?.first??.isOpenNow ?? false) ?
                        "Open Now" :
                        "Closed")
                    Spacer()
                    Text("Reviews: \(self.restaurant.rating ?? 0.0, specifier: "%.2f") of 5 (\(self.restaurant.reviewCount ?? 0))")
                }
            }
            .padding()
        }
    }
}
//
//struct RestaurantDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        RestaurantDetailView(restaurant: .constant(RestaurantDataQuery()))
//    }
//}
