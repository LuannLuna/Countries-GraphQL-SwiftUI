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
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
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
