//
//  MovieSearcherAPPApp.swift
//  MovieSearcherAPP
//
//  Created by Ismael Kabore on 12/9/23.
//

import SwiftUI

//@main
//struct MovieSearcherAPPApp: App {
//
////    @StateObject var launchScreenManager = LaunchScreenManager()
//
//
//    var body: some Scene {
//        WindowGroup {
//            ZStack {
//                ContentView()
//
////                if launchScreenManager.state != .completed {
////                    LaunchScreenView()
//                }
//            }
////            .environmentObject(launchScreenManager)
//        }
//
//    }
//


@main
struct MyApp: App {
    @State private var isReady = false

    var body: some Scene {
        WindowGroup {
            if isReady {
                ContentView()
            } else {
                FadeInView()// Initial loading view
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isReady = true
                        }
                    }
            }
        }
    }
}
