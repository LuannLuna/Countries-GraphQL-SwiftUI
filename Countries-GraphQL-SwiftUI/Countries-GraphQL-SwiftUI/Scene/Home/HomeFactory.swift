//
//  HomeFactory.swift
//  Countries-GraphQL-SwiftUI
//
//  Created by Luann Luna on 21/03/24.
//

import Apollo
import SwiftUI

enum HomeFactory {
    static func make(client: ApolloClientProtocol) -> HomeView {
        let viewModel = HomeViewViewModel(client: client)
        return HomeView(viewModel: viewModel)
    }
}
