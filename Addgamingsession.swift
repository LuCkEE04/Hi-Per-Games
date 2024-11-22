//
//  Addgamingsession.swift
//  HI-PER Games
//
//  Created by Javier L on 11/19/24.
//

import Foundation

import SwiftUI

struct AddGamingSession: View {
    @Binding var gamingSessions: [GamingSession]
    @State private var gameTitle = ""
    @State private var date = Date()
    @State private var hoursPlayed = ""
    @State private var progressDetails = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Game Details")) {
                    TextField("Game Title", text: $gameTitle)
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                    
                    // Input for hours played, allowing only numeric input
                    TextField("Hours Played", text: $hoursPlayed)
                        .keyboardType(.decimalPad) // Ensures numeric keyboard for decimal input
                    
                    TextField("Progress Details", text: $progressDetails)
                }

                Button(action: {
                    // Convert hoursPlayed to Double and validate input
                    if let hours = Double(hoursPlayed), !gameTitle.isEmpty, !progressDetails.isEmpty {
                        let newSession = GamingSession(
                            gameTitle: gameTitle,
                            date: date,
                            hoursPlayed: hours,
                            progressDetails: progressDetails
                        )
                        gamingSessions.append(newSession) // Add new session to the list
                    }
                }) {
                    Text("Save Session")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .navigationTitle("Add Gaming Session")
        }
    }
}
