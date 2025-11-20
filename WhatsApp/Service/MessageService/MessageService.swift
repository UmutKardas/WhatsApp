//
//  MessageService.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 18.11.2025.
//

import Combine
import FirebaseFirestore
import FirebaseFirestoreCombineSwift

final class MessageService: MessageServiceProtocol {
    private var databaseService: DatabaseServiceProtocol
    private let database: Firestore = .firestore()

    init(databaseService: DatabaseServiceProtocol = AppContainer.shared.databaseService) {
        self.databaseService = databaseService
    }

    func createMessage(firstId: String, secondId: String) -> AnyPublisher<Bool, Error> {
        let chatId = getDocumentId(firstId: firstId, secondId: secondId)
        let chat = Chat(id: chatId, userIds: [firstId, secondId])
        return databaseService.add(path: .chat, documentId: chatId, data: chat)
    }

    func sendMessage(senderId: String, receiverId: String, message: String) -> AnyPublisher<Bool, Error> {
        let chatId = getDocumentId(firstId: senderId, secondId: receiverId)

        func continuePipeline() -> AnyPublisher<Bool, Error> {
            let timestamp: TimeInterval = Date().timeIntervalSince1970
            let message = Message(senderID: senderId, timestamp: timestamp, message: message)

            let docReference = database
                .collection(DatabasePath.chat.rawValue)
                .document(chatId)
                .collection(DatabasePath.messages.rawValue)
                .document(message.id)

            return docReference
                .setData(from: message)
                .map { _ in message }
                .flatMap { message in
                    var updateFields: [String: Any] = [Chat.CodingKeys.lastChatMessageId.rawValue: message.id]
                    return self.updateChat(chatId: chatId, updateFields: updateFields)
                }
                .mapError { $0 }
                .eraseToAnyPublisher()
        }

        return databaseService
            .checkDocumentExists(path: .chat, documentId: chatId, source: .server)
            .flatMap { hasDocument -> AnyPublisher<Bool, Error> in
                if hasDocument {
                    return continuePipeline()
                } else {
                    return self.createMessage(firstId: senderId, secondId: receiverId)
                        .flatMap { _ in continuePipeline() }
                        .eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }

    func updateChat(chatId: String, updateFields: [String: Any]) -> AnyPublisher<Bool, Error> {
        Future { promise in
            self.database
                .collection(DatabasePath.chat.rawValue)
                .document(chatId)
                .updateData(updateFields) { error in
                    if let error {
                        promise(.failure(error))
                    } else {
                        promise(.success(true))
                    }
                }
        }
        .eraseToAnyPublisher()
    }

    func getChats(userId: String, friendIds: [String]) -> AnyPublisher<[Chat], Error> {
        let chatIds = friendIds.map { friendId in
            getDocumentId(firstId: userId, secondId: friendId)
        }

        let publishers = chatIds.map { chatId in
            database.collection(DatabasePath.chat.rawValue)
                .document(chatId)
                .getDocument()
                .tryMap { snapshot -> Chat? in
                    guard snapshot.exists else { return nil }
                    return try snapshot.data(as: Chat.self)
                }
                .eraseToAnyPublisher()
        }

        return Publishers.MergeMany(publishers)
            .collect()
            .map { chats in
                chats.compactMap { $0 }
            }
            .eraseToAnyPublisher()
    }

    func getChat(userId: String, friendId: String) -> AnyPublisher<Chat?, Error> {
        let chatId = getDocumentId(firstId: userId, secondId: friendId)
        let query = database
            .collection(DatabasePath.chat.rawValue)
            .document(chatId)

        return query
            .getDocument()
            .tryMap { snapshot in
                guard snapshot.exists else {
                    return nil
                }

                return try snapshot.data(as: Chat.self)
            }
            .eraseToAnyPublisher()
    }

    func getMessage(chatId: String, messageId: String) -> AnyPublisher<Message?, Error> {
        let docRef = database
            .collection(DatabasePath.chat.rawValue)
            .document(chatId)
            .collection(DatabasePath.messages.rawValue)
            .document(messageId)

        return docRef
            .getDocument()
            .tryMap { snapshot in
                guard snapshot.exists else {
                    return nil
                }
                return try snapshot.data(as: Message.self)
            }
            .eraseToAnyPublisher()
    }

    func observeMessages(between firstId: String, and secondId: String) -> AnyPublisher<[Message], Error> {
        let chatId = getDocumentId(firstId: firstId, secondId: secondId)
        let query = database
            .collection(DatabasePath.chat.rawValue)
            .document(chatId)
            .collection(DatabasePath.messages.rawValue)
            .order(by: Message.CodingKeys.timestamp.rawValue, descending: false)

        return query
            .snapshotPublisher()
            .tryMap { snapshot in
                try snapshot.documents.map { doc in
                    try doc.data(as: Message.self)
                }
            }
            .eraseToAnyPublisher()
    }

    func getDocumentId(firstId: String, secondId: String) -> String {
        return min(firstId, secondId) + "_" + max(firstId, secondId)
    }
}
