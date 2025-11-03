//
//  MainTabBarView.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 3.11.2025.
//

import SwiftUI

struct MainTabBarView: View {
    @State private var selectedTab = 0

    var body: some View {
        ZStack {
            VStack {
                Spacer()

                ZStack {
                    switch selectedTab {
                    case 0:
                        ChatsUIView()
                    case 1:
                        UpdatesUIView()
                    case 2:
                        CommunityUIView()
                    case 3:
                        CallsUIView()
                    case 4:
                        SettingsUIView()
                    default:
                        ChatsUIView()
                    }
                }

                Spacer()

                HStack {
                    TabBarIcon(iconName: "bubble.left.and.bubble.right.fill", title: "Chats", tabIndex: 0, selectedTab: $selectedTab)
                    Spacer()
                    TabBarIcon(iconName: "message.badge", title: "Updates", tabIndex: 1, selectedTab:
                        $selectedTab)
                    Spacer()
                    TabBarIcon(iconName: "person.3", title: "Community", tabIndex: 2, selectedTab: $selectedTab)
                    Spacer()
                    TabBarIcon(iconName: "phone", title: "Calls", tabIndex: 3, selectedTab:
                        $selectedTab)
                    Spacer()
                    TabBarIcon(iconName: "gear", title: "Settings", tabIndex: 4, selectedTab:
                        $selectedTab)
                }
                .padding()
                .background(Color.black.opacity(0.8))
            }
        }
    }
}

struct TabBarIcon: View {
    let iconName: String
    let title: String
    let tabIndex: Int
    @Binding var selectedTab: Int

    var body: some View {
        VStack {
            Image(systemName: iconName)
                .renderingMode(.template)
                .foregroundColor(selectedTab == tabIndex ? .white : .gray)
                .font(.title)
            
            Text("\(title)")
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(selectedTab == tabIndex ? .white : .gray)
        }
        .onTapGesture {
            selectedTab = tabIndex
        }
    }
}

#Preview {
    MainTabBarView()
}
