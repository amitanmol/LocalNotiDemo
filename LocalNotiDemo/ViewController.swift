//
//  ViewController.swift
//  LocalNotiDemo
//
//  Created by Amit Kumar Singh on 18/01/19.
//  Copyright © 2019 Amit Kumar Singh. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    let center = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Remove all delivered notificatios
        center.removeAllDeliveredNotifications()
    }

    @IBAction func buttonCreateNotification(_ sender: Any) {
        //creating the notification content
        let content = UNMutableNotificationContent()
        content.title = "Title1"
        content.body = "Body1"
        content.sound = .default
        content.userInfo = ["User": "User1"]
        
        var trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        var request = UNNotificationRequest(identifier: "NotificationIdentifier", content: content, trigger: trigger)
        center.add(request, withCompletionHandler: nil)
        
        content.title = "Title2"
        content.body = "Body2"
        content.userInfo = ["User": "User2"]
        trigger = UNTimeIntervalNotificationTrigger(timeInterval: 15, repeats: false)
        request = UNNotificationRequest(identifier: "NotificationIdentifier1", content: content, trigger: trigger)
        center.add(request, withCompletionHandler: nil)
    }
    
    @IBAction func buttonReadNotifications(_ sender: Any) {
        // Find list of Local Notification the app has already set
        center.getPendingNotificationRequests { (notifications) in
            print("Total Pending Notifications: \(notifications.count)")
            for item in notifications {
                print("\(item.content.userInfo) \n")
            }
        }
        
        center.getDeliveredNotifications { (notifications) in
            print("Total Delivered Notifications: \(notifications.count)")
            for item in notifications {
                print("\(item) \n")
            }
        }
    }
}

