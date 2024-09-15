//
//  Photo.swift
//  WagMeet
//
//  Created by Sankritya Thakur on 9/13/24.
//

import Foundation
import SwiftUI



struct PhotoGalleryView: View {
    @Binding var selectedPhotos: [UIImage]
    @Binding var isShowingPhotoPicker: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(selectedPhotos, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    if selectedPhotos.count < 5 {
                        Button(action: {
                            isShowingPhotoPicker = true
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white.opacity(0.1))
                                    .frame(width: 80, height: 80)

                                Image(systemName: "plus")
                                    .font(.system(size: 24))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
