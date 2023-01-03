//
//  3DRotationRingScreen.swift
//  src (iOS)
//
//  Created by Sho Emoto on 2023/01/03.
//

import SwiftUI

struct ThreeDimensionalRotationRingScreen: View {

    @State private var degrees = 0.0
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    private let circleSize: CGFloat = 250

    var body: some View {
        VStack(spacing: -180.0) {
            RotationRing(
                circleSize: circleSize,
                colors: [.green, .yellow]
            )
            .rotationEffect(.degrees(degrees))

            RotationRing(
                circleSize: circleSize,
                colors: [.mint, .yellow]
            )
            .rotationEffect(.degrees(degrees))

            RotationRing(
                circleSize: circleSize,
                colors: [.teal, .orange]
            )
            .rotationEffect(.degrees(degrees))

            RotationRing(
                circleSize: circleSize,
                colors: [.cyan, .pink]
            )
            .rotationEffect(.degrees(degrees))

            RotationRing(
                circleSize: circleSize,
                colors: [.blue, .red]
            )
            .rotationEffect(.degrees(degrees))

            RotationRing(
                circleSize: circleSize,
                colors: [.green, .yellow]
            )
            .rotationEffect(.degrees(degrees))

            RotationRing(
                circleSize: circleSize,
                colors: [.mint, .yellow]
            )
            .rotationEffect(.degrees(degrees))

            RotationRing(
                circleSize: circleSize,
                colors: [.teal, .orange]
            )
            .rotationEffect(.degrees(degrees))

            RotationRing(
                circleSize: circleSize,
                colors: [.cyan, .pink]
            )
            .rotationEffect(.degrees(degrees))

            RotationRing(
                circleSize: circleSize,
                colors: [.blue, .red]
            )
            .rotationEffect(.degrees(degrees))

        }
        .rotation3DEffect(
            .degrees(75),
            axis: (x: 1, y: 0, z: 0)
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .onReceive(timer) { _ in
            degrees += 3
            if degrees > 360 {
                degrees = 0
            }
        }

    }
}

struct ThreeDimensionalRotationRingScreen_Previews: PreviewProvider {
    static var previews: some View {
        ThreeDimensionalRotationRingScreen()
    }
}
