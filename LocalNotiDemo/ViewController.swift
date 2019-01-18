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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonCreateNotification(_ sender: Any) {
        //creating the notification content
        let content = UNMutableNotificationContent()
        content.title = "Title"
        content.body = "Body"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: "NotificationIdentifier", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}

