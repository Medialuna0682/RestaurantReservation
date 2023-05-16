//
//  ReservationViewController.swift
//  RestaurantReservation
//
//  Created by Tianqi Chen on 02/05/2023.
//

import UIKit

class ReservationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var restaurant: Restaurant? = nil
    @IBOutlet weak var restanrantName: UILabel!
    @IBOutlet weak var commentForRestaurant: UITextField!
    @IBOutlet weak var dateTimePicker: UIDatePicker!
    @IBOutlet weak var seatPickerView: UIPickerView!
    
    var currentUser: User? = nil
    var userDict = [String : Data]()
    
        let seats = Array(1...20)
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Set pickerView delegates and initial values
            seatPickerView.delegate = self
            seatPickerView.dataSource = self
            
            // Set datePicker minimum date to today
            dateTimePicker.minimumDate = Date()
            
            // Set datePicker mode to date and time
            dateTimePicker.datePickerMode = .dateAndTime
            if let name = self.restaurant?.name {
                self.restanrantName.text = name
            }
            
            self.currentUser = try? JSONDecoder().decode(User.self, from: (UserDefaults.standard.object(forKey: "CurrentUser") as? Data)!)
            self.userDict = UserDefaults.standard.dictionary(forKey: "Users") as! [String : Data]
        }
        
        // UIPickerViewDataSource
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return seats.count
        }
        
        // UIPickerViewDelegate
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return String(seats[row])
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ReservationToConfirmation" {
            let reservation = Reservation(email: currentUser!.email, name: currentUser!.name, restaurant: self.restanrantName.text!, time: self.dateTimePicker.date.formatted(date: .abbreviated, time: .shortened), numPeople: seats[self.seatPickerView.selectedRow(inComponent: 0)], comment: self.commentForRestaurant.text!)
            self.currentUser!.reservations.append(reservation)
            let encoded = try? JSONEncoder().encode(self.currentUser!)
            UserDefaults.standard.set(encoded, forKey: "CurrentUser")
            self.userDict[self.currentUser!.email] = encoded
            UserDefaults.standard.set(self.userDict, forKey: "Users")
            let dest = segue.destination as! ConfirmationViewController
            dest.reservation = reservation
        }
    }
}
