//
//  Meal.swift
//  MCApp
//
//  Created by Евгений Забродский on 14.12.22.
//

import UIKit

struct Meal {
    let name: String
    let price: Double
    let image: UIImage?
    
    var feedbacks: [Feedback] = []
    
    var ratingBar: String {
        if let rating = rating {
            return String(repeating: "🌟", count: Int(rating.rounded(.up)))
        } else {
            return "There are not reviews yet"
        }
    }
    
    private var rating: Double? {
        if feedbacks.isEmpty {
            return nil
        } else {
            var sum: Double = 0
            for rewiev in feedbacks {
                sum += rewiev.mark
            }
            return sum / Double(feedbacks.count)
        }
    }
}
