//
//  Reservation.swift
//  RestaurantReservation
//
//  Created by Tianqi Chen on 09/05/2023.
//

import Foundation

class Reservation : Codable {
    var user: User
    var restaurant: String
    var time: String
    var numPeople: Int
    var comment: String
    
    init(user: User, restaurant: String, time: String, numPeople: Int, comment: String) {
        self.user = user
        self.restaurant = restaurant
        self.time = time
        self.numPeople = numPeople
        self.comment = comment
    }
}
