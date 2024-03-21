//
//  Apollo.swift
//  Countries-GraphQL-SwiftUI
//
//  Created by Luann Luna on 21/03/24.
//

import Foundation
import Apollo

enum Constants {
    case url

    var value: Any {
        switch self {
            case .url:
                URL(string: "https://countries.trevorblades.com") as Any
        }
    }
}

final class Network {
    var apollo: ApolloClientProtocol

    init(apollo: ApolloClientProtocol) {
        self.apollo = apollo
    }
}
