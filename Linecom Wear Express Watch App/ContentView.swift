//
//  ContentView.swift
//  Linecom Wear Express Watch App
//
//  Created by 程炜栋 on 2024/9/30.
//

import SwiftUI

struct ContentView: View {
    @State var nu: String = "SF3108015968802"
    @State var Provider: String = ""
    @State var phone: String = "3505"
    var body: some View {
        NavigationStack {
            List {
                Picker("快递承运商", selection: $Provider, content: {
                    Text("顺丰速运").tag("shunfeng")
                    Text("中国邮政EMS").tag("ems")
                })
                TextField("快递单号", text: $nu)
                if Provider == "shunfeng" {
                    TextField("手机号后四位", text: $phone)
                }
                
                Section {
                    if Provider == "shunfeng" {
                        NavigationLink(destination: ExpressView(nu: nu, Provider: Provider, phone: phone)) {
                            Text("查询")
                        }
                        .disabled(phone.isEmpty)
                    } else {
                        NavigationLink(destination: ExpressView(nu: nu, Provider: Provider, phone: phone)) {
                            Text("查询")
                        }
                        .disabled(nu.isEmpty)
                    }
                }
            }
            .navigationTitle("快递查询")
            .containerBackground(Color(hue: 100/360, saturation: 60/100, brightness: 100/100).gradient, for: .navigation)
        }
    }
}

#Preview {
    ContentView()
}
