//
//  Linecom_Express_Query_macOSApp.swift
//  Linecom Express Query macOS
//
//  Created by 程炜栋 on 2024/10/11.
//

import SwiftUI
import AppKit

@main
struct Linecom_Express_Query_macOSApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    init() {
        NSWindow.allowsAutomaticWindowTabbing = false
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
            .commands {
                CommandGroup(replacing: .appInfo) {
                    Button {
                        AboutWindowController.shared.show()
                    } label: {
                        HStack {
                            Image(systemName: "info.circle")
                            Text("关于 澪软速递查询")
                        }
                    }
                }
            }
    }
}
