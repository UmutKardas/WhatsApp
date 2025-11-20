//
//  Message.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 19.11.2025.
//

import Foundation

struct Message: Codable, Identifiable {
    var id: String
    var senderID: String
    var timestamp: Double
    var message: String
    var messageStatus: MessageStatus?

    init(senderID: String, timestamp: Double, message: String, messageStatus: MessageStatus? = nil) {
        self.id = UUID().uuidString
        self.senderID = senderID
        self.timestamp = timestamp
        self.message = message
        self.messageStatus = messageStatus
    }

    enum CodingKeys: String, CodingKey {
        case id, senderID, timestamp, message, messageStatus
    }
}
