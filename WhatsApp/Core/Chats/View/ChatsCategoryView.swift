//
//  ChatsCategoryView.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 10.11.2025.
//

import SwiftUI

struct ChatsCategoryView: View {
    @EnvironmentObject var viewModel: ChatsViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Category.allCases, id: \.self) { category in
                    Button {
                        viewModel.selectedCategory = category
                    } label: {
                        ZStack {
                            Text(category.rawValue)
                                .font(.callout)
                                .foregroundStyle(viewModel.selectedCategory == category ? .colorCategoryFillText : .colorCategoryText)
                                .padding(.horizontal)
                                .padding(.vertical, 9)
                                .background(viewModel.selectedCategory == category ? .colorCategoryFillTextBackground : .colorCategoryTextBackground)
                                .clipShape(.buttonBorder)
                        }
                    }
                }

                Spacer()
            }
        }
    }
}
