//
//  ContentView.swift
//  MovieSearcherAPP
//
//  Created by Ismael Kabore on 12/9/23.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
//    @EnvironmentObject var launchScreenManager: LaunchScreenManager
    @StateObject var viewModel = MovieViewModel()
    @State private var selectedTab = 0
    @AppStorage("darkModeEnabled") private var darkModeEnabled = false
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                MovieSearchView(viewModel: viewModel, selectedTab: $selectedTab)
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                    .tag(0)
                
                MovieDetailView(viewModel: viewModel)
                    .tabItem {
                        Label("Details", systemImage: "film")
                    }
                    .tag(1)
                
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
                    .tag(2)
                
                InfoView()
                    .tabItem {
                        Label("Info", systemImage: "info.circle")
                    }
                    .tag(3)
                
                WatchLaterView(viewModel: viewModel)
                    .tabItem {
                        Label("Watch Later", systemImage: "clock")
                    }
                    .tag(4)
                
                RatedMoviesView(viewModel: viewModel)
                    .tabItem {
                        Label("Rated", systemImage: "star.fill")
                    }
                    .tag(5)
            }
            .navigationBarTitle(selectedTab == 0 ? "Movie Search" : selectedTab == 1 ? "Movie Details" : selectedTab == 2 ? "Settings" : selectedTab == 3 ? "Info" : selectedTab == 4 ? "Watch Later" : "Rated Movies")
        }
        .onAppear {
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                
//                launchScreenManager.dismiss()
                
                
            }
        }
        .colorScheme(darkModeEnabled ? .dark : .light)
    }
    
}
    
    struct MovieSearchView: View {
        @ObservedObject var viewModel: MovieViewModel
        @Binding var selectedTab: Int
        @AppStorage("defaultSearchKeyword") private var defaultSearchKeyword = ""
        @State private var searchText: String = ""
        @AppStorage("fontSize") private var fontSize = 14.0
        @State private var showActionSheet = false
        @State private var showingRatingView = false  // State to show/hide the rating view
        @State private var rating = 0  // State to store the rating
        @State private var showNotificationAlert = false
        @State private var notificationPermissionGranted: Bool = false

        var body: some View {
                VStack {
                    TextField("Enter movie title", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .font(.system(size: CGFloat(fontSize)))
                        .onAppear {
                            self.searchText = self.defaultSearchKeyword

                            // Request notification permission
                            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                                if granted {
                                    print("Notification Permission Granted")
                                } else {
                                    print("Notification Permission Denied")
                                }
                            }
                            
                        }
                    
                    Button("Search") {
                        viewModel.fetchMovieData(withTitle: searchText)
                        selectedTab = 1
                    }
                    .padding()

                    if viewModel.movie != nil {
                        Button("Movie Options") {
                            showActionSheet = true
                        }
                        .padding()
                    }

                    // Star rating view
                    if showingRatingView {
                        StarRatingView(rating: $rating) { selectedRating in
                            viewModel.rateMovie(rating: selectedRating)
                            showingRatingView = false
                        }
                    }
                }
                .actionSheet(isPresented: $showActionSheet) {
                    ActionSheet(
                        title: Text("What would you like to do?"),
                        buttons: [
                            .default(Text("Save to Watch Later")) {
                                viewModel.saveMovieForLater()
                                showNotificationAlert = true // Show the alert asking if they want to be notified
                            },
                            .default(Text("Rate this Movie")) {
                                showingRatingView = true
                            },
                            .cancel()
                        ]
                    )
                }
                .alert(isPresented: $viewModel.showAlertForGenreMismatch) {
                    Alert(
                        title: Text("Genre Mismatch"),
                        message: Text("The movie fetched does not match the preferred genre (\(viewModel.preferredGenre)). Please try again with a different title."),
                        dismissButton: .default(Text("OK")) {
                            viewModel.showAlertForGenreMismatch = false
                        }
                    )
                }
            }
        }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
//                .environmentObject(LaunchScreenManager())
        }
    }

