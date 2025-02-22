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
                    .frame(width: 150)
                
                VStack{
                    Text("澪空软件速递查询")
                    
                    Text(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String)
                    
                }.padding()
            }
            Divider()
            
            Text("Developed by Linecom").padding().font(.headline)
            Spacer()
        }
    }
}

#Preview {
    AboutView()
}
