//
//  SettingsView.swift
//  MovieSearcherAPP
//
//  Created by Ismael Kabore on 12/9/23.
//

import Foundation


import SwiftUI

struct SettingsView: View {
    @AppStorage("darkModeEnabled") private var darkModeEnabled = false
    @AppStorage("preferredGenre") private var preferredGenre = "Action"
    @AppStorage("fontSize") private var fontSize = 14.0
    @AppStorage("defaultSearchKeyword") private var defaultSearchKeyword = ""

    private let genres = ["Action", "Drama", "Comedy", "Horror", "Romance"]

    var body: some View {
        Form {
            Toggle("Enable Dark Mode", isOn: $darkModeEnabled)

            Picker("Preferred Genre", selection: $preferredGenre) {
                ForEach(genres, id: \.self) {
                    Text($0)
                }
            }

            Slider(value: $fontSize, in: 12...18, step: 1)
            Text("Font size: \(fontSize, specifier: "%.0f")")

            TextField("Default Search Keyword", text: $defaultSearchKeyword)
        }
        .navigationBarTitle("Settings")
        .onChange(of: fontSize) { newValue in
            print("Font Size Updated: \(newValue)")
        }
    }
}

    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
        }
    }

