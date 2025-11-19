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

    init(userIds: [String]) {
        self.id = UUID().uuidString
        self.userIds = userIds
    }

    enum CodingKeys: String, CodingKey {
        case id, userIds
    }
}
