//
//  RegisterViewController.swift
//  RestaurantReservation
//
//  Created by Tianqi Chen on 02/05/2023.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var debug = false
    var userDict = [String : Data]()

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNoTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPWTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.userDict = UserDefaults.standard.dictionary(forKey: "Users") as! [String : Data]
    }

    @IBAction func registerTapped(_ sender: Any) {
        let dest = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        if debug {
            self.navigationController?.pushViewController(dest, animated: true)
            return
        }
        var blank = false
        var pwdSame = true
        let name = self.nameTextField.text!
        let email = self.emailTextField.text!
        let phoneNo = self.phoneNoTextField.text!
        let pwd = self.passwordTextField.text!
        let confirmPwd = self.confirmPWTextField.text!
        if name.isEmpty || email.isEmpty || phoneNo.isEmpty || pwd.isEmpty || confirmPwd.isEmpty {
            blank = true
        }
        if pwd != confirmPwd {
            pwdSame = false
        }
        if blank {
            let alert = UIAlertController(title: nil, message: "Please fill in all fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
            return
        }
        if !pwdSame {
            let alert = UIAlertController(title: nil, message: "Passwords are not the same", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
            return
        }
        let user = User(name: name, phoneNo: phoneNo, email: email, password: pwd)
        let encoded = try? JSONEncoder().encode(user)
        if (self.userDict[email] != nil) {
            let alert = UIAlertController(title: nil, message: "Email already registered", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
        self.userDict[email] = encoded
        UserDefaults.standard.set(self.userDict, forKey: "Users")
        let alert = UIAlertController(title: nil, message: "Registration complete!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.navigationController?.pushViewController(dest, animated: true)
        self.present(alert, animated: true)
    }
}

