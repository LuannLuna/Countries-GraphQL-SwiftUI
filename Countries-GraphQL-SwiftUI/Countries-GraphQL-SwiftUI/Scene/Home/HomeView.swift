//
//  ContentView.swift
//  Countries-GraphQL-SwiftUI
//
//  Created by Luann Luna on 21/03/24.
//

import SwiftUI
import Apollo

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewViewModel

    var body: some View {
        NavigationView {
            List(viewModel.countries, id: \.code) { country in
                NavigationLink {
                    CountryDetailFactory.make(client: viewModel.client, country: country)
                } label: {
                    HStack {
                        Text(country.flag)
                        Text(country.name)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .onAppear {
                viewModel.loadAllContries()
            }
            .navigationTitle("Countries")
        }
    }
}

#Preview {
    let client = ApolloClient(url: Constants.url.value as! URL)
    let viewModel = HomeViewViewModel(client: client)
    return HomeView(viewModel: viewModel)
}
