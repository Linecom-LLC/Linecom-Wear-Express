//
//  SettingsView.swift
//  Linecom Express Query
//
//  Created by 程炜栋 on 2025/2/24.
//

import SwiftUI
import PushKit

struct SettingsView: View {
    @AppStorage("GlobalEnableNotification") var globalEnableNotification: Bool = true
    var body: some View {
        List {
            Section(header: Text("通知"), content: {
                Toggle("开启通知", isOn: $globalEnableNotification)
            })
            
            Section {
                NavigationLink(destination: {
                    AboutView()
                        .navigationTitle("关于")
                }, label: {
                    HStack {
                        Image(systemName: "info.circle")
                        Text("关于")
                    }
                })
            }
        }
    }
}

#Preview {
    SettingsView()
}
