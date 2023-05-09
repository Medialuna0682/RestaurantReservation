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
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Hide back button
        self.navigationItem.hidesBackButton = true
    }

    @IBAction func loginTapped(_ sender: Any) {
        let dest = self.storyboard?.instantiateViewController(withIdentifier: "RestaurantViewController") as! RestaurantViewController
        if debug {
            self.navigationController?.pushViewController(dest, animated: true)
            var u = User(name: "Test", phoneNo: "123", email: "test@test.com", password: "123")
            var e = try? JSONEncoder().encode(u)
            UserDefaults.standard.set(e, forKey: "CurrentUser")
            return
        }
        let email = self.emailTextField.text!;
        let password = self.passwordTextField.text!;
        var records = UserDefaults.standard.dictionary(forKey: "Users");
        if records == nil {
            UserDefaults.standard.set([String : Data](), forKey: "Users")
            records = UserDefaults.standard.dictionary(forKey: "Users");
        }
        let user = records![email] as? Data
        if user == nil {
            let alert =  UIAlertController(title: nil, message: "Email not exist", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
            return
        }
        let decoded = try? JSONDecoder().decode(User.self, from: user!)
        if decoded?.password != password {
            let alert = UIAlertController(title: nil, message: "Wrong password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
            return
        }
        UserDefaults.standard.set(user, forKey: "CurrentUser")
        
        self.navigationController?.pushViewController(dest, animated: true)
    }
    
}

