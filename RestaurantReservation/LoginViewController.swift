//
//  ViewController.swift
//  RestaurantReservation
//
//  Created by Tianqi Chen on 02/05/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    var debug = true

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
        if debug {
            let dest = self.storyboard?.instantiateViewController(withIdentifier: "RestaurantViewController") as! RestaurantViewController
            self.navigationController?.pushViewController(dest, animated: true)
            return
        }
        let email = self.emailTextField.text!;
        var password = self.passwordTextField.text!;
        var records = UserDefaults.standard.dictionary(forKey: "Users");
        if records == nil {
            UserDefaults.standard.set([String : User](), forKey: "Users")
            records = UserDefaults.standard.dictionary(forKey: "Users");
        }
        let user = records![email] as? User
        if user == nil {
            let alert =  UIAlertController(title: nil, message: "Email not exist", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
    
}

