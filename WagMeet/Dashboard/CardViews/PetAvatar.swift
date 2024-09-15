//
//  PetAvatar.swift
//  WagMeet
//
//  Created by Sankritya Thakur on 9/13/24.
//

import SwiftUI

// Pet Avatar View
struct PetAvatar: View {
    var petName: String
    var imageName: String

    var body: some View {
        VStack {
            Image(imageName) // Replace with actual image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))

            Text(petName)
                .font(Font.custom("Montserrat-Bold", size: 14))
                .foregroundColor(.white)
        }
    }
}

