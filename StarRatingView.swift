//
//  StarRatingView.swift
//  MovieSearcherAPP
//
//  Created by Ismael Kabore on 12/10/23.
//

import Foundation
import SwiftUI

struct StarRatingView: View {
    @Binding var rating: Int
    var maximumRating = 5
    var onRatingChanged: (Int) -> Void

    var body: some View {
        HStack {
            ForEach(1...maximumRating, id: \.self) { number in
                Image(systemName: "star.fill")
                    .foregroundColor(number > rating ? .gray : .yellow)
                    .onTapGesture {
                        rating = number
                        onRatingChanged(number)
                    }
            }
        }
    }
}
