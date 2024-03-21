//
//  HomeViewViewModel.swift
//  Countries-GraphQL-SwiftUI
//
//  Created by Luann Luna on 21/03/24.
//

import Foundation
import Apollo

final class HomeViewViewModel: ObservableObject {
    private let client: ApolloClientProtocol

    var countries = Contries()

    init(client: ApolloClientProtocol) {
        self.client = client
    }

    func loadAllContries() {
        client.fetch(query: GetAllCountriesQuery(), cachePolicy: .returnCacheDataAndFetch, contextIdentifier: nil, queue: .global()) { result in
            switch result {
                case let .success(graphqlResult):
                    print(graphqlResult.data?.countries)
                case let .failure(error):
                    print(error)
            }
        }
    }
}
