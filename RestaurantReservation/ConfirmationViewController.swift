
//
//  ConfirmationViewController.swift
//  RestaurantReservation
//
//  Created by Tianqi Chen on 02/05/2023.
//

import UIKit

class ConfirmationViewController: UIViewController {
    // 連接storyboard上的UI元素
    @IBOutlet weak var customerNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var seatsLabel: UILabel!
    
    @IBOutlet weak var commentLabel: UILabel!
    
    @IBOutlet weak var homeButton: UIButton! // 新增：返回主頁按鈕
    
    // 創建一個可選的Reservation實例
    var reservation: Reservation? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初始化界面
        setupView()
    }
    
    // 設置界面的函數
    private func setupView() {
        // 隱藏返回按鈕
        self.navigationItem.hidesBackButton = true
        
        // 如果reservation不為nil，則更新餐廳名稱和預訂時間的標籤
        if let reservation = self.reservation {
            self.restaurantNameLabel.text = reservation.restaurant
            self.timeLabel.text = reservation.time
            self.customerNameLabel.text = reservation.name
            self.emailLabel.text = reservation.email
            self.seatsLabel.text = String(reservation.numPeople)
            self.commentLabel.text = reservation.comment
        }
    }
    
    // 新增：返回主頁按鈕的IBAction方法
    @IBAction func homeButtonTapped(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
