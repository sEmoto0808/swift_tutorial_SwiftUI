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

    var body: some View {
        VStack {
            Circle()
                .stroke(
                    gradient,
                    style: .init(lineWidth: 5)
                )
                .frame(width: circleSize, height: circleSize)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)

    }
}

struct ThreeDimensionalRotationRingScreen_Previews: PreviewProvider {
    static var previews: some View {
        ThreeDimensionalRotationRingScreen()
    }
}
