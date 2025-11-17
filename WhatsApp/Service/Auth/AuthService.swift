//
//  AuthService.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 17.11.2025.
//

import Combine
import FirebaseAuth
import FirebaseAuthCombineSwift
import Foundation

final class AuthService: AuthServiceProtocol {
    private let service = Auth.auth()

    var isUserAuthenticated: Bool {
        return service.currentUser != nil
    }

    private(set) var currentUser: User?

    init(currentUser: User? = nil) {
        self.currentUser = currentUser
    }

    func signInAnonymus() -> AnyPublisher<User, Error> {
        if let current = service.currentUser {
            return Just(current)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }

        return service.signInAnonymously()
            .map(\.user)
            .mapError { $0 }
            .eraseToAnyPublisher()
    }
}
