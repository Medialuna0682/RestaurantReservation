//
//  ReservationListViewController.swift
//  RestaurantReservation
//
//  Created by Tianqi Chen on 16/05/2023.
//

import UIKit

class ReservationListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var currentUser: User?
    var userDict = [String : Data]()
    var reservationList: [Reservation] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reservationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReservationCell", for: indexPath)
        let reservation = self.reservationList[indexPath.row]
        cell.textLabel?.text = reservation.restaurant
        cell.detailTextLabel?.text = reservation.time
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.reservationList.remove(at: indexPath.row)
        self.currentUser!.reservations.remove(at: indexPath.row)
        let encoded = try? JSONEncoder().encode(self.currentUser!)
        self.userDict[self.currentUser!.email] = encoded
        UserDefaults.standard.set(encoded, forKey: "CurrentUser")
        UserDefaults.standard.set(self.userDict, forKey: "Users")
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = UserDefaults.standard.object(forKey: "CurrentUser") as? Data {
            self.currentUser = try? JSONDecoder().decode(User.self, from: data)
            if let currentUser = self.currentUser {
                self.reservationList = currentUser.reservations
                for r in self.reservationList {
                    print(r.restaurant + "|" + r.time)
                }
            }
        }
        self.userDict = UserDefaults.standard.dictionary(forKey: "Users") as! [String : Data]
    }
}
