//
//  MessageServiceProtocol.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 18.11.2025.
//

import Combine

protocol MessageServiceProtocol {
    func createMessage(firstId: String, secondId: String) -> AnyPublisher<Bool, Error>
    func sendMessage(senderId: String, receiverId: String, message: String) -> AnyPublisher<Bool, Error>
    func getChats(userId: String, friendIds: [String]) -> AnyPublisher<[Chat], Error>
    func getChat(userId: String, friendId: String) -> AnyPublisher<Chat?, Error>
    func getMessage(chatId: String, messageId: String) -> AnyPublisher<Message?, Error>
    func observeMessages(between firstId: String, and secondId: String) -> AnyPublisher<[Message], Error>
    func getDocumentId(firstId: String, secondId: String) -> String
}
