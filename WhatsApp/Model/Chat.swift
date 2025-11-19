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
    var lastChatMessage: Message?

    init(userIds: [String]) {
        self.id = UUID().uuidString
        self.userIds = userIds
    }

    enum CodingKeys: String, CodingKey {
        case id, userIds, lastChatMessage
    }
}
