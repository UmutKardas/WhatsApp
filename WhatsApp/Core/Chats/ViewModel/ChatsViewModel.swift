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
    @Published var chatSessions: [String: Chat?] = [:]
    @Published var usersById: [String: AppUser] = [:]
    @Published var lastMessageByChatId: [String: Message] = [:]
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
                self?.fetchFriendChats(user: fetchedUser)
                self?.fetchFriendUsers(user: fetchedUser)
            }
            .store(in: &cancellables)
    }

    private func fetchFriendChats(user: AppUser?) {
        guard let friendIds = user?.friendIds, let userId = user?.id else {
            return
        }

        for friendId in friendIds {
            messageService.getChat(userId: userId, friendId: friendId)
                .sink { completion in
                    if case .failure(let error) = completion {
                        print("error: \(error.localizedDescription)")
                    }
                } receiveValue: { [weak self] chat in
                    self?.chatSessions[friendId] = chat
                    self?.fetchLastMessage(chat: chat)
                }
                .store(in: &cancellables)
        }
    }

    private func fetchFriendUsers(user: AppUser?) {
        guard let friendIds = user?.friendIds else {
            return
        }

        for friendId in friendIds {
            databaseService.fetch(path: .users, documentId: friendId, type: AppUser.self, source: .server)
                .sink { completion in
                    if case .failure(let error) = completion {
                        print("error: \(error.localizedDescription)")
                    }
                } receiveValue: { [weak self] user in
                    self?.usersById[user.id] = user
                }
                .store(in: &cancellables)
        }
    }

    private func fetchLastMessage(chat: Chat?) {
        guard let chat = chat, !chat.lastChatMessageId.isEmpty else { return }
        messageService
            .getMessage(chatId: chat.id, messageId: chat.lastChatMessageId)
            .sink { completion in
                if case .failure(let error) = completion {
                    print("Failed to fetch last message for chatId \(chat.id): \(error.localizedDescription)")
                }
            } receiveValue: { [weak self] message in
                guard let message else { return }
                self?.lastMessageByChatId[chat.id] = message
            }
            .store(in: &cancellables)
    }
}
