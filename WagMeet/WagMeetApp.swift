//
//  WagMeetApp.swift
//  WagMeet
//
//  Created by Sankritya Thakur on 9/9/24.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct WagMeetApp: App {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false

    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            if !hasSeenOnboarding {
                OnboardingView() // Show onboarding if not seen
            } else if isLoggedIn {
                MainTabBar() // Include the bottom tab bar for navigation
            } else {
                LogInView() // Show login if not logged in
            }
        }
    }
}
