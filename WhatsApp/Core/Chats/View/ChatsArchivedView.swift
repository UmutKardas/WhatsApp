//
//  ChatsArchivedView.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 13.11.2025.
//

import SwiftUI

struct ChatsArchivedView: View {
    var body: some View {
        Button {} label: {
            HStack {
                Image("icon-archive")
                    .renderingMode(.template)
                    .foregroundStyle(.colorSecondary)
                    .padding(.horizontal)

                Text("Archived")
                    .foregroundStyle(.colorPrimary)
                    .font(.headline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 5)
        }
    }
}
