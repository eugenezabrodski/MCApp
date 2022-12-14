//
//  ReviewsTableVC.swift
//  MCApp
//
//  Created by Евгений Забродский on 14.12.22.
//

import UIKit

class ReviewsTableVC: UITableViewController {
    
    var index: Int!

    var meal: Meal {
        MealsData.shared.meals[index]
    }

    override func viewDidLoad() {
        tableView.register(UINib(nibName: "ReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "ReviewTableViewCell")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        meal.feedbacks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let feedback = meal.feedbacks[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell", for: indexPath) as! ReviewTableViewCell

        cell.nameLbl.text = feedback.dateString
        cell.textLbl.text = feedback.text
        cell.ratingLbl.text = feedback.raitingBar
        return cell
    }


}
