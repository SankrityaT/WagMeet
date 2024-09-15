//
//  RecentActivityCard.swift
//  WagMeet
//
//  Created by Sankritya Thakur on 9/14/24.
//

import Foundation
import SwiftUI


struct RecentActivityCard: View {
    var activity: String

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Activity Text
            Text(activity)
                .font(Font.custom("Montserrat-SemiBold", size: 16))
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .truncationMode(.tail)

            // Time Ago Label
            Text("Just now")  // You can pass this as a variable as well
                .font(Font.custom("Montserrat-Regular", size: 12))
                .foregroundColor(.white.opacity(0.6))
            
            // View Request Button (with NavigationLink)
            NavigationLink(destination: PlaydateRequestReview(
                requesterPetName: "Buddy",
                requesterOwnerName: "Alex",
                recipientPetName: "Luna",
                selectedDay: 14,
                selectedMonth: 9,
                selectedYear: 2024,
                selectedHour: 5,
                selectedMinute: 30,
                isAM: true,
                selectedPark: "Central Park Dog Run",
                message: "Looking forward to meeting Luna!")) {
                Text("View Request")
                    .font(Font.custom("Montserrat-SemiBold", size: 14))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
        }
        .padding(16)
        .background(Color.blue.opacity(0.6))  // Background color for the card
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

struct RecentActivityCard_Previews: PreviewProvider {
    static var previews: some View {
        RecentActivityCard(activity: "You have a new playdate request from Buddy")
            .padding()
            .background(Color.gray)
            .previewLayout(.sizeThatFits)
    }
}
