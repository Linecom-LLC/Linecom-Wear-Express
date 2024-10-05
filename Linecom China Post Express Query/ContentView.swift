//
//  ContentView.swift
//  Linecom Wear Express Watch App
//
//  Created by 程炜栋 on 2024/9/30.
//

import SwiftUI

struct ContentView: View {
    @State var nu: String = ""
    @State var Provider: String = "ems"
    @State var phone: String = ""
    @State var selecation: String? = "Home"
    var body: some View {
        NavigationView {
            List {
                TextField("快递单号", text: $nu)
                    .swipeActions(edge: .trailing, content: {
                        Button(action: {
                            nu = ""
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                        })
                    })
                if Provider == "shunfeng" {
                    TextField("手机号后四位", text: $phone)
                }
                #if os(macOS)
                Section {
                    NavigationLink(destination: WelcomeView(), tag: "Home", selection: $selecation) {
                            HStack {
                                Image(systemName: "house")
                                Text("首页")
                            }
                    }
                }
                #endif
                
                Section {
                    if Provider == "shunfeng" {
                        if phone.count != 4 || phone.isEmpty || Provider.isEmpty || nu.isEmpty {
                            NavigationLink(destination: ExpressView(nu: nu, Provider: Provider, phone: phone)) {
                                HStack {
                                    Image(systemName: "rectangle.and.text.magnifyingglass")
                                    Text("查询")
                                }
                            }
                            .disabled(true)
                        } else {
                            NavigationLink(destination: ExpressView(nu: nu, Provider: Provider, phone: phone)) {
                                HStack {
                                    Image(systemName: "rectangle.and.text.magnifyingglass")
                                    Text("查询")
                                }
                            }
                        }
                    } else {
                        if Provider.isEmpty || nu.isEmpty {
                            NavigationLink(destination: ExpressView(nu: nu, Provider: Provider, phone: phone)) {
                                HStack {
                                    Image(systemName: "rectangle.and.text.magnifyingglass")
                                    Text("查询")
                                }
                            }
                            .disabled(true)
                        } else {
                            NavigationLink(destination: ExpressView(nu: nu, Provider: Provider, phone: phone)) {
                                HStack {
                                    Image(systemName: "rectangle.and.text.magnifyingglass")
                                    Text("查询")
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("中国邮政快递查询")
        }
    }
}

#Preview {
    ContentView()
}
