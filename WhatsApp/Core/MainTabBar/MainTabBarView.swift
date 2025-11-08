//
//  MainTabBarView.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 3.11.2025.
//

import SwiftUI

struct MainTabBarView: View {
    @State private var selectedTab = 3

    var body: some View {
        ZStack {
            Color.colorMain
                .ignoresSafeArea(.all)

            VStack {
                Spacer()

                ZStack {
                    switch selectedTab {
                    case 0:
                        UpdatesUIView()
                    case 1:
                        CallsUIView()
                    case 2:
                        CommunityUIView()
                    case 3:
                        ChatsUIView()
                    case 4:
                        SettingsUIView()
                    default:
                        ChatsUIView()
                    }
                }

                Spacer()

                HStack {
                    TabBarIcon(iconName: "icon-status", fillIconName: "icon-status-fill", title: "Updates", tabIndex: 0, selectedTab: $selectedTab)
                    Spacer()
                    TabBarIcon(iconName: "icon-calls", fillIconName: "icon-calls-fill", title: "Calls", tabIndex: 1, selectedTab:
                        $selectedTab)
                    Spacer()
                    TabBarIcon(iconName: "icon-communities", fillIconName: "icon-communities-fill", title: "Communities", tabIndex: 2, selectedTab: $selectedTab)
                    Spacer()
                    TabBarIcon(iconName: "icon-chats", fillIconName: "icon-chats-fill", title: "Chats", tabIndex: 3, selectedTab:
                        $selectedTab)
                    Spacer()
                    TabBarIcon(iconName: "icon-settings", fillIconName: "icon-settings-fill", title: "Settings", tabIndex: 4, selectedTab:
                        $selectedTab)
                }
                .padding()
                .background(Color("color-tabbar"))
            }
        }
    }
}

#Preview {
    MainTabBarView()
}
