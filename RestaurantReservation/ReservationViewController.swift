//
//  ReservationViewController.swift
//  RestaurantReservation
//
//  Created by Tianqi Chen on 02/05/2023.
//

import UIKit

class ReservationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var restanrantName: UILabel!
    @IBOutlet weak var commentForRestaurant: UITextField!
    @IBOutlet weak var dateTimePicker: UIDatePicker!
    @IBOutlet weak var seatPickerView: UIPickerView!
    
    var currentUser: User? = nil
    
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
            
            self.currentUser = try? JSONDecoder().decode(User.self, from: (UserDefaults.standard.object(forKey: "CurrentUser") as? Data)!)
        }
        
        @IBAction func dateTimePickerValueChanged(_ sender: UIDatePicker) {
            // Handle the date and time changes
        }
        
        @IBAction func submitButtonTapped(_ sender: UIButton) {
            // Handle submission
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
            let reservation = Reservation(email: currentUser!.email, restaurant: self.restanrantName.text!, time: self.dateTimePicker.date.formatted(date: .complete, time: .complete), numPeople: seats[self.seatPickerView.selectedRow(inComponent: 0)], comment: self.commentForRestaurant.text!)
            self.currentUser!.reservations.append(reservation)
            print(self.currentUser)
            let encoded = try? JSONEncoder().encode(self.currentUser!)
            UserDefaults.standard.set(encoded, forKey: "CurrentUser")
            let dest = segue.destination as! ConfirmationViewController
            dest.reservation = reservation
        }
    }
}
