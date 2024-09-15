import SwiftUI

struct PetCard: View {
    var petName: String = "Max"
    var petBreed: String = "Labrador"

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(spacing: 12) {
            // Profile Image
            Image("petImage") // Replace with the actual image asset
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .clipped()
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .shadow(radius: 5)

            // Pet Name and Breed
            Text("\(petName) - \(petBreed)")
                .font(Font.custom("Montserrat-Bold", size: 16))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .truncationMode(.tail)
                .frame(maxWidth: .infinity)

            // Request Playdate Button
            Button(action: {
                // Action for request playdate
            }) {
                Text("Request Playdate")
                    .font(Font.custom("Montserrat-SemiBold", size: 14))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
        }
        .padding(16)
        .frame(width: 160) // Fixed width for consistency
        .background(Color.green.opacity(0.4))
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

struct PetCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PetCard(petName: "Maximilian", petBreed: "Labrador Retriever")
                .previewDisplayName("Long Name")
            PetCard(petName: "Max", petBreed: "Lab")
                .previewDisplayName("Short Name")
        }
        .padding()
        .background(Color.gray)
        .previewLayout(.sizeThatFits)
    }
}
