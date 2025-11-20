//
//  ChatsListView.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 13.11.2025.
//

import SwiftUI

struct ChatsListView: View {
    @EnvironmentObject var viewModel: ChatsViewModel

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(Array(viewModel.chatSessions), id: \.key) { friendId, chat in
                    if let user = viewModel.usersById[friendId] {
                        ChatsSegmentView(chatSession: (chat, user))
                    }
                }

                Spacer()
            }
        }
    }
}
