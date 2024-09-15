//
//  DashboardView.swift
//  WagMeet
//
//  Created by Sankritya Thakur on 9/9/24.
//

import SwiftUI



struct DashboardView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Welcome Message
                    Text("Welcome, Jamie and Luna")
                        .font(Font.custom("Montserrat-Bold", size: 24))
                        .foregroundColor(.white)
                        .padding(.top, 50) // Ensure it starts from a good position
                        .lineLimit(1)
                        .minimumScaleFactor(0.8) // Text scaling for smaller screens
                        .frame(maxWidth: geometry.size.width * 0.9, alignment: .leading)
                    
                    // Upcoming Playdates Section
                    Text("Your Upcoming Playdates")
                        .font(.custom("Montserrat-SemiBold", size: 18))
                        .foregroundColor(.white.opacity(0.8))
                        .padding(.horizontal)
                        .frame(maxWidth: geometry.size.width * 0.9, alignment: .leading)
                    
                    // Horizontal Scroll of Playdates
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            PlaydateCard(petName: "Buddy", petBreed: "Golden Retriever", location: "Central Park", time: "Tomorrow, 5:00 PM")
                                .frame(width: geometry.size.width * 0.78) // 78% of screen width

                            PlaydateCard(petName: "Charlie", petBreed: "Poodle", location: "Riverside Park", time: "Today, 3:00 PM")
                                .frame(width: geometry.size.width * 0.78) // 78% of screen width
                        }
                        .padding(.horizontal)
                    }
                

                    // Playdate History Section
                    Text("Your Playdate History")
                        .font(.custom("Montserrat-SemiBold", size: 18))
                        .foregroundColor(.white.opacity(0.8))
                        .padding(.horizontal)
                        .padding(.top, 20)
                        .frame(maxWidth: geometry.size.width * 0.9, alignment: .leading)
                    
                    // Horizontal Scroll for Playdate History
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            PlaydateHistoryCard(petName: "Max", time: "Last week, 2:00 PM")
                                .frame(width: geometry.size.width * 0.78)

                            PlaydateHistoryCard(petName: "Rocky", time: "2 weeks ago, 4:00 PM")
                                .frame(width: geometry.size.width * 0.78)
                        }
                        .padding(.horizontal)
                    }
                    
                    ScrollView {
                        VStack(spacing: 20) {
                            // Recent Activity Section
                            Text("Recent Activity")
                                .font(.custom("Montserrat-SemiBold", size: 18))
                                .foregroundColor(.white.opacity(0.8))
                                .padding(.horizontal)
                                .padding(.top, 20)
                                .frame(maxWidth: geometry.size.width * 1, alignment: .leading)

                            // Horizontal ScrollView for RecentActivityCards
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(0..<5) { _ in
                                        RecentActivityCard(activity: "You have a new playdate request from Buddy")
                                            .frame(width: geometry.size.width * 0.85) // 85% width for each card
                                            .padding(.horizontal, 10)
                                    }
                                }
                                .padding(.horizontal) // Padding for the scroll view
                            }

                            Spacer()
                        }
                    }
                    
                    // Pet Profile Summary Section
                    Text("Your Pet Profile")
                        .font(.custom("Montserrat-SemiBold", size: 18))
                        .foregroundColor(.white.opacity(0.8))
                        .padding(.horizontal)
                        .frame(maxWidth: geometry.size.width * 0.9, alignment: .leading)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(samplePetProfiles) { petProfile in
                                PetProfileCard(petProfile: petProfile)
                                    .frame(width: geometry.size.width * 0.78) // 78% of screen width
                            }
                        }
                        .padding(.horizontal)
                    }


                    Spacer()
                }
                .padding()
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.purple.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                
                )
            }
        }
    }
}

#Preview {
    DashboardView()
}
