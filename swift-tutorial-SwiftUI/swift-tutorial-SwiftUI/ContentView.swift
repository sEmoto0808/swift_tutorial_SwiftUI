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
//    @State var checkButtonActionText = "Before Tapped."
//
//    var body: some View {
//        VStack {
//            Button(action: {
//                /// タップアクション
//                self.checkButtonActionText = "Button Tapped."  /// selfは必須
//            }) {
//                /// ボタンの設定
//                Text("Button")
//                    .padding(.horizontal, 5.0)
//                    .background(Color.orange)
//                    .border(Color.green, width: 2)
//            }
//
//            Text(checkButtonActionText)
//                .padding(.top, 10.0)
//        }
//
//    }
    
    // MARK: - 画像ありボタン表示
//    var body: some View {
//        VStack {
//            Button(action: {
//                /// タップアクション
//            }) {
//                /// ボタンの設定
//                Image("download")
//                    .resizable()  /// サイズを変更する時に必要
//                    .frame(width: 30.0, height: 30.0)
//
//                Text("Download")
//            }
//            .padding(.horizontal, 10.0)
//            .background(Color.orange)
//            .border(Color.green, width: 2)
//        }
//    }
    
    // MARK: - ActionSheetを表示
//    @State var isShownActionSheet = false
//    @State var actionSheetText = "Show ActionSheet"
//
//    var body: some View {
//        Button(action: {
//            self.isShownActionSheet = true
//        }) {
//            Text(actionSheetText)
//        }
//        .actionSheet(isPresented: $isShownActionSheet, content: {
//            ActionSheet(title: Text("Title"),
//                        message: Text("Message"),
//                        buttons: [.default(Text("Default")) { self.actionSheetText = "Tapped Default" },
//                                  .destructive(Text("Destructive")),
//                                  .cancel()])
//        })
//    }
    
    // MARK: - Alertを表示
    @State var isShownAlert = false
    @State var alertText = "Show Alert"
    
    var body: some View {
        Button(action: {
            self.isShownAlert = true
        }) {
            Text(alertText)
        }
        .alert(isPresented: $isShownAlert, content: {
            Alert(title: Text("Title"),
                  message: Text("Message"),
                  primaryButton: .default(Text("Default")) { self.alertText = "Tapped Default" },
                  secondaryButton: .destructive(Text("Destructive")))
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
