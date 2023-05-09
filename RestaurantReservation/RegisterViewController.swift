//
//  RegisterViewController.swift
//  RestaurantReservation
//
//  Created by Tianqi Chen on 02/05/2023.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var debug = true
    var userDict = [String: User]()

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNoTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPWTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.userDict = UserDefaults.standard.dictionary(forKey: "Users") as! [String:User]
    }

    @IBAction func registerTapped(_ sender: Any) {
        let dest = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        if debug {
            self.navigationController?.pushViewController(dest, animated: true)
        }
        var blank = false
        var pwdSame = true
        var name = self.nameTextField.text!
        var email = self.emailTextField.text!
        var phoneNo = self.phoneNoTextField.text!
        var pwd = self.passwordTextField.text!
        var confirmPwd = self.confirmPWTextField.text!
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
        var user = User(name: <#T##String#>, phoneNo: <#T##String#>, email: <#T##String#>, password: <#T##String#>)
        self.userDict[email] = user
        UserDefaults.standard.set(self.userDict, forKey: "Users")
        
    }
    
}

