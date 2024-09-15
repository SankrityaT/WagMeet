//
//  Location Manager.swift
//  WagMeet
//
//  Created by Sankritya Thakur on 9/13/24.
//

import Foundation
import CoreLocation

// Location Manager to get user's location (simplified)
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var userLocation: CLLocation?
    private let manager = CLLocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userLocation = locations.first
        manager.stopUpdatingLocation()
        // You can now use userLocation to fetch nearby dog parks from an API
    }
    
//    func fetchNearbyDogParks() {
//        guard let location = locationManager.userLocation else { return }
//        
//        // Construct the API request URL with the user's location
//        let latitude = location.coordinate.latitude
//        let longitude = location.coordinate.longitude
//        let apiKey = "YOUR_API_KEY"
//        let urlString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(latitude),\(longitude)&radius=5000&type=park&keyword=dog&key=\(apiKey)"
//        
//        // Make the network request to fetch dog parks
//        guard let url = URL(string: urlString) else { return }
//        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let data = data {
//                // Parse the JSON response and update dogParks array
//                // Ensure you parse on a background thread and update UI on the main thread
//            } else if let error = error {
//                // Handle the error
//            }
//        }.resume()
//    }

}

