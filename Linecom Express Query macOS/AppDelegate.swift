//
//  AppDelegate.swift
//  澪软速递查询
//
//  Created by 程炜栋 on 2024/10/11.
//

import Foundation
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // 加载自定义菜单
        if let mainMenu = NSNib(nibNamed: "MainMenu", bundle: nil) {
            var topLevelObjects: NSArray? = nil
            if mainMenu.instantiate(withOwner: NSApplication.shared, topLevelObjects: &topLevelObjects) {
                NSApplication.shared.mainMenu = topLevelObjects?.first(where: { $0 is NSMenu }) as? NSMenu
            }
        }
        
        if let window = NSApplication.shared.windows.first {
                        // 禁用全屏模式
            window.styleMask.remove(.resizable)
        }
    }
    @IBAction func openHelp(_ sender: Any) {
        NSWorkspace.shared.open(URL(string: "https://lkurl.top/support")!)
    }
}


