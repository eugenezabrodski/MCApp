//
//  Feedback.swift
//  MCApp
//
//  Created by Евгений Забродский on 14.12.22.
//



import Foundation

struct Feedback {
    private let date = Date()
    let text: String
    let mark: Double
    
    var raitingBar: String {
        String(repeating: "🌟", count: Int(mark.rounded(.up)))
    }
    
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "ru_RU")
        return dateFormatter.string(from: date)
    }
}
