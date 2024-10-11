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
    var body: some View {
        NavigationStack {
            List {
                Picker("快递承运商", selection: $Provider, content: {
                    Text("请选择").tag("")
                    Text("顺丰速运").tag("shunfeng")
                    Text("中国邮政").tag("ems")
                    Text("圆通速递").tag("yuantong")
                    Text("京东物流").tag("jd")
                    Text("中通快递").tag("zhongtong")
                    Text("韵达快递").tag("yunda")
                    Text("极兔速递").tag("jtexpress")
                    Text("申通快递").tag("shentong")
                    Text("德邦物流").tag("debangwuliu")
                    Text("菜鸟速递（丹鸟）").tag("danniao")
                    Text("百世快运").tag("baishiwuliu")
                })
                TextField("快递单号", text: $nu)
                    .swipeActions(edge: .trailing, content: {
                        Button(action: {
                            nu = ""
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                        })
                    })
                    .autocorrectionDisabled()
                if Provider == "shunfeng" {
                    TextField("手机号后四位", text: $phone)
                }
                
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
                Section {
                    NavigationLink(destination: {AboutView().navigationTitle("关于")}, label: {
                        HStack {
                            Image(systemName: "info.circle")
                            Text("关于")
                        }
                    })
                }
            }
            .navigationTitle("快递查询")
            .onAppear() {
                if !used {
                    getcsrfToken()
                    used = true
                }
            }
        }
    }
    func getcsrfToken() {
        let endpoint = "https://api.linecom.net.cn/express/token"
        LinecomKit.NetworkAction.shared.requestString(endpoint) { resp, successd in
            if successd {
                token = resp
            }
        }
    }
}

#Preview {
    ContentView()
}
