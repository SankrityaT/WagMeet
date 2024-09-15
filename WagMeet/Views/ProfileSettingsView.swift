//
//  ProfileSettingsView.swift
//  WagMeet
//
//  Created by Sankritya Thakur on 9/13/24.

import SwiftUI
import PhotosUI

struct ProfileSettingsView: View {
    // Owner's Information
    @Binding var ownerName: String
    @Binding var ownerBio: String

    // Dog's Information
    @Binding var dogName: String
    @Binding var dogBreed: String
    @Binding var dogAge: String
    @Binding var dogGender: String
    @Binding var dogTemperament: String
    @Binding var dogVaccinationStatus: Bool
    @Binding var dogBio: String

    // Preferred Parks
    @Binding var preferredParks: [String]
    @State private var isShowingParkPicker = false

    // Availabilities
    @Binding var availableDays: [String]
    @Binding var availableTimeRange: String
    @State private var selectedTimeRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let now = Date()
        let startOfDay = calendar.startOfDay(for: now)
        let endOfDay = calendar.date(byAdding: .hour, value: 23, to: startOfDay)!
        return startOfDay...endOfDay
    }()

    // Photo Gallery
    @Binding var photos: [UIImage]
    @State private var isShowingPhotoPicker = false

    // Privacy and Notification Settings
    @State private var isPrivateProfile: Bool = false
    @State private var receiveNotifications: Bool = true

    // Sample Dog Parks Data
    let dogParks: [String] = [
        "Central Park Dog Run",
        "Riverside Dog Park",
        "Madison Square Dog Park",
        "Prospect Park Dog Beach",
        "Tompkins Square Dog Run"
    ]

    // Days of the Week
    let daysOfWeek: [String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

    // Other Variables
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    // Owner's Information
                    SectionHeader(title: "Owner Information")
                    Group {
                        CustomTextField(title: "Name", text: $ownerName)
                        CustomTextEditor(title: "Bio", text: $ownerBio, placeholder: "Enter your bio...")
                    }

                    // Dog's Information
                    SectionHeader(title: "Dog Information")
                    Group {
                        CustomTextField(title: "Name", text: $dogName)
                        CustomTextField(title: "Breed", text: $dogBreed)
                        CustomTextField(title: "Age", text: $dogAge, keyboardType: .numberPad)
                        Picker(selection: $dogGender, label: LabelView(text: "Gender")) {
                            Text("Male").tag("Male")
                            Text("Female").tag("Female")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal)

                        CustomTextField(title: "Temperament", text: $dogTemperament)
                        Toggle(isOn: $dogVaccinationStatus) {
                            Text("Vaccinated")
                                .font(Font.custom("Montserrat-SemiBold", size: 16))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal)

                        CustomTextEditor(title: "Bio", text: $dogBio, placeholder: "Enter your dog's bio...")
                    }

                    // Preferred Parks
                    SectionHeader(title: "Preferred Parks")
                    VStack(alignment: .leading, spacing: 8) {
                        Button(action: {
                            isShowingParkPicker = true
                        }) {
                            HStack {
                                Text(preferredParks.isEmpty ? "Select Preferred Parks" : preferredParks.joined(separator: ", "))
                                    .font(Font.custom("Montserrat-Regular", size: 14))
                                    .foregroundColor(preferredParks.isEmpty ? Color.white.opacity(0.7) : .white)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(10)
                            .padding(.horizontal)
                        }
                    }

                    // Availabilities
                    SectionHeader(title: "Availabilities")
                    VStack(alignment: .leading, spacing: 8) {
                        // Select Days
                        MultiSelectPicker(title: "Available Days", options: daysOfWeek, selections: $availableDays)

                        // Select Time Range
                        VStack(alignment: .leading) {
                            Text("Available Time")
                                .font(Font.custom("Montserrat-SemiBold", size: 16))
                                .foregroundColor(.white)
                                .padding(.leading)

                            HStack {
                                DatePicker("", selection: Binding(get: {
                                    selectedTimeRange.lowerBound
                                }, set: { newValue in
                                    selectedTimeRange = newValue...selectedTimeRange.upperBound
                                    updateTimeRange()
                                }), displayedComponents: .hourAndMinute)
                                    .labelsHidden()
                                    .datePickerStyle(CompactDatePickerStyle())
                                    .frame(maxWidth: .infinity)

                                Text("to")
                                    .foregroundColor(.white)

                                DatePicker("", selection: Binding(get: {
                                    selectedTimeRange.upperBound
                                }, set: { newValue in
                                    selectedTimeRange = selectedTimeRange.lowerBound...newValue
                                    updateTimeRange()
                                }), displayedComponents: .hourAndMinute)
                                    .labelsHidden()
                                    .datePickerStyle(CompactDatePickerStyle())
                                    .frame(maxWidth: .infinity)
                            }
                            .padding()
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(10)
                            .padding(.horizontal)
                        }
                    }

                    // Photo Gallery
                    SectionHeader(title: "Photo Gallery")
                    PhotoGalleryView(selectedPhotos: $photos, isShowingPhotoPicker: $isShowingPhotoPicker)

                    // Privacy and Notification Settings
                    SectionHeader(title: "Settings")
                    VStack(alignment: .leading, spacing: 8) {
                        Toggle(isOn: $receiveNotifications) {
                            Text("Receive Notifications")
                                .font(Font.custom("Montserrat-SemiBold", size: 16))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal)

                        Toggle(isOn: $isPrivateProfile) {
                            Text("Private Profile")
                                .font(Font.custom("Montserrat-SemiBold", size: 16))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal)
                    }

                    // Save Button
                    Button(action: {
                        saveProfile()
                    }) {
                        Text("Save Profile")
                            .font(Font.custom("Montserrat-SemiBold", size: 16))
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }

                    Spacer()
                }
                .padding(.vertical)
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
            )
            .sheet(isPresented: $isShowingPhotoPicker) {
                PhotoPicker(selectedPhotos: $photos, maxSelection: 5)
            }
            .sheet(isPresented: $isShowingParkPicker) {
                ParkPickerView(preferredParks: $preferredParks, dogParks: dogParks)
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }

    // Functions
    func saveProfile() {
        // Implement the logic to save the profile information
        // Update availableTimeRange based on selectedTimeRange
        updateTimeRange()

        // Dismiss the view
        presentationMode.wrappedValue.dismiss()
    }

    func updateTimeRange() {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let startTime = formatter.string(from: selectedTimeRange.lowerBound)
        let endTime = formatter.string(from: selectedTimeRange.upperBound)
        availableTimeRange = "\(startTime) - \(endTime)"
    }

    // Reusable Components

    struct SectionHeader: View {
        var title: String

        var body: some View {
            Text(title)
                .font(Font.custom("Montserrat-Bold", size: 20))
                .foregroundColor(.white)
                .padding(.leading)
        }
    }

    struct LabelView: View {
        var text: String

        var body: some View {
            Text(text)
                .font(Font.custom("Montserrat-SemiBold", size: 16))
                .foregroundColor(.white)
                .padding(.leading)
        }
    }

    struct CustomTextField: View {
        var title: String
        @Binding var text: String
        var keyboardType: UIKeyboardType = .default

        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                LabelView(text: title)

                TextField("", text: $text)
                    .font(Font.custom("Montserrat-Regular", size: 14))
                    .padding()
                    .keyboardType(keyboardType)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .foregroundColor(.white)
            }
        }
    }

    struct CustomTextEditor: View {
        var title: String
        @Binding var text: String
        var placeholder: String

        @FocusState private var isFocused: Bool

        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                LabelView(text: title)

                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white.opacity(0.1))
                        .frame(height: 100)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(isFocused ? Color.green : Color.clear, lineWidth: 1)
                        )

                    if text.isEmpty {
                        Text(placeholder)
                            .font(Font.custom("Montserrat-Regular", size: 14))
                            .foregroundColor(Color.white.opacity(0.7))
                            .padding(EdgeInsets(top: 12, leading: 16, bottom: 0, trailing: 16))
                    }

                    TextEditor(text: $text)
                        .font(Font.custom("Montserrat-Regular", size: 14))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                        .background(Color.clear)
                        .frame(height: 100)
                        .focused($isFocused)
                        .onChange(of: isFocused) { _ in
                            // Remove autocorrection toolbar if desired
                        }
                }
                .padding(.horizontal)
            }
        }
    }
}



struct ProfileSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingsView(
            ownerName: .constant("John Doe"),
            ownerBio: .constant("Loves long walks."),
            dogName: .constant("Rex"),
            dogBreed: .constant("Labrador"),
            dogAge: .constant("5"),
            dogGender: .constant("Male"),
            dogTemperament: .constant("Calm"),
            dogVaccinationStatus: .constant(true),
            dogBio: .constant("Friendly and playful."),
            preferredParks: .constant(["Central Park Dog Run"]),
            availableDays: .constant(["Monday", "Wednesday"]),
            availableTimeRange: .constant("9 AM - 5 PM"),
            photos: .constant([UIImage(named: "sampleDog")!])
        )
    }
}
