//
//  Chat.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 19.11.2025.
//

import Foundation

struct Chat: Identifiable, Codable {
    var id: String
    var userIds: [String]
    var lastChatMessageId: String

    init(id: String, userIds: [String]) {
        self.id = id
        self.userIds = userIds
        self.lastChatMessageId = ""
    }

    enum CodingKeys: String, CodingKey {
        case id, userIds, lastChatMessageId
    }
}
