//
//  GQLAuthentication.swift
//  MealMatch
//
//  Created by Austin Dumm on 12/4/20.
//

import Foundation
import Apollo

struct GQLAuthentication {
    static let clientId: String = "o0RxoWY9S_LfGybUTU7A_A"
    static let apiKey: String = "Z0Vp-LdYJ0NW2NBqz2m5PUZxytl40-CCHncJqLLa0hmTu7Q_ir7xDh_zHhqVSgu7HdlCM6tJYNgDuLk1VxgyW3teo0CLwWfbZfbn_XGvzyR3I4nJSlgFhOaV50bKX3Yx"
}

struct Network {
    static var shared = Network()
    
    private(set) lazy var apollo: ApolloClient = {
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
          
        let client = URLSessionClient()
        let provider = LegacyInterceptorProvider(client: client, store: store)
        let url = URL(string: "https://api.yelp.com/v3/graphql")!

        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                                 endpointURL: url,
                                                                 additionalHeaders: [
                                                                    "Authorization" : "Bearer \(GQLAuthentication.apiKey)",
                                                                    "accept-language": "en_US"])
                                                                   

        return ApolloClient(networkTransport: requestChainTransport,
                                  store: store)
    }()
}
