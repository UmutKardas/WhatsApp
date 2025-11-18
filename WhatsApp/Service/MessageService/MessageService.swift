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
    var databaseService: DatabaseServiceProtocol
    private let database: Firestore = .firestore()

    init(databaseService: DatabaseServiceProtocol = AppContainer.shared.databaseService) {
        self.databaseService = databaseService
    }

    func createMessage(firstId: String, secondId: String) -> AnyPublisher<Bool, Error> {
        return Just(true)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func sendMessage(senderId: String, receiverId: String, message: String) -> AnyPublisher<Bool, Error> {
        return Just(true)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func observeMessage(between firstId: String, and secondId: String) -> AnyPublisher<[Message], Error> {
        let chatId = getDocumentId(firstId: firstId, secondId: secondId)
        let query = database
            .collection(DatabasePath.messages.rawValue)
            .document(chatId)
            .collection("items")
            .order(by: "timestamp", descending: false)

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
