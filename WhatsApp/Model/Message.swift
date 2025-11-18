//
//  Message.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 19.11.2025.
//

import Foundation

struct Message: Codable {
    var id: String
    var senderID: String
    var timestamp: Int
    var message: String
    var messageStatus: MessageStatus?

    init(senderID: String, timestamp: Int, message: String, messageStatus: MessageStatus? = nil) {
        self.id = UUID().uuidString
        self.senderID = senderID
        self.timestamp = timestamp
        self.message = message
        self.messageStatus = messageStatus
    }
}
