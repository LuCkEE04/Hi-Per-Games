//
//  GamingSession.swift
//  HI-PER Games
//
//  Created by Javier L on 11/13/24.
//

import Foundation


struct GamingSession: Identifiable {
    var id = UUID()
    var gameTitle: String
    var date: Date
    var hoursPlayed: Double
    var progressDetails: String
}
