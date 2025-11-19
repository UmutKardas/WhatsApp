//
//  MainTabBarViewModel.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 18.11.2025.
//

import Combine
import FirebaseAuth
import FirebaseFirestore

final class MainTabBarViewModel: ObservableObject {
    @Published var chats: [Chat] = []

    private var authService: AuthServiceProtocol
    private var databaseService: DatabaseServiceProtocol
    private var cancellables: Set<AnyCancellable> = .init()
    private var errorMessage: String?

    private(set) var user: AppUser?

    init(authService: AuthServiceProtocol = AppContainer.shared.authService, databaseService: DatabaseServiceProtocol = AppContainer.shared.databaseService) {
        self.authService = authService
        self.databaseService = databaseService
        signIn()
    }

    private func signIn() {
        authService.signInAnonymus().sink { [weak self] completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
            }
        } receiveValue: { [weak self] user in
            self?.checkUserExist(user: user)
        }
        .store(in: &cancellables)
    }

    private func checkUserExist(user: User?) {
        guard let user = user else {
            errorMessage = "User ID not found"
            return
        }

        databaseService.checkDocumentExists(path: .users, documentId: user.uid, source: .server)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] exists in
                if !exists {
                    self?.recordUser(user: user)
                }
            }
            .store(in: &cancellables)
    }

    private func recordUser(user: User?) {
        guard let user = user else {
            errorMessage = "User ID not found"
            return
        }

        let appUser = AppUser(id: user.uid, username: "Test User")

        databaseService.add(path: .users, documentId: user.uid, data: appUser)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] isCompletion in
                if isCompletion {
                    self?.user = appUser
                }
            }
            .store(in: &cancellables)
    }
}
