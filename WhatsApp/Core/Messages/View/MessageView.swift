//
//  MessageView.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 15.11.2025.
//

import SwiftUI

struct MessageView: View {
    let message: Message
    let isMe: Bool

    var body: some View {
        HStack {
            if isMe { Spacer() }
            HStack {
                Text(message.message)

                Text(message.timestamp.toHourMinute())
                    .foregroundStyle(.colorSecondary)
                    .font(.footnote)
                    .fontWeight(.regular)
                    .padding(.top)

                if isMe {
                    Image("icon-message-status-active")
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
