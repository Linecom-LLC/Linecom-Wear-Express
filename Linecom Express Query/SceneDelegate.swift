//
//  SceneDelegate.swift
//  Linecom Express Query
//
//  Created by 程炜栋 on 2025/2/22.
//


import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        guard userActivity.activityType == NSUserActivityTypeBrowsingWeb,
              let url = userActivity.webpageURL else { return }

        handleUniversalLink(url: url)
    }

    private func handleUniversalLink(url: URL) {
        if let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
           components.path == "/express",
           let queryItems = components.queryItems {

            let nu = queryItems.first(where: { $0.name == "nu" })?.value ?? ""
            let provider = queryItems.first(where: { $0.name == "provider" })?.value ?? ""
            let phone = queryItems.first(where: { $0.name == "phone" })?.value ?? ""

            DispatchQueue.main.async {
                let expressView = ExpressView(nu: nu, Provider: provider, phone: phone)
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                    let window = UIWindow(windowScene: windowScene)
                    window.rootViewController = UIHostingController(rootView: expressView)
                    self.window = window
                    window.makeKeyAndVisible()
                }
            }
        }
    }
}
