//
//  PlaydatesView.swift
//  WagMeet
//
//  Created by Sankritya Thakur on 9/9/24.
//

import SwiftUI
import MapKit

struct PlaydateView: View {
    // Playdate Information
    var requesterPetName: String = "Luna"
    var requesterOwnerName: String = "Jamie"
    var requesterOwnerContact: String = "jamie@example.com"
    
    var recipientPetName: String = "Buddy"
    var recipientOwnerName: String = "Alex"
    var recipientOwnerContact: String = "alex@example.com"
    
    var playdateDate: Date
    var playdateLocationName: String
    var playdateCoordinate: CLLocationCoordinate2D
    var message: String
    
    // Map Region
    @State private var region: MKCoordinateRegion
    @State private var animateHeart = false
    
    // Date Formatter
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .short
        return formatter
    }
    
    init(playdateDate: Date, playdateLocationName: String, playdateCoordinate: CLLocationCoordinate2D, message: String) {
        self.playdateDate = playdateDate
        self.playdateLocationName = playdateLocationName
        self.playdateCoordinate = playdateCoordinate
        self.message = message
        _region = State(initialValue: MKCoordinateRegion(center: playdateCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)))
    }
    
    var body: some View {
        ZStack {
            // Background
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 30) {
                    // Header with Both Pets' Information
                    HStack(alignment: .center, spacing: 16) {
                        PetAvatar(petName: requesterPetName, imageName: "requesterPetImage")
                        
                        ZStack {
                            Image(systemName: "heart.fill")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                                .scaleEffect(animateHeart ? 1.2 : 1.0)
                                .animation(Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: true), value: animateHeart)
                                .onAppear {
                                    self.animateHeart = true
                                }
                        }
                        
                        PetAvatar(petName: recipientPetName, imageName: "recipientPetImage")
                    }
                    .padding(.top, 40)
                    
                    // Playdate Details
                    VStack(alignment: .leading, spacing: 16) {
                        // Date and Time
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(.white)
                            Text(dateFormatter.string(from: playdateDate))
                                .font(Font.custom("Montserrat-SemiBold", size: 16))
                                .foregroundColor(.white)
                        }
                        
                        // Location Name
                        HStack {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(.white)
                            Text(playdateLocationName)
                                .font(Font.custom("Montserrat-SemiBold", size: 16))
                                .foregroundColor(.white)
                        }
                        
                        // Map View
                        Map(coordinateRegion: $region, annotationItems: [PlaydateLocation(name: playdateLocationName, coordinate: playdateCoordinate)]) { location in
                            MapMarker(coordinate: location.coordinate, tint: .green)
                        }
                        .frame(height: 200)
                        .cornerRadius(10)
                        .padding(.vertical)
                    }
                    .padding(.horizontal)
                    
                    // Additional Message
                    if !message.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Message from \(requesterOwnerName):")
                                .font(Font.custom("Montserrat-SemiBold", size: 16))
                                .foregroundColor(.white)
                            
                            Text("\"\(message)\"")
                                .font(Font.custom("Montserrat-Regular", size: 14))
                                .foregroundColor(.white.opacity(0.9))
                                .italic()
                        }
                        .padding(.horizontal)
                    }
                    
                    // Contact Information
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Contact Information")
                            .font(Font.custom("Montserrat-SemiBold", size: 18))
                            .foregroundColor(.white)
                        
                        ContactCard(ownerName: requesterOwnerName, contactInfo: requesterOwnerContact)
                        ContactCard(ownerName: recipientOwnerName, contactInfo: recipientOwnerContact)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .padding(.bottom, 40)
            }
        }
        .navigationTitle("Playdate Confirmed")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PlaydateLocation: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct ContactCard: View {
    var ownerName: String
    var contactInfo: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "person.circle")
                .font(.system(size: 40))
                .foregroundColor(.white)
            
            VStack(alignment: .leading) {
                Text(ownerName)
                    .font(Font.custom("Montserrat-SemiBold", size: 16))
                    .foregroundColor(.white)
                Text(contactInfo)
                    .font(Font.custom("Montserrat-Regular", size: 14))
                    .foregroundColor(.white.opacity(0.8))
            }
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(10)
    }
}

// Preview
struct PlaydateView_Previews: PreviewProvider {
    static var previews: some View {
        PlaydateView(
            playdateDate: Date(),
            playdateLocationName: "Central Park Dog Run",
            playdateCoordinate: CLLocationCoordinate2D(latitude: 40.785091, longitude: -73.968285),
            message: "Looking forward to our pups meeting!"
        )
    }
}
