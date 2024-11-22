//
//  Addgoals.swift
//  HI-PER Games
//
//  Created by Javier L on 11/19/24.
//

import Foundation
import SwiftUICore
import SwiftUI
struct AddGoalView: View {
    @Binding var goals: [Goal]
    @State private var title = ""
    @State private var note = ""
    @Environment(\.presentationMode) var presentationMode // To dismiss the view
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Goal Details")) {
                    TextField("Title", text: $title)
                    TextField("Note", text: $note)
                }
                
                Button(action: saveGoal) {
                    Text("Save Goal")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .disabled(title.isEmpty) // Disable the button if title is empty
            }
            .navigationTitle("Add Goal")
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
    private func saveGoal() {
        let newGoal = Goal(title: title, note: note, isCompleted: false)
        goals.append(newGoal)
        presentationMode.wrappedValue.dismiss()
    }
}
