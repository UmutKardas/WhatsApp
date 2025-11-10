//
//  ChatsCategoryView.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 10.11.2025.
//

import SwiftUI

struct ChatsCategoryView: View {
    var body: some View {
        ScrollView {
            HStack {
                ForEach(Category.allCases, id: \.self) { category in
                    Button {} label: {
                        Text(category.rawValue)
                    }
                }
            }
        }
    }
}
