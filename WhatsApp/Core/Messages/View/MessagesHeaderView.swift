//
//  MessagesHeaderView.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 15.11.2025.
//

import SwiftUI

struct MessagesHeaderView: View {
    var body: some View {
        HStack {
            Button {
                print("Closed")
            } label: {
                Image("icon-chevron-lt")
                    .foregroundStyle(.colorPrimary)
            }
            .padding(.horizontal)

            Circle()
                .foregroundStyle(.black)
                .frame(width: 36, height: 36)

            Text("Hüseyin Umut")
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
