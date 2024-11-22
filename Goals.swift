//
//  Goals.swift
//  HI-PER Games
//
//  Created by Javier L on 11/6/24.
//

import Foundation

struct Goal: Identifiable {
    var id = UUID()
    var title: String
    var note: String
    var isCompleted: Bool
}
