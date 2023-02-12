//
//  RotationRing.swift
//  src (iOS)
//
//  Created by Sho Emoto on 2023/01/03.
//

import SwiftUI

struct RotationRing: View {

    let circleSize: CGFloat
    let colors: [Color]

    private let gradient: LinearGradient

    init(circleSize: CGFloat, colors: [Color], degrees: Double = 0.0) {
        self.circleSize = circleSize
        self.colors = colors

        gradient = LinearGradient(
            gradient: Gradient(colors: colors),
            startPoint: .leading,
            endPoint: .trailing
        )
    }

    var body: some View {
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
    }
}

struct RotationRing_Previews: PreviewProvider {
    static var previews: some View {
        RotationRing(
            circleSize: 300,
            colors: [.blue, .red]
        )
        .previewLayout(.sizeThatFits)
    }
}
