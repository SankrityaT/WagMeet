//
//  PetProfileCard.swift
//  WagMeet
//
//  Created by Sankritya Thakur on 9/14/24.
//

import SwiftUI

struct PetProfileCard: View {
    var petProfile: PetProfile

    var body: some View {
        VStack(spacing: 12) {
            // Pet Image
            Image(uiImage: petProfile.dogImage ?? UIImage(named: "petProfileImage")!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .clipped()
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .shadow(radius: 5)

            // Pet Name, Breed, and Age
            Text("\(petProfile.dogName)")
                .font(Font.custom("Montserrat-Bold", size: 16))
                .foregroundColor(.white)
                .lineLimit(1)

            Text("\(petProfile.dogBreed) - \(petProfile.dogAge) years old")
                .font(Font.custom("Montserrat-Regular", size: 14))
                .foregroundColor(.white.opacity(0.8))
                .lineLimit(1)

            // View Profile Button as NavigationLink
            NavigationLink(destination: PetProfileDetailView(petProfile: petProfile)) {
                Text("View Profile")
                    .font(Font.custom("Montserrat-SemiBold", size: 14))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity) // Covers the full width with padding
        .background(Color.purple.opacity(0.5))
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding(.horizontal) // Padding on both sides
    }
}

struct PetProfileCard_Previews: PreviewProvider {
    static var previews: some View {
        PetProfileCard(petProfile: samplePetProfiles[0])
            .padding()
            .background(Color.gray)
            .previewLayout(.sizeThatFits)
    }
}

