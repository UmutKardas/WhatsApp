//
//  ChatsSearchBarView.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 8.11.2025.
//

import SwiftUI

struct ChatsSearchBarView: View {
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 20))
                .foregroundColor(Color("color-tabbar-text"))

            TextField("Search", text: .constant(""))
                .foregroundColor(Color("color-tabbar-text"))
                .font(.system(size: 18))
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(Color("color-button-background"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .frame(maxWidth: .infinity)
        .fixedSize(horizontal: false, vertical: true)
    }
}
