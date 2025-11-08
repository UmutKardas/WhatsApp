//
//  ChatsSearchBarView.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 8.11.2025.
//

import SwiftUI

struct ChatsSearchBarView: View {
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width

            ZStack(alignment: .leading) {
                Color("color-button-background")

                HStack {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .foregroundStyle(Color("color-tabbar-text"))
                        .frame(width: 24, height: 24)

                    TextField(
                        "",
                        text: .constant(""),
                        prompt: Text("Search")
                            .foregroundColor(Color("color-tabbar-text"))
                            .font(.title2)
                    )
                    .foregroundColor(Color("color-tabbar-text"))
                    .font(.title2)
                }
                .padding(.horizontal, width * 0.08)
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .frame(height: width * 0.12)
        }
    }
}
