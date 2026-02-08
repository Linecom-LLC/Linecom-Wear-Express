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
                Image("abouticon").resizable().scaledToFit()
                    .cornerRadius(30)
                    .padding()
                    .frame(width: 128)
                
                VStack{
                    Text("澪空软件速递查询")
                    
                    Text(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String)
                    
                }.padding()
            }
            Divider()
            
            Text("Developed by Linecom").padding().font(.headline)
            Link("浙ICP备2025182988号-6A", destination: URL(string: "https://beian.miit.gov.cn")!)
                .foregroundColor(.secondary)
            Spacer()
        }
    }
}

#Preview {
    AboutView()
}
