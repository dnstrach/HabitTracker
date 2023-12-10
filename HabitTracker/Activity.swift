//
//  Activity.swift
//  HabitTracker
//
//  Created by Dominique Strachan on 12/7/23.
//

import Foundation

struct Activity: Codable, Hashable, Equatable, Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var completionCount = 0
    
    static let example = Activity(title: "Example Activity", description: "This is a test activity.")
}
