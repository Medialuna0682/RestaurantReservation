
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
    
    var reservation: Reservation? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        if let reservation = self.reservation {
            self.restaurantNameLabel.text = reservation.restaurant
            self.timeLabel.text = reservation.time
            self.customerNameLabel.text = reservation.name
            self.emailLabel.text = reservation.email
            self.seatsLabel.text = String(reservation.numPeople)
            self.commentLabel.text = reservation.comment
        }
    }
}
