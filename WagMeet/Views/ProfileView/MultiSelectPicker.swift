//
//  MultiSelectPicker.swift
//  WagMeet
//
//  Created by Sankritya Thakur on 9/13/24.
//

import SwiftUI

struct MultiSelectPicker: View {
    var title: String
    var options: [String]
    @Binding var selections: [String]

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(Font.custom("Montserrat-SemiBold", size: 16))
                .foregroundColor(.white)
                .padding(.leading)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            if selections.contains(option) {
                                selections.removeAll(where: { $0 == option })
                            } else {
                                selections.append(option)
                            }
                        }) {
                            Text(option)
                                .font(Font.custom("Montserrat-Regular", size: 14))
                                .padding(8)
                                .background(selections.contains(option) ? Color.green : Color.white.opacity(0.1))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}


//#Preview {
//    MultiSelectPicker()
//}
