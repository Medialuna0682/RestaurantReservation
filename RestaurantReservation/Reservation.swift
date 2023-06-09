//
//  Reservation.swift
//  RestaurantReservation
//
//  Created by Tianqi Chen on 09/05/2023.
//

import Foundation

class Reservation : Codable {
    var email: String
    var name: String
    var restaurant: String
    var time: String
    var numPeople: Int
    var comment: String
    
    init(email: String, name: String, restaurant: String, time: String, numPeople: Int, comment: String) {
        self.email = email
        self.name = name
        self.restaurant = restaurant
        self.time = time
        self.numPeople = numPeople
        self.comment = comment
    }
}
