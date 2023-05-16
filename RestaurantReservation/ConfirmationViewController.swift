
//
//  ConfirmationViewController.swift
//  RestaurantReservation
//
//  Created by Tianqi Chen on 02/05/2023.
//

import UIKit

class ConfirmationViewController: UIViewController {
    @IBOutlet weak var customerNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var seatsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    // Declare an optional Reservation object
    var reservation: Reservation? = nil
    // Override viewDidLoad function of the ViewController lifecycle
  override func viewDidLoad() {
        super.viewDidLoad()
        // Hide the back button on the navigation bar
        self.navigationItem.hidesBackButton = true
        // If there is a valid reservation object, update the UI elements with the reservation details
        if let reservation = self.reservation {
            // Set the restaurant name label with the reservation's restaurant name
            self.restaurantNameLabel.text = reservation.restaurant
            // Set the reservation time label with the reservation's time
            self.timeLabel.text = reservation.time
            self.customerNameLabel.text = reservation.name
            self.emailLabel.text = reservation.email
            self.seatsLabel.text = String(reservation.numPeople)
            self.commentLabel.text = reservation.comment
        }
    }
}
