//
//  MessagesBottomView.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 15.11.2025.
//

import SwiftUI

struct MessagesBottomView: View {
    var body: some View {
        HStack {
            Image(systemName: "plus")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundStyle(Color.primary)

            MessagesTextField()

            Image("icon-camera-small")

            Image("icon-mic")
        }
        .frame(maxWidth: .infinity, alignment: .bottom)
        .padding(.horizontal)
        .frame(height: 100)
        .background(Color.colorPanel
            .background(.ultraThinMaterial)
        )
        .safeAreaPadding(.bottom)
    }
}
