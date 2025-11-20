//
//  AppUser.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 18.11.2025.
//

struct AppUser: Identifiable, Codable {
    var id: String
    var username: String
    var friendIds: [String]?

    init(id: String, username: String) {
        self.id = id
        self.username = username
        self.friendIds = []
    }
}
