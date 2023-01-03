//
//  3DRotationRingScreen.swift
//  src (iOS)
//
//  Created by Sho Emoto on 2023/01/03.
//

import SwiftUI

struct ThreeDimensionalRotationRingScreen: View {

    private let gradient = LinearGradient(
        gradient: Gradient(colors: [.blue, .red]),
        startPoint: .leading,
        endPoint: .trailing
    )

    let circleSize: CGFloat = 300.0

    @State private var degrees = 0.0
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Circle()
                    .stroke(
                        gradient,
                        style: .init(lineWidth: 5)
                    )
                    .frame(width: circleSize, height: circleSize)

                Image(systemName: "chevron.forward")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 24, height: 24)
                    .offset(y: -circleSize + 12)

                Image(systemName: "chevron.backward")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 24, height: 24)
                    .offset(y: 12)

                Image(systemName: "chevron.up")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 24, height: 24)
                    .offset(x: -circleSize/2, y: -circleSize/2 + 20)

                Image(systemName: "chevron.down")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 24, height: 24)
                    .offset(x: circleSize/2, y: -circleSize/2 + 20)
            }
            .rotationEffect(
                .degrees(degrees)
            )

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
