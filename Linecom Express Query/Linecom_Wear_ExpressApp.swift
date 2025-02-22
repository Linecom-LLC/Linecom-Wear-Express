//
//  Linecom_Wear_ExpressApp.swift
//  Linecom Wear Express
//
//  Created by 程炜栋 on 2024/9/30.
//

import SwiftUI
import UIKit

@main
struct Linecom_Wear_ExpressApp: App {
    @StateObject var universalLinkManager = UniversalLinkManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(universalLinkManager) // 注入环境对象
                .onOpenURL { url in
                    // 解析 Universal Link 并更新状态
                    universalLinkManager.handleUniversalLink(url: url)
                }
        }
    }
}
