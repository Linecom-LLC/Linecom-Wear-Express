//
//  AppDelegate.swift
//  Linecom Express Query
//
//  Created by 程炜栋 on 2025/2/24.
//

import Foundation
import UIKit
import SwiftUI

class AppDelegate: UIResponder, UIApplicationDelegate {
    @AppStorage("PushNotificationToken") var pushNotificationToken: String = ""
    @AppStorage("GlobalEnableNotification") var globalEnableNotification: Bool = true
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        pushNotificationToken = ""
        if globalEnableNotification {
            UIApplication.shared.registerForRemoteNotifications()
        }
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        pushNotificationToken = token
        print(token)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error.localizedDescription)
    }
}
