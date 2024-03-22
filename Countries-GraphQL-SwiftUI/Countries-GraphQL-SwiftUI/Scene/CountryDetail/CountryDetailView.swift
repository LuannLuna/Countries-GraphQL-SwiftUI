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
            List(viewModel.info?.states ?? [], id: \.self) {
                Text($0)
            }
            Spacer()
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
            country: CountryViewModel(
                country: Country(
                    code: "US",
                    name: "United States",
                    emoji: ""
                )
            )
        )
    )
}
