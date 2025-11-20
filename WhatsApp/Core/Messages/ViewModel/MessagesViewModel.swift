//
//  MessagesViewModel.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 15.11.2025.
//

import Combine
import FirebaseAuth

final class MessagesViewModel: ObservableObject {
    @Published var messages: [Message] = []
    @Published var messageTextField: String = ""

    var chatSession: (Chat?, AppUser)
    private var messageService: MessageServiceProtocol
    private var cancellables: Set<AnyCancellable> = .init()

    init(chatSession: (Chat?, AppUser), messageService: MessageServiceProtocol = AppContainer.shared.messageService) {
        self.chatSession = chatSession
        self.messageService = messageService
        observedMessages()
    }

    private func observedMessages() {
        guard let userId = Auth.auth().currentUser?.uid else { return }

        messageService.observeMessages(between: userId, and: chatSession.1.id).sink { completion in
            if case .failure(let error) = completion {
                print("observeMessages error:", error.localizedDescription)
            }
        } receiveValue: { [weak self] messages in
            self?.messages = messages
        }
        .store(in: &cancellables)
    }

    func sendMessage() {
        guard !messageTextField.isEmpty else { return }
        guard let userId = Auth.auth().currentUser?.uid else { return }

        messageService.sendMessage(senderId: userId, receiverId: chatSession.1.id, message: messageTextField)
            .sink { completion in
                if case .failure(let error) = completion {
                    print("sendmessage error:", error.localizedDescription)
                }
            } receiveValue: { [weak self] completion in
                if completion {
                    self?.messageTextField = ""
                }
            }
            .store(in: &cancellables)
    }

    func messageIsMine(message: Message) -> Bool {
        return message.senderID == Auth.auth().currentUser?.uid
    }
}
