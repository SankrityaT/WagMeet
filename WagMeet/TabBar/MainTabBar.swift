//
//  MainTabBar.swift
//  WagMeet
//
//  Created by Sankritya Thakur on 9/9/24.
//

import SwiftUI
import CoreLocation

struct MainTabBar: View {
    @State private var selectedTab: BottomBarSelectedTab = .home
    
        @State private var ownerName: String = "Jamie"
        @State private var ownerBio: String = "Dog lover and outdoor enthusiast."
        @State private var dogName: String = "Luna"
        @State private var dogBreed: String = "Golden Retriever"
        @State private var dogAge: String = "3"
        @State private var dogGender: String = "Female"
        @State private var dogTemperament: String = "Friendly and energetic"
        @State private var dogVaccinationStatus: Bool = true
        @State private var dogBio: String = "Loves playing fetch and making new friends."
        @State private var preferredParks: [String] = ["Central Park Dog Run", "Riverside Dog Park"]
        @State private var availableDays: [String] = ["Monday", "Wednesday", "Friday"]
        @State private var availableTimeRange: String = "9:00 AM - 5:00 PM"
        @State private var photos: [UIImage] = []

    // Define a sample profile
    let tempPetProfile = PetProfile(
        ownerName:"Bo",
        ownerBio: "Pet lover and dog trainer.",
        dogName: "Buddy",
        dogBreed: "Golden Retriever",
        dogAge: 3,
        dogGender: "Male",
        dogTemperament: "Friendly and calm",
        dogBio: "Loves to play fetch and go for long walks.",
        isVaccinated: true,
        coordinate: CLLocationCoordinate2D(latitude: 40.785091, longitude: -73.968285), // Example coordinates
        isAvailable: true,
        isPublicProfile: true,
        preferredParks: ["Central Park", "Madison Square Dog Park"],
        availableDays: ["Monday", "Wednesday", "Friday"],
        availableTimeRange: "9 AM - 5 PM"
    )
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                // Switching between views based on selected tab
                switch selectedTab {
                case .home:
                    DashboardView()
                case .search:
                    NearbyPetsView()
                    
                case .profile:
                    ProfileView(petProfile: samplePetProfiles[0])
                }

                Spacer()

                // Bottom bar at the bottom of the screen
                BottomBar(selectedTab: $selectedTab)
            }
            .accentColor(.blue)
        }
    }
}
