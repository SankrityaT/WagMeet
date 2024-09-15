//
//  PlaydateHistoryCard.swift
//  WagMeet
//
//  Created by Sankritya Thakur on 9/14/24.
//

import SwiftUI

struct PlaydateHistoryCard: View {
    var petName: String
    var time: String
    
    var body: some View {
        VStack(spacing: 12) {
            // Pet Image
            Image("playdateHistoryImage") // Replace with the actual image asset
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .clipped()
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .shadow(radius: 5)

            // Playdate Info
            Text("With \(petName)")
                .font(Font.custom("Montserrat-Bold", size: 16))
                .foregroundColor(.white)
                .lineLimit(1)

            Text("At \(time)")
                .font(Font.custom("Montserrat-Regular", size: 14))
                .foregroundColor(.white.opacity(0.8))
                .lineLimit(1)


        }
        .padding(16)
        .frame(maxWidth: .infinity) // Make the card stretch to the full width with padding
        .background(Color.orange.opacity(0.5))
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding(.horizontal) // Padding from left and right edges
    }
}

struct PlaydateHistoryCard_Previews: PreviewProvider {
    static var previews: some View {
        PlaydateHistoryCard(petName: "Max", time: "2 weeks ago")
            .padding()
            .background(Color.gray)
            .previewLayout(.sizeThatFits)
    }
}



