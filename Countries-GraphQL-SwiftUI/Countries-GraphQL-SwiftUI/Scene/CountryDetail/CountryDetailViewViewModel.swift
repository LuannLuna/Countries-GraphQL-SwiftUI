//
//  CountryDetailViewViewModel.swift
//  Countries-GraphQL-SwiftUI
//
//  Created by Luann Luna on 21/03/24.
//

import Apollo
import SwiftUI

final class CountryDetailViewViewModel: ObservableObject {
    private let client: ApolloClientProtocol
    private let country: Country
    @Published var info: CountryInfo?

    init(client: ApolloClientProtocol, country: Country) {
        self.client = client
        self.country = country
    }

    func loadCountryInfo() {
        client.fetch(
            query: GetCountryInfoQuery(code: country.code),
            cachePolicy: .returnCacheDataAndFetch,
            contextIdentifier: nil,
            queue: .global()) { result in
                switch  result {
                case let .success(graphqlResult):
                    DispatchQueue.main.async { [weak self] in
                        self?.info = graphqlResult.data?.country
                    }
                case let .failure(error):
                    print(error.localizedDescription)
                }
            }
    }
}
