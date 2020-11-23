//
//  ContentView.swift
//  swift-tutorial-SwiftUI
//
//  Created by 江本匠 on 2020/11/23.
//  Copyright © 2020 S.Emoto. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // MARK: - ラベル表示
//    var body: some View {
//        Text("Start Tutorial SwiftUI")
//    }
    
    // MARK: - リスト表示
//    var body: some View {
//        List {
//            Text("hogehoge")
//            Text("fugafuga")
//        }
//    }
    
    // MARK: - 複数要素の配置（垂直）: VStack
//    var body: some View {
//        VStack {
//            Text("Start Tutorial SwiftUI")
//                .background(Color.blue)
//            List {
//                Text("hogehoge")
//                Text("fugafuga")
//            }
//        }
//    }
    
    // MARK: - 複数要素の配置（水平）: HStack
//    var body: some View {
//        HStack {
//            Text("Start Tutorial SwiftUI")
//                .background(Color.blue)
//            Text("hogehoge")
//                .background(Color.red)
//        }
//    }

    // MARK: - ボタン表示とタップアクション
    @State var checkButtonActionText = "Before Tapped."
    
    var body: some View {
        VStack {
            Button(action: {
                /// タップアクション
                self.checkButtonActionText = "Button Tapped."  /// selfは必須
            }) {
                /// ボタンの設定
                Text("Button")
                    .padding(.horizontal, 5.0)
                    .background(Color.orange)
                    .border(Color.green, width: 2)
            }
            
            Text(checkButtonActionText)
                .padding(.top, 10.0)
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
