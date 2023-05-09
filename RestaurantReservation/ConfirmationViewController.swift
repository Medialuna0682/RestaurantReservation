//
//  ConfirmationViewController.swift
//  RestaurantReservation
//
//  Created by Tianqi Chen on 02/05/2023.
//

import UIKit

class ConfirmationViewController: UIViewController {
    var restaurantName: String = "";
    @IBOutlet weak var restaurantNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Hide back button
        self.navigationItem.hidesBackButton = true
        
        restaurantNameLabel.text = restaurantName;
    }


}

