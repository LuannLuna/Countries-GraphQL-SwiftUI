//
//  CountryDetailView.swift
//  Countries-GraphQL-SwiftUI
//
//  Created by Luann Luna on 21/03/24.
//

import SwiftUI
import Apollo

struct CountryDetailView: View {
    @ObservedObject var viewModel: CountryDetailViewViewModel

    var body: some View {
        VStack {
            Text(viewModel.info?.name ?? "")
            Text(viewModel.info?.capital ?? "")
            List(viewModel.info?.states ?? [], id: \.name) { state in
                Text(state.name)
            }
        }.onAppear {
            viewModel.loadCountryInfo()
        }
    }
}

#Preview {
    let client = ApolloClient(url: Constants.url.value as! URL)
    return CountryDetailView(
        viewModel: CountryDetailViewViewModel(
            client: client,
            country: Country(
                code: "US",
                name: "United States",
                emoji: ""
            )
        )
    )
}
