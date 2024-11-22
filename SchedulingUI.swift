//
//  Scheduling ui.swift
//  HI-PER Games
//
//  Created by Javier L on 11/6/24.
//

import Foundation
import SwiftUI

struct SchedulingUI: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Header
                Text("Your Daily Planner")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                
                // Quick Overview Section
                HStack {
                    Text("Today’s Progress")
                        .font(.headline)
                        .padding(.leading)
                    Spacer()
                }
                
                // Progress Bar (for overall day progress)
                ProgressView(value: 0.5) // Example: 50% progress
                    .progressViewStyle(LinearProgressViewStyle())
                    .padding(.horizontal)
                
                // Section for Scheduled Activities
                HStack {
                    Text("Scheduled Activities")
                        .font(.headline)
                        .padding(.leading)
                    Spacer()
                }
                
                // Example List of Activities
                List {
                    ActivityRow(activity: "Morning Workout", time: "8:00 AM")
                    ActivityRow(activity: "Work/Study", time: "9:00 AM - 5:00 PM")
                    ActivityRow(activity: "Evening Gaming Session", time: "6:00 PM - 8:00 PM")
                    ActivityRow(activity: "Wind Down", time: "9:00 PM")
                }
                .listStyle(PlainListStyle())
                
                // Add Activity Button
                NavigationLink(destination: AddActivityView()) {
                    Text("Add Activity")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationTitle("Scheduling")
        }
    }
}

struct ActivityRow: View {
    var activity: String
    var time: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(activity)
                    .font(.body)
                    .fontWeight(.semibold)
                Text(time)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.vertical, 5)
    }
}

struct AddActivityView: View {
    var body: some View {
        Text("Add Activity Screen")
        // Add your form fields here for activity name, time, and details.
    }
}

struct SchedulingUI_Previews: PreviewProvider {
    static var previews: some View {
        SchedulingUI()
    }
}
