//
//  AuthServiceProtocol.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 17.11.2025.
//

import Combine
import FirebaseAuth

protocol AuthServiceProtocol {
    var isUserAuthenticated: Bool { get }
    var currentUser: User? { get }
    func signInAnonymus() -> AnyPublisher<User, Error>
}
