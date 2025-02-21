//
//  BookmarkView.swift
//  Linecom Express Query Watch App
//
//  Created by 程炜栋 on 2025/2/21.
//

import SwiftUI

struct BookmarkView: View {
    @StateObject var bookmarkManager = BookmarkManager()
    
    @State var ListofExpress = ["shunfeng": "顺丰速运", "yuantong": "圆通速递", "yunda": "韵达快递", "jtexpress": "极兔速递", "ems": "中国邮政", "shentong": "申通快递", "debangwuliu": "德邦物流", "jd": "京东物流", "zhongtong": "中通快递","dannao": "菜鸟速递","baishiwuliu": "百世快运"]
    var body: some View {
        NavigationStack {
            if bookmarkManager.bookmarks.isEmpty {
                VStack {
                    Image(systemName: "bookmark.slash.fill")
                    Text("还没有书签哦")
                }
            } else {
                List {
                    ForEach(BookmarkManager().bookmarks, id: \.id) { bookmark in
                        HStack {
                            NavigationLink(destination: {
                                ExpressView(nu: bookmark.nu, Provider: bookmark.provider, phone: bookmark.phone, isBookmark: true)
                            }, label: {
                                HStack {
                                    Image(systemName: "text.page")
                                    VStack {
                                        Text(bookmark.nu)
                                            .font(.headline)
                                        Text("承运商: "+(ListofExpress[bookmark.provider] ?? ""))
                                            .font(.subheadline)
                                    }
                                }
                            })
                            .swipeActions(edge: .trailing) {
                                Button(action: {
                                    bookmarkManager.removeBookmark(bookmark)
                                }) {
                                    Image(systemName: "trash")
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    BookmarkView()
}
