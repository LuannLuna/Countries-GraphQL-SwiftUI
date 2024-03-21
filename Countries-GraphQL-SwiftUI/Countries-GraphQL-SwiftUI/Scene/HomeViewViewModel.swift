//
//  HomeViewViewModel.swift
//  Countries-GraphQL-SwiftUI
//
//  Created by Luann Luna on 21/03/24.
//

import Apollo
import SwiftUI

final class HomeViewViewModel: ObservableObject {
    let client: ApolloClientProtocol

    @Published var countries = Countries()

    init(client: ApolloClientProtocol) {
        self.client = client
    }

    func loadAllContries() {
        client.fetch(
            query: GetAllCountriesQuery(),
            cachePolicy: .returnCacheDataAndFetch,
            contextIdentifier: nil,
            queue: .global()
        ) { result in
            switch result {
                case let .success(graphqlResult):
                    if let countries = graphqlResult.data?.countries {
                        DispatchQueue.main.async { [weak self] in
                            self?.countries = countries
                        }
                    }
                case let .failure(error):
                    print(error.localizedDescription)
            }
        }
    }
}
