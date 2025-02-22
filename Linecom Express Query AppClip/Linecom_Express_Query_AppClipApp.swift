//
//  Linecom_Express_Query_AppClipApp.swift
//  Linecom Express Query AppClip
//
//  Created by 程炜栋 on 2025/2/22.
//

import SwiftUI

@main
struct Linecom_Express_Query_AppClipApp: App {
    @AppStorage("hasOrderHandle") var hasOrderHandle: Bool = false
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL() { url in
                    UIPasteboard.general.string = url.absoluteString
                    hasOrderHandle = true
                }
        }
    }
}
