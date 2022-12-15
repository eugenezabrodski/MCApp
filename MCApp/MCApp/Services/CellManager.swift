//
//  CellManager.swift
//  MCApp
//
//  Created by Евгений Забродский on 14.12.22.
//

import UIKit

final class CellManager {
    func configure(_ cell: UITableViewCell, with meal: Meal) {
        cell.textLabel?.text = meal.name
        cell.detailTextLabel?.text = String(meal.price) + "BYN\n" + meal.ratingBar
        cell.imageView?.image = meal.image
    }
}
