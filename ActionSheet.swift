//
//  NewView.swift
//  MovieSearcherAPP
//
//  Created by Ismael Kabore on 12/10/23.
//

import Foundation
import SwiftUI



struct WatchLaterView: View {
    @ObservedObject var viewModel: MovieViewModel

    var body: some View {
        List(viewModel.savedMovies, id: \.title) { movie in
            Text(movie.title)
            Text(movie.year)
            Text(movie.rated)
            Text(movie.released)
            Text(movie.runtime)
            Text(movie.genre)
            Text(movie.director)
            Text(movie.plot)
            Text(movie.language)
            
        }
        .navigationBarTitle("Watch Later")
    }
}

struct RatedMoviesView: View {
    @ObservedObject var viewModel: MovieViewModel

    var body: some View {
        List(viewModel.savedMovies.filter { $0.userRating != nil }, id: \.title) { movie in
            VStack(alignment: .leading) {
                Text(movie.title)
                // Display the rating
                Text("Rating: \(movie.userRating ?? 0)/5")
            }
        }
        .navigationBarTitle("Rated Movies")
    }
}
 
