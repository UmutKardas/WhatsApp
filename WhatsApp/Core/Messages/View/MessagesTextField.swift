//
//  MessagesTextField.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 15.11.2025.
//

import SwiftUI

struct MessagesTextField: View {
    var body: some View {
        HStack {
            TextField("Message", text: .constant(""))
                .foregroundColor(Color.colorPrimary)
                .font(.system(size: 18))

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
