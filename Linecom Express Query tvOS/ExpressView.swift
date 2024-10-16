//
//  ExpressView.swift
//  Linecom Wear Express Watch App
//
//  Created by 程炜栋 on 2024/9/30.
//

import SwiftUI
import LinecomKit
import Alamofire

struct ExpressView: View {
    var nu: String
    var Provider: String
    var phone: String
    @State var tokenstate = false
    @AppStorage("CachedToken") var token = ""
    @State var ListofExpress = ["shunfeng": "顺丰速运", "yuantong": "圆通速递", "yunda": "韵达快递", "jtexpress": "极兔速递", "ems": "中国邮政", "shentong": "申通快递", "debangwuliu": "德邦物流", "jd": "京东物流", "zhongtong": "中通快递","dannao": "菜鸟速递","baishiwuliu": "百世快运"]
    @State var ListofState = ["0": "运输中", "1": "已揽件", "2": "异常", "3": "已签收", "4": "被拒收", "5": "派送中", "6": "被退回", "7": "已转寄", "8": "清关中", "10": "请求失败", "301": "本人已签收", "302": "异常已签收", "303": "已被代签收", "304": "已取出"]
    @State var status: String = ""
    @State var result = ""
    @State var nowState: String = ""
    @State var deliveryItems: [DeliveryItem] = []
    @State var isLoading: Bool = true
    @State var errormsg: String = ""
    var body: some View {
        if !isLoading && status == "200" {
        List {
            Section(header: Text("基本信息")) {
                Button (action: {
                    
                }) {
                    Text("承运商：\(ListofExpress[Provider] ?? "未知")")
                    Text("当前状态：\(ListofState[nowState] ?? "未知")")
                }
            }
            Section(header: Text("物流轨迹")) {
                ForEach(deliveryItems) { item in
                    Button(action: {
                        
                    }) {
                        VStack(alignment: .leading) {
                            // 显示时间
                            Text("\(item.time)")
                                .font(.headline)
                            
                            // 显示内容
                            Text("\(item.context)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            // 显示位置
                            Text("\(item.location)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 5) // 让每个列表项有一定的间距
                    }
                }
            }
        }
        .navigationTitle("运单详情")
        } else if isLoading {
            VStack {
                ProgressView()
                Text("正在查询...")
            }
            .onAppear() {
                getcsrfToken()
                doQuery()
            }
        } else if status != "200" {
            List {
                Text("请求失败")
                Text(errormsg)
            }
        }
    }
    
    struct DeliveryItem: Identifiable, Codable {
        var id = UUID()
        let time: String
        let context: String
        let location: String
    }
    
    // 创建包含 data 数组的结构体
    struct DeliveryData: Codable {
        let data: [DeliveryItem]
    }
    
    //#Preview {
    //    ExpressView()
    //}
    
    func getcsrfToken() {
        let endpoint = "https://api.linecom.net.cn/express/token"
        LinecomKit.NetworkAction.shared.requestString(endpoint) { resp, successd in
            if successd {
                token = resp
            }
        }
    }
    
    func doQuery() {
        let requrl = "https://www.kuaidi100.com/query?type=\(Provider)&postid=\(nu)&temp=0.\(Int64.random(in: 1000000000000000...9999999999999999))&phone=\(phone)"
        print(requrl)
        let Header: HTTPHeaders = ["Host": "www.kuaidi100.com",
                                   "Accept": "application/json, text/javascript, */*; q=0.01",
                                   "Sec-Fetch-Site": "same-origin",
                                   "Sec-Fetch-Mode": "cors",
                                   "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1 Safari/605.1.15",
                                   "Referer": "https://www.kuaidi100.com/",
                                   "Sec-Fetch-Dest": "empty",
                                   "X-Requested-With": "XMLHttpRequest",
                                   "Accept-Language": "zh-CN,zh-Hans;q=0.9",
                                   "Priority": "u=3, i",
                                   "Accept-Encoding": "gzip, deflate, br",
                                   "Cookie": "csrftoken=\(token); _adadqeqwe1321312dasddocHref=; _adadqeqwe1321312dasddocReferrer=; _adadqeqwe1321312dasddocTitle=kuaidi100; snt_query_meta=%7B%22date%22%3A%222024830%22%2C%22nums%22%3A%5B%22SF3108015968802%22%5D%7D; WWWID=WWW91C3E5FEFAE299935E504EF29BC852ED; userRouteID=172767247932793238; sortStatus=0"]
//        if tokenstate {
            LinecomKit.NetworkAction.shared.requestJSON(requrl, headers: Header) { resp, successd in
                if successd {
                    nowState = resp["state"].string ?? "0"
                    status = resp["status"].string ?? "10"
                    errormsg = resp["message"].string ?? ""
                    
                    // 解析 JSON 数据
                    for item in resp["data"].arrayValue {
                        let deliveryItem = DeliveryItem(
                            time: item["time"].stringValue,
                            context: item["context"].stringValue,
                            location: item["location"].stringValue
                        )
                        deliveryItems.append(deliveryItem) // 将解析的数据添加到数组中
                    }
                    isLoading = false
                    
                    
                } else {
                    status = "10"
                    isLoading = false
                }
            }
//        }
    }
}
