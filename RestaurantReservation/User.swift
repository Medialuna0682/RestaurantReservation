//
//  User.swift
//  RestaurantReservation
//
//  Created by Tianqi Chen on 09/05/2023.
//

import Foundation

class User : Codable {
    var name: String
    var phoneNo: String
    var email: String
    var password: String
    var reservations: [Reservation]
    
    init(name: String, phoneNo: String, email: String, password: String) {
        self.name = name
        self.phoneNo = phoneNo
        self.email = email
        self.password = password
        self.reservations = []
    }
}
