//
//  Countries_GraphQL_SwiftUIApp.swift
//  Countries-GraphQL-SwiftUI
//
//  Created by Luann Luna on 21/03/24.
//

import SwiftUI
import Apollo

@main
struct Countries_GraphQL_SwiftUIApp: App {
    let apolloClient = ApolloClient(url: Constants.url.value as! URL)

    var body: some Scene {
        WindowGroup {
            let viewModel = HomeViewViewModel(client: apolloClient)
            HomeView(viewModel: viewModel)
        }
    }
}
