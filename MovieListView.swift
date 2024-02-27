//
//  MovieListView.swift
//  MovieSearcherAPP
//
//  Created by Ismael Kabore on 12/11/23.
//

//import Foundation
//import SwiftUI
//
//struct ListView: View {
//    @ObservedObject var viewModel: MovieViewModel
//
//    var body: some View {
//        List(viewModel.movies, id: \.title) { movie in
//            VStack(alignment: .leading) {
//                Text(movie.title).font(.headline)
//                HStack {
//                    Text(movie.year)
//                    Text(movie.rated)
//                    Text(movie.released)
//                }
//                Text(movie.runtime)
//                Text(movie.genre)
//            }
//        }
//        .onAppear {
//            viewModel.fetchMovies() // Corrected method call
//        }
//    }
//}
