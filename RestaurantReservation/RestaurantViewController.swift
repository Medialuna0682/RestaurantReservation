//
//  RestaurantViewController.swift
//  RestaurantReservation
//
//  Created by Tianqi Chen on 02/05/2023.
//

import UIKit

class RestaurantViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    // Add this property to hold the selected restaurant
    var selectedRestaurant: Restaurant?
    
    let restaurantList = [
           Restaurant(name: "Three Williams", location: "Surry Hill", rating: 4.5, cuisine: "Brunch"),
           Restaurant(name: "Don Don", location: "Townhall", rating: 4.0, cuisine: "Korean restaurant"),
           Restaurant(name: "Dopa", location: "Darling square", rating: 4.2, cuisine: "Japanese restaurant"),
           Restaurant(name: "Spicy Joint", location: "Chinatown", rating: 3.9, cuisine: "Chinese restaurant"),
       ]
       
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
    }
    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return restaurantList.count
    }
        
    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath)
            
            let restaurant = restaurantList[indexPath.row]
            cell.textLabel?.text = restaurant.name
            cell.detailTextLabel?.text = "\(restaurant.location) - \(restaurant.cuisine) - \(restaurant.rating)"
            
            return cell
    }
    
    // Add this method to handle row selection
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Store the selected restaurant when a row is selected
        selectedRestaurant = restaurantList[indexPath.row]
        
        // Perform the segue
        performSegue(withIdentifier: "RestaurantToReservation", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RestaurantToReservation" {
            let dest = segue.destination as! ReservationViewController
            
            // Pass the selected restaurant to the destination view controller
            dest.restaurant = selectedRestaurant
        }
    }
}

