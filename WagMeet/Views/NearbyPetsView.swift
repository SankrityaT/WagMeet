//
//  NearbyPetsView.swift
//  WagMeet
//
//  Created by Sankritya Thakur on 9/9/24.
//

import SwiftUI
import MapKit

struct NearbyPetsView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.758896, longitude: -73.985130), // Times Square
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    // Use the sample data
    var petProfiles: [PetProfile] = samplePetProfiles
    
    @State private var selectedPet: PetProfile? = nil
    @State private var isShowingDetail = false
    
    var body: some View {
        NavigationView {
            VStack {
                // Map View
                Map(coordinateRegion: $region, annotationItems: petProfiles.filter { $0.isAvailable && $0.isPublicProfile }) { pet in
                    MapAnnotation(coordinate: pet.coordinate) {
                        VStack {
                            Image(systemName: "pawprint.fill")
                                .foregroundColor(.blue)
                                .onTapGesture {
                                    selectedPet = pet
                                    isShowingDetail = true
                                }
                            Text(pet.dogName)
                                .font(.caption)
                                .foregroundColor(.black)
                        }
                    }
                }
                .frame(height: 300)
                .sheet(isPresented: $isShowingDetail) {
                    if let pet = selectedPet {
                        NavigationView {
                            ProfileView(petProfile: pet)
                                .navigationBarItems(trailing: Button("Close") {
                                    isShowingDetail = false
                                })
                        }
                    }
                }
                
                // List of Nearby Pets
                List(petProfiles.filter { $0.isAvailable && $0.isPublicProfile }) { pet in
                    NavigationLink(destination: ProfileView(petProfile: pet)) {
                        HStack {
                            // Placeholder for pet image
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 50, height: 50)
                                .overlay(Text(pet.dogName.prefix(1)).foregroundColor(.white))
                            
                            VStack(alignment: .leading) {
                                Text(pet.dogName)
                                    .font(Font.custom("Montserrat-Bold", size: 16))
                                Text("\(pet.dogBreed), \(pet.dogAge) years old")
                                    .font(Font.custom("Montserrat-Regular", size: 14))
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Nearby Pets")
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
            )
        }
    }
}

#Preview {
    NearbyPetsView()
}
