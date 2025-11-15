//
//  MessagesUIView.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 15.11.2025.
//

import SwiftUI

struct MessagesUIView: View {
    @StateObject var viewModel: MessagesViewModel = .init()

    var body: some View {
        ZStack {
            Image("background-messages")

            VStack {
                MessagesHeaderView()

                Spacer()

                ScrollView(.vertical, showsIndicators: false) {
                    MessageView(text: "Hi There!", isMe: true)
                    MessageView(text: "Hi ", isMe: false)
                    MessageView(text: "How are you today ?", isMe: true)
                    MessageView(text: "Fine", isMe: false)
                    MessageView(text: "Thanks and you ?", isMe: false)
                    MessageView(text: "Fine, thanks", isMe: true)
                    MessageView(text: "Sit down please", isMe: true)
                }
                .padding()

                Spacer()

                MessagesBottomView()
            }
        }
    }
}

#Preview {
    MessagesUIView()
}
