//
//  ChatsSegmentView.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 13.11.2025.
//

import SwiftUI

struct ChatsSegmentView: View {
    var chatSession: (Chat, AppUser)

    var body: some View {
        Button {} label: {
            VStack {
                Divider()
                    .padding(.leading, 60)
                    .foregroundStyle(.colorSecondary)

                HStack(alignment: .top) {
                    Circle()
                        .frame(width: 60, height: 60)
                        .foregroundStyle(.colorPrimary)

                    VStack(alignment: .leading) {
                        Text("\(chatSession.1.username)")
                            .font(.headline)
                            .foregroundStyle(.colorPrimary)

                        Text("\(chatSession.0.lastChatMessage?.message ?? "")")
                            .font(.headline)
                            .fontWeight(.regular)
                            .foregroundStyle(.colorSecondary)
                    }

                    Spacer()

                    Text("\(chatSession.0.lastChatMessage?.timestamp.toHourMinute() ?? "00:00")")
                        .foregroundStyle(.colorSecondary)
                        .font(.headline)
                        .fontWeight(.regular)
                }
            }
        }
    }
}
