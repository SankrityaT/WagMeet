//
//  PlaydateHistoryView.swift
//  WagMeet
//
//  Created by Sankritya Thakur on 9/14/24.
//

import SwiftUI


struct PlaydateHistoryView: View {
    var playdateHistories: [PlaydateHistoryCard] = [
        PlaydateHistoryCard(petName: "Max", time: "2 weeks ago"),
        PlaydateHistoryCard(petName: "Rocky", time: "1 week ago"),
        PlaydateHistoryCard(petName: "Luna", time: "Yesterday")
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(playdateHistories.indices, id: \.self) { index in
                    playdateHistories[index]
                }
            }
            .padding(.horizontal)
        }
    }
}

struct PlaydateHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        PlaydateHistoryView()
    }
}


#Preview {
    PlaydateHistoryView()
}
