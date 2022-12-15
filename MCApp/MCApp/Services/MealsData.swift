//
//  MealsData.swift
//  MCApp
//
//  Created by Евгений Забродский on 14.12.22.
//

import Foundation

class MealsData {
    static let shared = MealsData()
    var meals: [Meal]
    
    private init() {
        meals = [Meal(name: "French fries", price: 3.5, image: #imageLiteral(resourceName: "Potatoes.png")),
                 Meal(name: "Coke", price: 2.2, image: #imageLiteral(resourceName: "CocaCola.png")),
                 Meal(name: "BigMac", price: 6.0, image: #imageLiteral(resourceName: "BigMac.png")),
                 Meal(name: "Nuggets", price: 4.5, image: #imageLiteral(resourceName: "nuggets.png")),
                 Meal(name: "McFlurry", price: 3.2, image: #imageLiteral(resourceName: "flurry.png"))]
    }
}
