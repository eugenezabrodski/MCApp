//
//  MealDeatailViewController.swift
//  MCApp
//
//  Created by Евгений Забродский on 14.12.22.
//

import UIKit

class MealDeatailViewController: UIViewController {
    
    //MARK: - Properties
    
    var index: Int!
    
    var meal: Meal {
        MealsData.shared.meals[index]
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealPriceLabel: UILabel!
    @IBOutlet weak var mealStackView: UIStackView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var showReviewsBtn: UIButton!
    
    //MARK: - Life cicle

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(with: view.bounds.size)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        updateUI(with: size)
    }
    
    //MARK: - Properties
    
    private func updateUI(with size: CGSize) {
        let vertical = size.width < size.height
        mealStackView.axis = vertical ? .vertical : .horizontal
        
        title = meal.name
        imageView.image = meal.image
        mealNameLabel.text = meal.name
        mealPriceLabel.text = String(meal.price) + " BYN"
        ratingLabel.text = meal.ratingBar
        
        if meal.feedbacks.count == 0 {
            showReviewsBtn.setTitle("You haven't reviews", for: .normal)
            showReviewsBtn.isEnabled = false
        } else {
            showReviewsBtn.setTitle("See (\(meal.feedbacks.count) reviews)", for: .normal)
            showReviewsBtn.isEnabled = true
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? FeedbackViewController {
            dest.index = index
        }
        if let dest = segue.destination as? ReviewsTableVC {
            dest.index = index
        }
    }


}
