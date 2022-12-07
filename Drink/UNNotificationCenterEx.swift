//
//  UNNotificationCenterEx.swift
//  Drink
//
//  Created by JIHA YOON on 2022/12/07.
//

import Foundation
import UserNotifications

extension UNUserNotificationCenter {
    func addNotificationRequest(by alert: Alert) {
        let content = UNMutableNotificationContent()
        content.title = "물 마실 시간이예요!!!!"
        content.body = "물 마셔 마시라고!!!!"
        content.sound = .default
        content.badge = 1
        
        let dateComponet = Calendar.current.dateComponents([.hour, .minute], from: alert.date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponet, repeats: alert.isOn)
        
        let request = UNNotificationRequest(identifier: alert.id, content: content, trigger: trigger)
        
        self.add(request)
    }
}
