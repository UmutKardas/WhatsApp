//
//  ChatsSegmentView.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 13.11.2025.
//

import SwiftUI

struct ChatsSegmentView: View {
    var body: some View {
        Button {} label: {
            VStack {
                Divider()
                    .padding(.leading, 60)
                    .foregroundStyle(.colorSecondary)

                HStack(alignment: .top) {
                    Circle()
                        .frame(width: 60, height: 60)
                        .foregroundStyle(.colorPrimary)

                    VStack(alignment: .leading) {
                        Text("Hüseyin Umut Kardaş")
                            .font(.headline)
                            .foregroundStyle(.colorPrimary)

                        Text("Thanks Bro!")
                            .font(.headline)
                            .fontWeight(.regular)
                            .foregroundStyle(.colorSecondary)
                    }

                    Spacer()

                    Text("08:01")
                        .foregroundStyle(.colorSecondary)
                        .font(.headline)
                        .fontWeight(.regular)
                }
            }
        }
    }
}
