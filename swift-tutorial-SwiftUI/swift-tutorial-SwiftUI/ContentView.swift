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
    var body: some View {
        HStack {
            Text("Start Tutorial SwiftUI")
                .background(Color.blue)
            Text("hogehoge")
                .background(Color.red)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
