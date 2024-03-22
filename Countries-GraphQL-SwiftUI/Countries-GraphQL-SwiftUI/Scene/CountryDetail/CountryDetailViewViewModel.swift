//
//  CountryDetailViewViewModel.swift
//  Countries-GraphQL-SwiftUI
//
//  Created by Luann Luna on 21/03/24.
//

import Apollo
import SwiftUI

struct CountryInfoViewModel {
    private let info: CountryInfo

    init(info: CountryInfo) {
        self.info = info
    }

    var name: String {
        info.name
    }

    var capital: String {
        info.capital ?? ""
    }

    var states: [String] {
        info.states.map(\.name)
    }
}

final class CountryDetailViewViewModel: ObservableObject {
    private let client: ApolloClientProtocol
    private let country: CountryViewModel
    @Published var info: CountryInfoViewModel?

    init(client: ApolloClientProtocol, country: CountryViewModel) {
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
                        guard let country = graphqlResult.data?.country else { return }
                        self?.info = CountryInfoViewModel(info: country)
                    }
                case let .failure(error):
                    print(error.localizedDescription)
                }
            }
    }
}
