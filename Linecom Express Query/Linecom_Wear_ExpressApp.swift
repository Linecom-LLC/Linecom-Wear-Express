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
