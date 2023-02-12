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
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(hue: manager.gyroRotationX, saturation: manager.gyroRotationY, brightness: regulateBrightness(brightness: manager.gyroRotationZ)),
                    Color(hue: manager.gyroRotationY, saturation: manager.gyroRotationZ, brightness: regulateBrightness(brightness: manager.gyroRotationX)),
                    Color(hue: manager.gyroRotationZ, saturation: manager.gyroRotationX, brightness: regulateBrightness(brightness: manager.gyroRotationY))
//                    Color(hue: manager.gyroRotationX, saturation: 1, brightness: 1),
//                    Color(hue: manager.gyroRotationY, saturation: 1, brightness: 1),
//                    Color(hue: manager.gyroRotationZ, saturation: 1, brightness: 1)
                ]),
                startPoint: .bottomLeading,
                endPoint: .topTrailing
            )
            .frame(width: 240.0, height: 240.0)
        }
        .onAppear {
            manager.startGyroUpdates()
        }
        .onDisappear {
            manager.stopGyroUpdates()
        }
    }

    private func regulateSaturation(saturation: Double) -> Double {
        if saturation < 0.5 {
            return 0.5
        }

        return saturation
    }

    private func regulateBrightness(brightness: Double) -> Double {
        if brightness < 0.5 {
            return 0.5
        }

        if brightness > 0.8 {
            return 0.8
        }

        return brightness
    }
}

struct HolographicEffectScreen_Previews: PreviewProvider {
    static var previews: some View {
        HolographicEffectScreen()
    }
}
