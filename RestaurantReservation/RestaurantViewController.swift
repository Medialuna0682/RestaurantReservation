//
//  RestaurantViewController.swift
//  RestaurantReservation
//
//  Created by Tianqi Chen on 02/05/2023.
//

import UIKit

class RestaurantViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    let restaurantList = [
           Restaurant(name: "餐厅一", location: "上海", rating: 4.5, cuisine: "川菜"),
           Restaurant(name: "餐厅二", location: "北京", rating: 4.0, cuisine: "粤菜"),
           Restaurant(name: "餐厅三", location: "广州", rating: 4.2, cuisine: "东北菜"),
           Restaurant(name: "餐厅四", location: "深圳", rating: 3.8, cuisine: "湘菜"),
       ]
       
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
                tableView.delegate = self
        self.navigationItem.hidesBackButton = true
    }
    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return restaurantList.count
        }
        
    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath)
            
            let restaurant = restaurantList[indexPath.row]
            cell.textLabel?.text = restaurant.name
            cell.detailTextLabel?.text = "\(restaurant.location) - \(restaurant.cuisine) - \(restaurant.rating)"
            
            return cell
        }
    }


