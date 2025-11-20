//
//  MessagesTextField.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 15.11.2025.
//

import SwiftUI

struct MessagesTextField: View {
    @EnvironmentObject var viewModel: MessagesViewModel

    var body: some View {
        HStack {
            TextField("Message", text: $viewModel.messageTextField)
                .foregroundColor(Color.colorPrimary)
                .font(.system(size: 18))
                .onSubmit {
                    viewModel.sendMessage()
                }

            Image("icon-sticker")
                .renderingMode(.template)
                .foregroundStyle(Color.primary)
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
        .background(Color.colorChatBackground)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}
