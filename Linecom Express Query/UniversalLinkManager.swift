//
//  UniversalLinkManager.swift
//  Linecom Express Query
//
//  Created by 程炜栋 on 2025/2/22.
//


import SwiftUI

class UniversalLinkManager: ObservableObject {
    @Published var shouldNavigateToExpressView: Bool = false
    @Published var nu: String = ""
    @Published var provider: String = ""
    @Published var phone: String = ""

    // 解析 Universal Link 参数
    func handleUniversalLink(url: URL) {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
              let queryItems = components.queryItems else { return }

        // 提取参数
        var parameters: [String: String] = [:]
        for item in queryItems {
            parameters[item.name] = item.value
        }

        // 更新参数并触发导航
        DispatchQueue.main.async {
            self.nu = parameters["nu"] ?? ""
            self.provider = parameters["provider"] ?? ""
            self.phone = parameters["phone"] ?? ""
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.shouldNavigateToExpressView = true
        }
    }
}
