//
//  ViewModel.swift
//  MovieSearcherAPP
//
//  Created by Ismael Kabore on 12/9/23.
//

import Foundation
import UserNotifications


class MovieViewModel: ObservableObject {
    @Published var movie: Movie?
    @Published var showAlertForGenreMismatch = false // New property for tracking genre mismatch
    @Published var savedMovies: [Movie] = []
    @Published var movies: [Movie] = [] // Add this line

    var preferredGenre: String {
        UserDefaults.standard.string(forKey: "preferredGenre") ?? "Action"
    }

    func fetchMovieData(withTitle title: String) {
        guard let titleQuery = title.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        let urlString = "https://www.omdbapi.com/?t=\(titleQuery)&apikey=66d9b900"
        
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let movieResponse = try JSONDecoder().decode(Movie.self, from: data)
                DispatchQueue.main.async {
                    if movieResponse.genre.contains(self?.preferredGenre ?? "Action") {
                        self?.movie = movieResponse
                    } else {
                        // Set the movie to nil and trigger the genre mismatch alert
                        self?.movie = nil
                        self?.showAlertForGenreMismatch = true
                    }
                }
            } catch {
                print("Decoding error: \(error)")
            }
        }.resume()
    }
    
    
    func saveMovieForLater() {
        guard let currentMovie = movie else { return }
        if !savedMovies.contains(where: { $0.title == currentMovie.title }) {
            savedMovies.append(currentMovie)
            scheduleNotification() // Call to schedule the notification
        }
    }

    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Watch Later Reminder"
        content.body = "Would you like to set a reminder to watch this movie later?"
        content.sound = UNNotificationSound.default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 15, repeats: false)

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }

    
    // Method to rate the current movie
    func rateMovie(rating: Int) {
            guard let currentMovieTitle = movie?.title else { return }

            // Check if the movie is already in the savedMovies list
            if let index = savedMovies.firstIndex(where: { $0.title == currentMovieTitle }) {
                // Update the rating of the movie in the savedMovies array
                savedMovies[index].userRating = rating
            } else {
                // If the movie is not in the savedMovies list, add it with the rating
                var newMovie = movie!
                newMovie.userRating = rating
                savedMovies.append(newMovie)
            }
        }
    

    }




