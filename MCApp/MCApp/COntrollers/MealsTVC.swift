//
//  MealsTVC.swift
//  MCApp
//
//  Created by Евгений Забродский on 14.12.22.
//

import UIKit

class MealsTVC: UITableViewController {
    
    let cellManager = CellManager()
    var meals: [Meal] {
        MealsData.shared.meals
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let meal = meals[indexPath.row]
        cellManager.configure(cell, with: meal)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ShowMealDetail" else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        let mealDetailVC = segue.destination as! MealDeatailViewController
        mealDetailVC.index = indexPath.row
    }
    
    @IBAction func unwindToMealsTVC(_ unwindSegue: UIStoryboardSegue) {
        tableView.reloadData()
    }

     
}
