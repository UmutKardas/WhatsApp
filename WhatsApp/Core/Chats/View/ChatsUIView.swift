//
//  ChatsUIView.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 3.11.2025.
//

import SwiftUI

struct ChatsUIView: View {
    @StateObject var viewModel: ChatsViewModel = .init(selectedCategory: .All)

    var body: some View {
        VStack {
            ChatsHeaderView()
            ChatsTitleBarView()
            ChatsListView()
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    ChatsUIView()
}
