//
//  ChatsViewModel.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 10.11.2025.
//

import Combine
import Foundation

final class ChatsViewModel: ObservableObject {
    @Published var selectedCategory: Category = .All

    init(selectedCategory: Category) {
        self.selectedCategory = selectedCategory
    }
}
