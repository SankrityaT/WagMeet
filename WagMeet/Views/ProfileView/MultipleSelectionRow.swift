//
//  MultipleSelectionRow.swift
//  WagMeet
//
//  Created by Sankritya Thakur on 9/13/24.
//

import SwiftUI

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: {
            self.action()
        }) {
            HStack {
                Text(title)
                    .font(Font.custom("Montserrat-Regular", size: 16))
                    .foregroundColor(.primary)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(.blue)
                }
            }
        }
    }
}

//#Preview {
//    MultipleSelectionRow()
//}
