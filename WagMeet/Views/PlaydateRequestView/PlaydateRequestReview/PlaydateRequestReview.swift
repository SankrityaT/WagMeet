//
//  PlaydateRequestReview.swift
//  WagMeet
//
//  Created by Sankritya Thakur on 9/14/24.
//

import SwiftUI
import CoreLocation


struct PlaydateRequestReview: View {
    // Playdate Request Information
    var requesterPetName: String
    var requesterOwnerName: String
    var recipientPetName: String
    var selectedDay: Int
    var selectedMonth: Int
    var selectedYear: Int
    var selectedHour: Int
    var selectedMinute: Int
    var isAM: Bool
    var selectedPark: String
    var message: String
    
    // Date Formatter
    private var formattedDate: String {
        let monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
        return "\(selectedDay) \(monthNames[selectedMonth - 1]), \(selectedYear)"
    }
    
    // Time Formatter
    private var formattedTime: String {
        let period = isAM ? "AM" : "PM"
        return String(format: "%02d:%02d \(period)", selectedHour, selectedMinute)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            // Header
            Text("Playdate Request from \(requesterOwnerName)")
                .font(Font.custom("Montserrat-Bold", size: 24))
                .foregroundColor(.white)
                .padding(.top, 20)
            
            // Playdate Summary
            VStack(alignment: .leading, spacing: 12) {
                // Requester and Recipient Info
                Text("Requester's Pet: \(requesterPetName)")
                    .font(Font.custom("Montserrat-SemiBold", size: 18))
                    .foregroundColor(.white)
                
                Text("Your Pet: \(recipientPetName)")
                    .font(Font.custom("Montserrat-SemiBold", size: 18))
                    .foregroundColor(.white)
                
                // Date & Time
                Text("Date: \(formattedDate)")
                    .font(Font.custom("Montserrat-Regular", size: 16))
                    .foregroundColor(.white.opacity(0.8))
                
                Text("Time: \(formattedTime)")
                    .font(Font.custom("Montserrat-Regular", size: 16))
                    .foregroundColor(.white.opacity(0.8))
                
                // Location
                Text("Location: \(selectedPark)")
                    .font(Font.custom("Montserrat-Regular", size: 16))
                    .foregroundColor(.white.opacity(0.8))
                
                // Message
                if !message.isEmpty {
                    Text("Message from \(requesterOwnerName): \(message)")
                        .font(Font.custom("Montserrat-Regular", size: 16))
                        .foregroundColor(.white.opacity(0.8))
                        .italic()
                }
            }
            .padding()
            .background(Color.purple.opacity(0.3))
            .cornerRadius(10)
            .padding(.horizontal)
            
            Spacer()
            
            // Accept and Decline Buttons
            HStack(spacing: 20) {
                // Accept Button
                Button(action: {
                    // Handle accept action
                }) {
                    Text("Accept")
                        .font(Font.custom("Montserrat-SemiBold", size: 16))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                
                // Decline Button
                Button(action: {
                    // Handle decline action
                }) {
                    Text("Decline")
                        .font(Font.custom("Montserrat-SemiBold", size: 16))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.purple.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        )
    }
}

// Preview
struct PlaydateRequestReview_Previews: PreviewProvider {
    static var previews: some View {
        PlaydateRequestReview(
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
            message: "Looking forward to meeting Luna!"
        )
    }
}
