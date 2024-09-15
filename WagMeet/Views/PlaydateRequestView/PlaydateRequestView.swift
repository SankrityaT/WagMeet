//
//  PlaydateRequestView.swift
//  WagMeet
//
//  Created by Sankritya Thakur on 9/13/24.
//

import SwiftUI

struct PlaydateRequestView: View {
    // Pet and Owner Info
    var requesterPetName: String = "Luna"
    var recipientPetName: String = "Buddy"

    // State variables to hold user input
    @State private var selectedDay = Calendar.current.component(.day, from: Date())
    @State private var selectedMonth = Calendar.current.component(.month, from: Date())
    @State private var selectedYear = Calendar.current.component(.year, from: Date())
    @State private var selectedHour = Calendar.current.component(.hour, from: Date())
    @State private var selectedMinute = Calendar.current.component(.minute, from: Date())
    @State private var isAM = Calendar.current.component(.hour, from: Date()) < 12
    
    @State private var message: String = ""
    @State private var isRequestSent: Bool = false
    @State private var selectedPark: String = ""

    // Sample Dog Parks Data
    @State private var dogParks: [String] = [
        "Central Park Dog Run",
        "Riverside Dog Park",
        "Madison Square Dog Park",
        "Prospect Park Dog Beach",
        "Tompkins Square Dog Run"
    ]

    var body: some View {
        NavigationView {
            ZStack {
                // Background
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)

                ScrollView {
                    VStack(spacing: 30) {
                        // Header with Both Pets' Information
                        HStack(alignment: .center, spacing: 16) {
                            PetAvatar(petName: requesterPetName, imageName: "requesterPetImage")
                            
                            Image(systemName: "heart.fill")
                                .font(.system(size: 24))
                                .foregroundColor(.purple)

                            PetAvatar(petName: recipientPetName, imageName: "recipientPetImage")
                        }
                        .padding(.top, 40)
                        .frame(maxWidth: .infinity)

                        if !isRequestSent {
                            VStack(spacing: 24) {
                                // Select Date
                                VStack(alignment: .leading, spacing: 8) {
                                    LabelView(text: "Select Date")
                                    HStack {
                                        VStack {
                                            Text("Day") // Day label aligned with Day picker
                                            Picker("Day", selection: $selectedDay) {
                                                ForEach(1..<32) { day in
                                                    Text("\(day)").tag(day)
                                                        .foregroundColor(.white)
                                                }
                                            }
                                            .frame(width: 80)
                                            .clipped()
                                        }
                                        Spacer()
                                        VStack {
                                            Text("Month") // Month label aligned with Month picker
                                            Picker("Month", selection: $selectedMonth) {
                                                ForEach(1..<13) { month in
                                                    Text("\(month)").tag(month)
                                                }
                                            }
                                            .frame(width: 80)
                                            .clipped()
                                        }
                                        Spacer()
                                        VStack {
                                            Text("Year") // Year label aligned with Year picker
                                            Picker("Year", selection: $selectedYear) {
                                                ForEach(2023..<2031) { year in
                                                    Text(String(year)) // Converts integer to plain string
                                                        .tag(year)
                                                }
                                            }
                                            .frame(width: 100)
                                            .clipped()
                                        }

                                    }
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.7))
                                    .padding(.horizontal)
                                }

                                // Select Time
                                VStack(alignment: .leading, spacing: 8) {
                                    LabelView(text: "Select Time")
                                    HStack {
                                        VStack {
                                            Text("Hour") // Hour label aligned with Hour picker
                                            Picker("Hour", selection: $selectedHour) {
                                                ForEach(1..<13) { hour in
                                                    Text("\(hour)").tag(hour)
                                                }
                                            }
                                            .frame(width: 80)
                                            .clipped()
                                        }
                                        Spacer()
                                        VStack {
                                            Text("Minute") // Minute label aligned with Minute picker
                                            Picker("Minute", selection: $selectedMinute) {
                                                ForEach(0..<60) { minute in
                                                    Text(String(format: "%02d", minute)).tag(minute)
                                                }
                                            }
                                            .frame(width: 80)
                                            .clipped()
                                        }
                                        Spacer()
                                        VStack {
                                            Text("AM/PM") // AM/PM label aligned with picker
                                            Picker("AM/PM", selection: $isAM) {
                                                Text("AM").tag(true)
                                                Text("PM").tag(false)
                                            }
                           
                                            .frame(width: 80)
                                    
                                        }
                                    }
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.7))
                                    .padding(.horizontal)
                                }

                                // Select Location
                                VStack(alignment: .leading, spacing: 8) {
                                    LabelView(text: "Select Location")
                                    Picker(selection: $selectedPark, label: PickerLabel(text: selectedPark.isEmpty ? "Choose a Dog Park" : selectedPark)) {
                                        ForEach(dogParks, id: \.self) { park in
                                            Text(park).tag(park)
                                        }
                                    }
                                    .pickerStyle(MenuPickerStyle())
                                    .padding(.trailing,180)
                                     // Ensure it matches the rest of the layout
                                }

                                // Message Input
                                VStack(alignment: .leading, spacing: 8) {
                                    LabelView(text: "Add a Message (Optional)")
                                        .padding(.trailing,150)

                                    ZStack(alignment: .topLeading) {
                                        // Background Rounded Rectangle
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.white)  // White background for the entire message box
                                            .frame(height: 100)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                            )
                                        
                                        // Overlay to force the white background over the TextEditor
                                        TextEditor(text: $message)
                                            .font(Font.custom("Montserrat-Regular", size: 14))
                                            .foregroundColor(.black)  // Input text color
                                            .background(Color.clear)  // Clear background for the editor itself
                                            .frame(height: 100)
                                            .cornerRadius(10)
                                            .padding(EdgeInsets(top: 12, leading: 16, bottom: 8, trailing: 16))
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(Color.white)  // Force white background for TextEditor itself
                                                    .allowsHitTesting(false)  // Ensure that this overlay doesn't interfere with input
                                            )

                                        // Placeholder text
                                        if message.isEmpty {
                                            Text("Write a message...")
                                                .font(Font.custom("Montserrat-Regular", size: 14))
                                                .foregroundColor(Color.gray)  // Placeholder in gray
                                                .padding(EdgeInsets(top: 12, leading: 20, bottom: 0, trailing: 16))
                                                .allowsHitTesting(false)  // Ensure TextEditor remains tappable
                                        }
                                    }
                                    .padding(.horizontal)
                                }



                                // Send Request Button
                                Button(action: {
                                    sendPlaydateRequest()
                                }) {
                                    Text("Send Playdate Request")
                                        .font(Font.custom("Montserrat-SemiBold", size: 16))
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.green)
                                        .cornerRadius(10)
                                        .padding(.horizontal)
                                }
                            }
                        }
                    }
                    .padding(.bottom, 40)
                }
            }
            .navigationTitle("Request a Playdate")
            .navigationBarTitleDisplayMode(.inline)

        }
    }

    // Function to handle sending the playdate request
    func sendPlaydateRequest() {
        guard !selectedPark.isEmpty else {
            // Handle error: location not selected
            return
        }

        // Simulate sending request
        withAnimation {
            isRequestSent = true
        }
    }
}

// Label View for consistency
struct LabelView: View {
    var text: String

    var body: some View {
        Text(text)
            .font(Font.custom("Montserrat-SemiBold", size: 16))
            .foregroundColor(.white)
            .padding(.leading)
    }
}

// Picker Label View for Select Location
struct PickerLabel: View {
    var text: String

    var body: some View {
        HStack {
            Text(text)
                .font(Font.custom("Montserrat-Regular", size: 14))
                .foregroundColor(text == "Choose a Dog Park" ? Color.white.opacity(0.7) : .white)
            Spacer()
            Image(systemName: "chevron.down")
                .foregroundColor(.white)
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(10)
    }
}

struct PlaydateRequestView_Previews: PreviewProvider {
    static var previews: some View {
        PlaydateRequestView()
    }
}
