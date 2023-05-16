//
//  ReservationListViewController.swift
//  RestaurantReservation
//
//  Created by Tianqi Chen on 16/05/2023.
//

import UIKit

class ReservationListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var currentUser: User?
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
        var selected = self.reservationList[indexPath.row]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.currentUser = try? JSONDecoder().decode(User.self, from: (UserDefaults.standard.object(forKey: "CurrentUser") as? Data)!)
        self.reservationList = self.currentUser!.reservations
        for r in self.reservationList {
            print(r.restaurant + "|" + r.time)
        }
    }
}
