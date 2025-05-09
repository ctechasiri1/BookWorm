//
//  EmojiRatingView.swift
//  BookWorm
//
//  Created by Chiraphat Techasiri on 5/8/25.
//

import SwiftUI

struct EmojiRatingView: View {
    let rating: Int
    
    var body: some View {
        switch rating {
        case 1:
            Text("一")
        case 2:
            Text("二")
        case 3:
            Text("三")
        case 4:
            Text("㆕")
        default:
            Text("五")
        }
    }
}

#Preview {
    EmojiRatingView(rating: 4)
}
