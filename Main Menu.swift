//
//  Main Menu.swift
//  HI-PER Games
//
//  Created by Javier L on 11/6/24.
//

import Foundation
import SwiftUI

struct MainMenuView: View {
    @State private var gamingSessions: [GamingSession] = [] // State to hold gaming sessions
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("HI-PER Mind")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.white)
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .padding()
                
                
                // Navigation to ScheduleView
                NavigationLink(destination: SchedulingUI()) {
                    MenuButton(iconName: "clock", title: "Schedule")
                }
                
                // Navigation to GamingProgressView
                NavigationLink(destination: GamingProgress(gamingSessions: $gamingSessions)) {
                    MenuButton(iconName: "gamecontroller", title: "Gaming Progress")
                }
                
                // Navigation to GoalsView
                NavigationLink(destination: GoalsManagerView()) {
                    MenuButton(iconName: "target", title: "Goals")
                }
                
                Spacer()
            }
            .navigationBarHidden(true)
            .padding()
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.orange.opacity(0.8), Color.purple]),
                           startPoint: .top,
                           endPoint: .bottom)
                .edgesIgnoringSafeArea(.all) // Ensure background fills the entire screen
            )
        }
    }
}

               // Sample GoalsView
               struct GoalsView: View {
                   var body: some View {
                       Text("Goals View")
                           .font(.largeTitle)
                   }
               }

               // MenuButton component remains unchanged
struct MenuButton: View {
    var iconName: String
    var title: String
    
    var body: some View {
            HStack {
                Image(systemName: iconName)
                    .font(.title)
                    .foregroundColor(.white)
                Text(title)
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
            .padding(.horizontal)
        
        }
    }




