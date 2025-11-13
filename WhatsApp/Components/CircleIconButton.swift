//
//  CircleIconButton.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 8.11.2025.
//

import SwiftUI

struct CircleIconButton: View {
    let imageName: String
    let backgroundColor: String
    let foregroundColor: Color?

    init(imageName: String, backgroundColor: String, foregroundColor: Color? = nil) {
        self.imageName = imageName
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
    }

    var body: some View {
        Button {} label: {
            ZStack {
                Circle()
                    .foregroundStyle(Color(backgroundColor))
                    .frame(width: 40, height: 40)

                Image(imageName)
                    .renderingMode(.template)
                    .resizable()
                    .foregroundStyle(foregroundColor ?? .colorPrimary)
                    .frame(width: 30, height: 30)
            }
        }
    }
}
