//
//  ParkPickerView.swift
//  WagMeet
//
//  Created by Sankritya Thakur on 9/13/24.
//

import SwiftUI

struct ParkPickerView: View {
    @Binding var preferredParks: [String]
    var dogParks: [String]
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List {
                ForEach(dogParks, id: \.self) { park in
                    MultipleSelectionRow(title: park, isSelected: preferredParks.contains(park)) {
                        if preferredParks.contains(park) {
                            preferredParks.removeAll(where: { $0 == park })
                        } else {
                            preferredParks.append(park)
                        }
                    }
                }
            }
            .navigationTitle("Select Preferred Parks")
            .navigationBarItems(trailing: Button("Done") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}


//#Preview {
//    ParkPickerView()
//}
