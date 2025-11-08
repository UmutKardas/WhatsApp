//
//  ChatsTitleBarView.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 8.11.2025.
//

import SwiftUI

struct ChatsTitleBarView: View {
    var body: some View {
        VStack {
            Text("Chats")
                .font(.system(size: 42))
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)

            ChatsSearchBarView()
        }
    }
}
