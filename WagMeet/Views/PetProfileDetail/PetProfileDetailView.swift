//
//  PetProfileDetailView.swift
//  WagMeet
//
//  Created by Sankritya Thakur on 9/14/24.
//

import SwiftUI

struct PetProfileDetailView: View {
    var petProfile: PetProfile

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Top Section with Overlapping Images
                ZStack {
                    // Owner's Image
                    CircleImage(image: petProfile.ownerImage ?? UIImage(named: "ownerImage")!, size: 120)
                        .offset(x: -40)

                    // Dog's Image
                    CircleImage(image: petProfile.dogImage ?? UIImage(named: "dogImage")!, size: 120)
                        .offset(x: 40)
                }
                .padding(.top, 40)

                // Owner and Dog Information
                VStack(spacing: 8) {
                    Text("\(petProfile.ownerName) & \(petProfile.dogName)")
                        .font(Font.custom("Montserrat-Bold", size: 24))
                        .foregroundColor(.white)

                    Text("\(petProfile.dogBreed), \(petProfile.dogAge) years old")
                        .font(Font.custom("Montserrat-Regular", size: 16))
                        .foregroundColor(.white.opacity(0.8))

                    // Dog's Gender and Temperament
                    Text("Gender: \(petProfile.dogGender)")
                        .font(Font.custom("Montserrat-Regular", size: 14))
                        .foregroundColor(.white.opacity(0.8))

                    Text("Temperament: \(petProfile.dogTemperament)")
                        .font(Font.custom("Montserrat-Regular", size: 14))
                        .foregroundColor(.white.opacity(0.8))

                    // Vaccination Status
                    HStack {
                        Text("Vaccinated:")
                            .font(Font.custom("Montserrat-Regular", size: 14))
                            .foregroundColor(.white.opacity(0.8))
                        Image(systemName: petProfile.isVaccinated ? "checkmark.seal.fill" : "xmark.seal.fill")
                            .foregroundColor(petProfile.isVaccinated ? .green : .red)
                    }

                    // Bios
                    if !petProfile.ownerBio.isEmpty {
                        Text(petProfile.ownerBio)
                            .font(Font.custom("Montserrat-Regular", size: 14))
                            .foregroundColor(.white.opacity(0.9))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    if !petProfile.dogBio.isEmpty {
                        Text(petProfile.dogBio)
                            .font(Font.custom("Montserrat-Regular", size: 14))
                            .foregroundColor(.white.opacity(0.9))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                }

                // Preferred Parks
                if !petProfile.preferredParks.isEmpty {
                    SectionHeader(title: "Preferred Parks")
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(petProfile.preferredParks, id: \.self) { park in
                            HStack {
                                Image(systemName: "mappin.and.ellipse")
                                    .foregroundColor(.white)
                                Text(park)
                                    .font(Font.custom("Montserrat-Regular", size: 14))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding(.horizontal)
                }

                // Availabilities
                SectionHeader(title: "Availabilities")
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(.white)
                        Text("Days: \(petProfile.availableDays.joined(separator: ", "))")
                            .font(Font.custom("Montserrat-Regular", size: 14))
                            .foregroundColor(.white)
                    }
                    HStack {
                        Image(systemName: "clock")
                            .foregroundColor(.white)
                        Text("Time: \(petProfile.availableTimeRange)")
                            .font(Font.custom("Montserrat-Regular", size: 14))
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal)

                // Request Playdate Button
                Button(action: {
                    // Handle playdate request
                }) {
                    Text("Request Playdate")
                        .font(Font.custom("Montserrat-SemiBold", size: 18))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }

                Spacer()
            }
            .padding(.bottom, 40)
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.6)]),
                           startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
        )
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }

    // Custom Views (reuse from ProfileView)
    struct CircleImage: View {
        var image: UIImage
        var size: CGFloat

        var body: some View {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size, height: size)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 5)
        }
    }

    struct SectionHeader: View {
        var title: String

        var body: some View {
            Text(title)
                .font(Font.custom("Montserrat-Bold", size: 20))
                .foregroundColor(.white)
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
        }
    }
}


