//
//  Linecom_Express_Query_AppClipApp.swift
//  Linecom Express Query AppClip
//
//  Created by 程炜栋 on 2025/2/22.
//

import SwiftUI

@main
struct Linecom_Express_Query_AppClipApp: App {
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
