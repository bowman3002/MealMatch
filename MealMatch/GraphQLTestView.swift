//
//  GraphQLTestView.swift
//  MealMatch
//
//  Created by Austin Dumm on 12/4/20.
//

import SwiftUI

struct GraphQLTestView: View {
    @State private var reviews: String = "Nothing! Click the text above"
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10.0, content: {
            Button("Make Request") {
                Network.shared.apollo.fetch(query: ReviewTotalForQuery(id: "uTMqhmpgfpDMLN3W3YvMeQ")) { result in
                    switch result {
                    case .success(let gqlResult):
                        reviews = String(gqlResult.data?.reviews?.total ?? 0)
                    case .failure(let error):
                        print("Error! \(error)")
                    }
                }
            }
            Text(reviews)
        })
    }
}

struct GraphQLTestView_Previews: PreviewProvider {
    static var previews: some View {
        GraphQLTestView()
    }
}
