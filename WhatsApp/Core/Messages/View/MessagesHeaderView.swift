//
//  MessagesHeaderView.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 15.11.2025.
//

import SwiftUI

struct MessagesHeaderView: View {
    @EnvironmentObject var viewModel: MessagesViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image("icon-chevron-lt")
                    .foregroundStyle(.colorPrimary)
            }
            .padding(.horizontal)

            Image("avatar-default")
                .resizable()
                .foregroundStyle(.black)
                .frame(width: 36, height: 36)
                .clipShape(Circle())

            Text(viewModel.chatSession.1.username)
                .foregroundStyle(.colorPrimary)
                .font(.headline)
                .fontWeight(.medium)

            Spacer()

            Image("icon-video")
                .foregroundStyle(.colorPrimary)

            Image("icon-phone")
                .foregroundStyle(.colorPrimary)
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, alignment: .top)
        .frame(height: 80)
        .background(Color.colorPanel)
        .safeAreaPadding(.top)
    }
}
