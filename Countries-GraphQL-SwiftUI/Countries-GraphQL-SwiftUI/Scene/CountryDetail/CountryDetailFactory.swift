//
//  CountryDetailFactory.swift
//  Countries-GraphQL-SwiftUI
//
//  Created by Luann Luna on 21/03/24.
//

import Apollo
import SwiftUI

enum CountryDetailFactory {
    static func make(client: ApolloClientProtocol, country: CountryViewModel) -> CountryDetailView {
        let viewModel = CountryDetailViewViewModel(client: client, country: country)
        return CountryDetailView(viewModel: viewModel)
    }
}
