//
//  AboutWindowController.swift
//  Linecom Express Query
//
//  Created by 程炜栋 on 2026/2/9.
//


import AppKit
import SwiftUI


final class AboutWindowController {
    static let shared = AboutWindowController()
    private var window: NSWindow?

    func show() {
        if window == nil {
            let view = AboutView()
            let hosting = NSHostingView(rootView: view)

            let window = NSWindow(
                contentRect: NSRect(x: 0, y: 0, width: 640, height: 240),
                styleMask: [.titled, .closable],
                backing: .buffered,
                defer: false
            )

            window.center()
            window.contentView = hosting
            window.title = "关于 澪软速递查询"
            window.isReleasedWhenClosed = false
            self.window = window
        }

        window?.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
    }
}
