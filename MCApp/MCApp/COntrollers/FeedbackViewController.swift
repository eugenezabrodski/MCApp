//
//  FeedbackViewController.swift
//  MCApp
//
//  Created by Евгений Забродский on 14.12.22.
//

import UIKit

class FeedbackViewController: UIViewController {
    
    var index: Int!
    
    @IBOutlet weak var feedBackTextView: UITextView!
    @IBOutlet weak var errorLbl: UILabel!
    @IBOutlet weak var ratingSegment: UISegmentedControl!
    @IBOutlet weak var saveFeedBackBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedBackTextView.delegate = self
    }
    
    @IBAction func saveFeedBack() {
        let feedback = Feedback(text: feedBackTextView.text, mark: Double(ratingSegment.selectedSegmentIndex + 1))
        MealsData.shared.meals[index].feedbacks.append(feedback)
    }
    
}

extension FeedbackViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView == feedBackTextView {
            let isCountEnough = textView.text.count > 20
            saveFeedBackBtn.isEnabled = isCountEnough
            errorLbl.isHidden = isCountEnough
        }
        return true
    }
}
