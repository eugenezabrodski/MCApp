//
//  FeedbackViewController.swift
//  MCApp
//
//  Created by Евгений Забродский on 14.12.22.
//

import UIKit

class FeedbackViewController: UIViewController {
    
    //MARK: - Properties
    
    var index: Int!
    
    @IBOutlet weak var feedBackTextView: UITextView!
    @IBOutlet weak var errorLbl: UILabel!
    @IBOutlet weak var ratingSegment: UISegmentedControl!
    @IBOutlet weak var saveFeedBackBtn: UIButton!
    
    //MARK: - Life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedBackTextView.delegate = self
        hideKeyboardWhenTappedAround()
    }
    
    //MARK: - Methods
    
    @IBAction func saveFeedBack() {
        let feedback = Feedback(text: feedBackTextView.text, mark: Double(ratingSegment.selectedSegmentIndex + 1))
        MealsData.shared.meals[index].feedbacks.append(feedback)
    }
    
}

//MARK: - Extension

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

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
