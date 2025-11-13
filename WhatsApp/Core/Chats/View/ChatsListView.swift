//
//  ChatsListView.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 13.11.2025.
//

import SwiftUI

struct ChatsListView: View {
    @EnvironmentObject var viewModel: ChatsViewModel

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(0 ..< 10, id: \.self) { _ in
                    ChatsSegmentView()
                }

                Spacer()
            }
        }
    }
}
