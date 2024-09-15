//
//  BottomBar.swift
//  WagMeet
//
//  Created by Sankritya Thakur on 9/9/24.
//

enum BottomBarSelectedTab: Int {
    case home = 0
    case search = 1
    case profile = 2
}


import SwiftUI



struct BottomBar: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var selectedTab: BottomBarSelectedTab

    var body: some View {
        HStack(spacing: 40) { // Adjust spacing for layout
            // Home Button
            Button(action: {
                selectedTab = .home
            }) {
                BottomBarButton(image: "house.fill", text: "Home", isSelected: selectedTab == .home)
            }

            // Search Playdate Button
            Button(action: {
                selectedTab = .search
            }) {
                BottomBarButton(image: "pawprint.fill", text: "Playdates", isSelected: selectedTab == .search)
            }

            // Profile Button
            Button(action: {
                selectedTab = .profile
            }) {
                BottomBarButton(image: "person.fill", text: "Profile", isSelected: selectedTab == .profile)
            }
        }
        .frame(height: 70) // Adjust height as needed
        .padding(.horizontal, 20) // Add padding for layout
        .background(
            Group {
                if colorScheme == .dark {
                    Color.black.opacity(0.85)
                } else {
                    Color.white.shadow(radius: 5)
                }
            }
        )
    }
}


struct BottomBarButton: View {
    var image: String
    var text: String
    var isSelected: Bool
    
    var body: some View {
        VStack {
            Image(systemName: image)
                .font(.system(size: 24))
                .foregroundColor(isSelected ? .blue : .gray)
            Text(text)
                .font(.caption)
                .foregroundColor(isSelected ? .blue : .gray)
        }
    }
}
