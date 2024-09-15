//
//  NotificationCard.swift
//  WagMeet
//
//  Created by Sankritya Thakur on 9/9/24.
//

import Foundation
import SwiftUI

struct NotificationCard: View {
    // Example variables for notification details
    var notificationMessage: String = "You have a new playdate request!"
    var notificationDetail: String = "Check your requests for details."
    
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        HStack {
            Image(systemName: "bell.fill")
                .foregroundColor(.white)
                .padding()
            
            VStack(alignment: .leading) {
                Text(notificationMessage)
                    .font(Font.custom("Montserrat-Bold", size: 16))
                    .foregroundColor(.white)
                Text(notificationDetail)
                    .font(Font.custom("Montserrat-Regular", size: 14))
                    .foregroundColor(.white.opacity(0.8))
            }
            
            Spacer()
        }
        .padding(12)
        .background(Color.purple.opacity(0.5))
        .cornerRadius(10)
        .shadowOverlay(xOffset: 3, yOffset: 4.5, lineWidth: 2, opacity: colorScheme == .dark ? 0.7 : 1, colorScheme: colorScheme, content: RoundedRectangle(cornerRadius: 10))
    }
}

struct NotificationCard_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCard()
            .padding(24)
    }
}
