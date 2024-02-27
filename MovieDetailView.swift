//
//  MovieDetailView.swift
//  MovieSearcherAPP
//
//  Created by Ismael Kabore on 12/9/23.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var viewModel: MovieViewModel

    var body: some View {
        List {
            if let movie = viewModel.movie {
                Section(header: Text("Movie Details")) {
                    DetailRow(label: "Title", value: movie.title)
                    DetailRow(label: "Year", value: movie.year)
                    DetailRow(label: "Rated", value: movie.rated)
                    DetailRow(label: "Released", value: movie.released)
                    DetailRow(label: "Runtime", value: movie.runtime)
                    DetailRow(label: "Genre", value: movie.genre)

                    // New rows for Director, Actors, and Plot
                    DetailRow(label: "Director", value: movie.director)
                    DetailRow(label: "Actors", value: movie.actors)
                    DetailRow(label: "Plot", value: movie.plot)
                    DetailRow(label: "Language", value: movie.language)
                    
                }
            } else {
                Text("No movie details to display.")
            }
        }
    }
}

struct DetailRow: View {
    var label: String
    var value: String

    var body: some View {
        HStack {
            Text("\(label):")
                .fontWeight(.bold)
            Text(value)
                .lineLimit(nil) // Allows for multiple lines if needed
        }
    }
}
