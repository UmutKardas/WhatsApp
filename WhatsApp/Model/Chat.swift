//
//  Chat.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 19.11.2025.
//

import Foundation

struct Chat: Codable {
    var id: String
    var userIds: [String]
    var messages: [Message]

    init(userIds: [String]) {
        self.id = UUID().uuidString
        self.userIds = userIds
        self.messages = []
    }
}
