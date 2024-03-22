//
//  HomeViewViewModel.swift
//  Countries-GraphQL-SwiftUI
//
//  Created by Luann Luna on 21/03/24.
//

import Apollo
import SwiftUI

struct CountryViewModel {
    private let country: Country

    init(country: Country) {
        self.country = country
    }

    var code: GraphQLID {
        country.code
    }

    var name: String {
        country.name
    }

    var flag: String {
        country.emoji
    }
}

final class HomeViewViewModel: ObservableObject {
    let client: ApolloClientProtocol

    @Published var countries = [CountryViewModel]()

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
                            self?.countries = countries.map {
                                CountryViewModel(country: $0)
                            }
                        }
                    }
                case let .failure(error):
                    print(error.localizedDescription)
            }
        }
    }
}
