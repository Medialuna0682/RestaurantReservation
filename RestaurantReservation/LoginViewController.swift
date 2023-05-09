//
//  ViewController.swift
//  RestaurantReservation
//
//  Created by Tianqi Chen on 02/05/2023.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        // 11111
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Hide back button
        self.navigationItem.hidesBackButton = true
    }

    @IBAction func loginTapped(_ sender: Any) {
        var email = self.emailTextField.text!;
        var password = self.passwordTextField.text!;
        var records = UserDefaults.standard.dictionary(forKey: "Users");
        if records == nil {
            UserDefaults.standard.set([String : User](), forKey: "Users")
        }
        var user = records![email] as! User
        
    }
    
}

