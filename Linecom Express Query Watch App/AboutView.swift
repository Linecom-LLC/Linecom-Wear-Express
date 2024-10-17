//
//  AboutView.swift
//  Linecom Wear Express Watch App
//
//  Created by 程炜栋 on 2024/9/30.
//

import SwiftUI
import AuthenticationServices

struct AboutView: View {
    var body: some View {
        VStack{
            HStack{
                Image("abouticon").resizable().scaledToFit().mask{Circle()}
                
                VStack{
                    Text("澪空软件")
                    Text("速递查询")
                    
                    Text(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String)
                    
                }.padding()
            }
            
            Text("Developed by Linecom").padding().onTapGesture {
                let session = ASWebAuthenticationSession(url: URL(string: "https://www.linecom.net.cn")!, callbackURLScheme: "") { _, _ in
                    return
                }
                session.prefersEphemeralWebBrowserSession = true
                session.start()
            }
        }
    }
}

#Preview {
    AboutView()
}
