//
//  ChatsViewModel.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 10.11.2025.
//

import Combine
import FirebaseAuth
import FirebaseFirestore
import Foundation

final class ChatsViewModel: ObservableObject {
    @Published var user: AppUser?
    @Published var chats: [Chat] = []
    @Published var selectedCategory: Category = .All
    @Published var errorMessage: String?

    private let databaseService: DatabaseServiceProtocol
    private let messageService: MessageServiceProtocol
    private var cancellables: Set<AnyCancellable> = .init()

    init(selectedCategory: Category, databaseService: DatabaseServiceProtocol = AppContainer.shared.databaseService, messageService: MessageServiceProtocol = AppContainer.shared.messageService) {
        self.selectedCategory = selectedCategory
        self.databaseService = databaseService
        self.messageService = messageService
        fetchUser()
    }

    private func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            errorMessage = "User not found. Please log in again."
            return
        }

        databaseService
            .fetch(path: .users, documentId: userId, type: AppUser.self, source: .server)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.errorMessage = "Failed to fetch user: \(error.localizedDescription)"
                }
            } receiveValue: { [weak self] fetchedUser in
                self?.user = fetchedUser
            }
            .store(in: &cancellables)
    }

    private func fetchChats(user: AppUser?) {
        guard let userId = user?.id, let friendIds = user?.friendIds else {
            return
        }

        messageService.getChats(userId: userId, friendIds: friendIds)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.errorMessage = "Failed to fetch chats: \(error.localizedDescription)"
                }
            } receiveValue: { [weak self] fetchedChats in
                self?.chats = fetchedChats
            }
            .store(in: &cancellables)
    }
}
