//
//  GamingProgress.swift
//  HI-PER Games
//
//  Created by Javier L on 11/6/24.
//

import SwiftUICore
import SwiftUI
struct GamingProgress: View {
    @Binding var gamingSessions: [GamingSession] // List to store gaming sessions
    @State private var showingAddSession = false // State to control Add Session modal
    
    var body: some View {
        NavigationView {
            VStack {
                if gamingSessions.isEmpty {
                    Text("No sessions logged yet.")
                        .foregroundColor(.gray)
                        .padding()
                    Text("Please log a session in order to track your progress")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List {
                        // Directly use $gamingSessions in ForEach
                        ForEach($gamingSessions) { $session in
                            VStack(alignment: .leading) {
                                HStack {
                                    Image(systemName: "gamecontroller")
                                        .foregroundColor(.blue)
                                    Text(session.gameTitle)  // Direct binding access
                                        .font(.headline)
                                }
                                
                                HStack {
                                    Image(systemName: "calendar")
                                        .foregroundColor(.gray)
                                    Text("Date: \(session.date, formatter: dateFormatter)")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                
                                HStack {
                                    Image(systemName: "clock")
                                        .foregroundColor(.orange)
                                    Text("Hours Played: \(session.hoursPlayed, specifier: "%.1f") hrs")
                                        .font(.subheadline)
                                }
                                
                                HStack {
                                    Image(systemName: "checkmark.circle")
                                        .foregroundColor(.green)
                                    Text("Progress: \(session.progressDetails)")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                .padding(.vertical, 5)
                            }
                        }
                        .onDelete(perform: deleteSession) // Apply onDelete to ForEach
                    }
                    .listStyle(PlainListStyle())
                    
                }
                
                // Button to show Add Session form
                Button(action: {
                    showingAddSession = true
                }) {
                    Text("Add New Session")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                .sheet(isPresented: $showingAddSession) {
                    AddGamingSession(gamingSessions: $gamingSessions)
                }
            }
            .navigationTitle("Gaming Progress")
            .toolbar {
                EditButton() // Add Edit Button to enable delete/reorder
            }
        }
    }
    
    // Function to delete sessions
    func deleteSession(at offsets: IndexSet) {
        gamingSessions.remove(atOffsets: offsets) // Remove session from array
    }
    
    // Formatter for displaying dates
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
}
