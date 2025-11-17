//
//  AppUser.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 18.11.2025.
//

struct AppUser: Encodable {
    var id: String
    var username: String

    init(id: String, username: String) {
        self.id = id
        self.username = username
    }
}
