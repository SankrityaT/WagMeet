//
//  PetProfile.swift
//  WagMeet
//
//  Created by Sankritya Thakur on 9/14/24.
//


import Foundation
import MapKit
import SwiftUI

struct PetProfile: Identifiable {
    let id = UUID()
    var ownerName: String
    var ownerBio: String
    var dogName: String
    var dogBreed: String
    var dogAge: Int
    var dogGender: String // Added dogGender
    var dogTemperament: String
    var dogBio: String
    var isVaccinated: Bool
    var coordinate: CLLocationCoordinate2D
    var isAvailable: Bool
    var isPublicProfile: Bool
    var preferredParks: [String]
    var availableDays: [String]
    var availableTimeRange: String
    var ownerImage: UIImage?
    var dogImage: UIImage?
}

let samplePetProfiles: [PetProfile] = [
    PetProfile(
        ownerName: "Jamie",
        ownerBio: "Dog lover and outdoor enthusiast.",
        dogName: "Luna",
        dogBreed: "Siberian Husky",
        dogAge: 4,
        dogGender: "Female", // Added dogGender
        dogTemperament: "Friendly and energetic",
        dogBio: "Loves to play fetch and run around the park.",
        isVaccinated: true,
        coordinate: CLLocationCoordinate2D(latitude: 40.785091, longitude: -73.968285), // Central Park, NYC
        isAvailable: true,
        isPublicProfile: true,
        preferredParks: ["Central Park Dog Run", "Riverside Park"],
        availableDays: ["Monday", "Wednesday", "Friday"],
        availableTimeRange: "9:00 AM - 5:00 PM",
        ownerImage: UIImage(named: "jamieImage"), // Replace with your actual image asset
        dogImage: UIImage(named: "lunaImage") // Replace with your actual image asset
    ),
    PetProfile(
        ownerName: "Alex",
        ownerBio: "Love outdoor hikes with Buddy.",
        dogName: "Buddy",
        dogBreed: "Golden Retriever",
        dogAge: 3,
        dogGender: "Male", // Added dogGender
        dogTemperament: "Gentle and playful",
        dogBio: "Enjoys swimming and catching frisbees.",
        isVaccinated: true,
        coordinate: CLLocationCoordinate2D(latitude: 40.660204, longitude: -73.968956), // Prospect Park, NYC
        isAvailable: true,
        isPublicProfile: true,
        preferredParks: ["Prospect Park", "Riverside Dog Park"],
        availableDays: ["Tuesday", "Thursday", "Saturday"],
        availableTimeRange: "10:00 AM - 4:00 PM",
        ownerImage: UIImage(named: "alexImage"), // Replace with your actual image asset
        dogImage: UIImage(named: "buddyImage") // Replace with your actual image asset
    )
]

