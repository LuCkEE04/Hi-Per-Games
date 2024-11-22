//
//  Goalmanager.swift
//  HI-PER Games
//
//  Created by Javier L on 11/19/24.
//

import Foundation
import SwiftUI

struct GoalsManagerView: View {
    @State private var goals: [Goal] = [] // List of goals
    @State private var showingAddGoal = false // State to show Add Goal sheet
    
    var body: some View {
        NavigationView {
            VStack {
                if goals.isEmpty {
                    Text("No goals yet.")
                        .foregroundColor(.gray)
                        .padding()
                    Text("Create a note to get started.")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List {
                        ForEach($goals) { $goal in
                            HStack {
                                Button(action: {
                                    goal.isCompleted.toggle()
                                }) {
                                    Image(systemName: goal.isCompleted ? "checkmark.circle.fill" : "circle")
                                        .foregroundColor(goal.isCompleted ? .green : .gray)
                                }
                                
                                VStack(alignment: .leading) {
                                    Text(goal.title)
                                        .font(.headline)
                                        .strikethrough(goal.isCompleted, color: .gray)
                                    Text(goal.note)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                        .onDelete(perform: deleteGoal)
                    }
                }
            }
            .navigationTitle("Goals")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddGoal = true }) {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddGoal) {
                AddGoalView(goals: $goals)
            }
        }
    }
    
    private func deleteGoal(at offsets: IndexSet) {
        goals.remove(atOffsets: offsets)
    }
}
