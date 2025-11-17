//
//  TabBarIcon.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 8.11.2025.
//

import SwiftUI

struct TabBarIcon: View {
    let iconName: String
    let fillIconName: String
    let title: String
    let tabIndex: Int
    @Binding var selectedTab: Int

    var body: some View {
        VStack {
            Image(selectedTab == tabIndex ? fillIconName : iconName)
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 36, height: 36)
                .fixedSize(horizontal: true, vertical: true)
                .foregroundColor(Color(selectedTab == tabIndex ? "color-tabbar-fill-text" : "color-tabbar-text"))

            Text("\(title)")
                .font(.subheadline)
                .fontWeight(.medium)
                .fixedSize(horizontal: true, vertical: true)
                .foregroundColor(Color(selectedTab == tabIndex ? "color-tabbar-fill-text" : "color-tabbar-text"))
        }
        .onTapGesture {
            selectedTab = tabIndex
        }
    }
}
