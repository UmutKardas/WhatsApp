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
    func observeMessage(between firstId: String, and secondId: String) -> AnyPublisher<[Message], Error>
    func getDocumentId(firstId: String, secondId: String) -> String
}
