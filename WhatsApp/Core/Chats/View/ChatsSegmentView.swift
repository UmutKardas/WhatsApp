//
//  ChatsSegmentView.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 13.11.2025.
//

import SwiftUI

struct ChatsSegmentView: View {
    @EnvironmentObject var viewModel: ChatsViewModel
    var chatSession: (Chat?, AppUser)

    var body: some View {
        NavigationLink {
            MessagesUIView(chatSession: chatSession)
                .navigationBarBackButtonHidden(true)
        } label: {
            VStack {
                Divider()
                    .padding(.leading, 60)
                    .foregroundStyle(.colorSecondary)

                HStack(alignment: .top) {
                    Image("avatar-default")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundStyle(.colorPrimary)
                        .clipShape(Circle())

                    VStack(alignment: .leading) {
                        Text("\(chatSession.1.username)")
                            .font(.headline)
                            .foregroundStyle(.colorPrimary)

                        Text(viewModel.lastMessageByChatId[chatSession.0?.id ?? ""]?.message ?? "")
                            .font(.headline)
                            .fontWeight(.regular)
                            .foregroundStyle(.colorSecondary)
                    }

                    Spacer()

                    Text(viewModel.lastMessageByChatId[chatSession.0?.id ?? ""]?.timestamp.toHourMinute() ?? "")
                        .foregroundStyle(.colorSecondary)
                        .font(.headline)
                        .fontWeight(.regular)
                }
            }
        }
    }
}
