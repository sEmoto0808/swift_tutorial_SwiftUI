//
//  HolographicEffectScreen.swift
//  src (iOS)
//
//  Created by Sho Emoto on 2023/02/12.
//

import SwiftUI

struct HolographicEffectScreen: View {

    @ObservedObject private var manager = MotionManager()

    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .onAppear {
            manager.startGyroUpdates()
        }
        .onDisappear {
            manager.stopGyroUpdates()
        }
    }
}

struct HolographicEffectScreen_Previews: PreviewProvider {
    static var previews: some View {
        HolographicEffectScreen()
    }
}
