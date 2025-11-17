//
//  AppContainer.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 17.11.2025.
//

import Swinject

final class AppContainer {
    static let shared = AppContainer()
    private let container = Container()

    var authService: AuthServiceProtocol {
        guard let authService = container.resolve(AuthServiceProtocol.self) else {
            fatalError("AuthService could not be resolved")
        }

        return authService
    }

    var databaseService: DatabaseServiceProtocol {
        guard let databaseService = container.resolve(DatabaseServiceProtocol.self) else {
            fatalError("DatabaseService could not be resolved")
        }

        return databaseService
    }

    private init() {
        registerDependency()
    }

    private func registerDependency() {
        container.register(AuthServiceProtocol.self) { _ in AuthService() }
        container.register(DatabaseServiceProtocol.self) { _ in DatabaseService() }
    }
}
