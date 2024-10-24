//
//  ContentView.swift
//  Linecom Wear Express Watch App
//
//  Created by 程炜栋 on 2024/9/30.
//

import SwiftUI
import LinecomKit

struct ContentView: View {
    @State var nu: String = ""
    @State var Provider: String = ""
    @State var phone: String = ""
    @AppStorage("Firstused") var used = false
    @AppStorage("CachedToken") var token = ""
    @State var SideSelected: String = "Home"
    var body: some View {
        NavigationSplitView {
            List(selection: $SideSelected) {
                HStack {
                    Image(systemName: "house.fill")
                        .foregroundColor(SideSelected == "Home" ? .white : .blue)
                    Text("首页")
                }
                    .tag("Home")
                
                HStack {
                    Image(systemName: "info.circle")
                        .padding(.trailing, 4)
                        .foregroundColor(SideSelected == "About" ? .white : .blue)
                    Text("关于")
                }
                    .tag("About")
            }
        } detail: {
            if SideSelected == "Home" {
                QueryView()
                    .padding()
            } else if SideSelected == "About" {
                AboutView()
            }
        }
    }
}

#Preview {
    ContentView()
}
