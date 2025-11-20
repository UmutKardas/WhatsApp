//
//  MessagesUIView.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 15.11.2025.
//

import SwiftUI

struct MessagesUIView: View {
    @StateObject private var viewModel: MessagesViewModel
    var chatSession: (Chat?, AppUser)

    init(chatSession: (Chat?, AppUser)) {
        _viewModel = StateObject(wrappedValue: MessagesViewModel(chatSession: chatSession))
        self.chatSession = chatSession
    }

    var body: some View {
        ZStack {
            Image("background-messages")
                .resizable()
                .scaledToFill()

            VStack {
                MessagesHeaderView()

                Spacer()

                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(viewModel.messages) { message in
                        MessageView(message: message, isMe: viewModel.messageIsMine(message: message))
                    }
                }
                .padding()

                Spacer()

                MessagesBottomView()
            }
        }
        .environmentObject(viewModel)
    }
}
