//
//  ChatsHeaderView.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 8.11.2025.
//

import SwiftUI

struct ChatsHeaderView: View {
    var body: some View {
        HStack {
            CircleIconButton(imageName: "icon-meetball-menu", backgroundColor: "color-button-background")

            Spacer()

            CircleIconButton(imageName: "icon-camera-fill", backgroundColor: "color-button-background")

            Spacer()
                .frame(width: 15)

            CircleIconButton(imageName: "icon-plus", backgroundColor: "color-green", foregroundColor: .white)
        }
    }
}
