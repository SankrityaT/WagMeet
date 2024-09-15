//
//  PlayDateCard.swift
//  WagMeet
//
//  Created by Sankritya Thakur on 9/9/24.
//

import SwiftUI

struct PlaydateCard: View {
    var petName: String = "Buddy"
    var petBreed: String = "Golden Retriever"
    var location: String = "Central Park"
    var time: String = "Tomorrow, 5:00 PM"
    
    var body: some View {
        HStack(alignment: .top) {
            Image("petImage") // Replace with actual image
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .padding(.trailing, 12)
            
            VStack(alignment: .leading) {
                Text("\(petName) - \(petBreed)")
                    .font(Font.custom("Montserrat-Bold", size: 16))
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                
                Text("Location: \(location)")
                    .font(Font.custom("Montserrat-Regular", size: 14))
                    .foregroundColor(.white.opacity(0.8))
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                
                Text(time)
                    .font(Font.custom("Montserrat-SemiBold", size: 14))
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
            }
            Spacer()
        }
        .padding(12)
        .background(Color.blue.opacity(0.5))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 3, y: 3)
    }
}

struct PlaydateCard_Previews: PreviewProvider {
    static var previews: some View {
        PlaydateCard()
            .padding(24)
            .background(Color.black)
            .preferredColorScheme(.dark)
    }
}
