//
//  NavigationContentView.swift
//  swift-tutorial-SwiftUI
//
//  Created by 江本匠 on 2020/11/24.
//  Copyright © 2020 S.Emoto. All rights reserved.
//

import Foundation
import SwiftUI

struct NavigationRootView: View {
    
    // MARK: - NavigationLinkを使ったpush遷移
//    var body: some View {
//        NavigationView {
//            /// NOTE: NavigationLinkはNavigationViewの子要素でなければならない
//            NavigationLink(destination: ContentView(), label: {
//                /// NOTE: Labelを指定すると遷移先へのリンクが自動的に生成される
//                Text("Move to ContentView")
//            })
//        }
//    }
    // MARK: - NavigationLinkが生成するLink以外でpush遷移（別のボタンとか）
    @State var isActiveContentView = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: ContentView(),
                               isActive: $isActiveContentView) {
                    /// 現状 @ViewBuilder をnilにしてインスタンス化できない
                    EmptyView()
                }
                
                Button(action: {
                    self.isActiveContentView.toggle()
                }) {
                    Text("Move to ContentView")
                }
                .background(Color.orange)
            }
            
            
        }
    }
}

struct NavigationRootView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationRootView()
    }
}
