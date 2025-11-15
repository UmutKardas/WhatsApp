//
//  MessageView.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 15.11.2025.
//

import SwiftUI

struct MessageView: View {
    let text: String
    let isMe: Bool

    var body: some View {
        HStack {
            if isMe { Spacer() }
            HStack {
                Text(text)

                Text("16:54")
                    .foregroundStyle(.colorSecondary)
                    .font(.footnote)
                    .fontWeight(.regular)
                    .padding(.top)
                
                if isMe {
                    Image("icon-message-status-disable")
                        .padding(.top)
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(
                ChatBubble(isMe: isMe)
                    .foregroundStyle(isMe ? Color.colorMessage : Color.colorMessageOther)
            )
            .padding(isMe ? .leading : .trailing, 50)
            if !isMe { Spacer() }
        }
        .padding(.vertical, 2)
    }
}

#Preview {
    VStack(spacing: 12) {
        MessageView(text: "Hello There!", isMe: true)
        MessageView(text: "Hi! What's up?", isMe: false)
    }
    .padding()
}
