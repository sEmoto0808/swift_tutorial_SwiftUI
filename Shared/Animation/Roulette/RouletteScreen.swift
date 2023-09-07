//
//  RouletteScreen.swift
//  src (iOS)
//
//  Created by Sho Emoto on 2023/09/05.
//

import SwiftUI

struct RouletteScreen: View {
    let items: [RouletteItem] = [
        .init(text: "0", startDegree: 0, endDegree: 45, color: .red),
        .init(text: "1", startDegree: 45, endDegree: 90, color: .yellow),
        .init(text: "2", startDegree: 90, endDegree: 135, color: .green),
        .init(text: "3", startDegree: 135, endDegree: 180, color: .orange),
        .init(text: "4", startDegree: 180, endDegree: 225, color: .blue),
        .init(text: "5", startDegree: 225, endDegree: 270, color: .pink),
        .init(text: "6", startDegree: 270, endDegree: 315, color: .mint),
        .init(text: "7", startDegree: 315, endDegree: 360, color: .purple)
    ]

    @State var isRotate = false
    @State var resultDegree: Double = 360

    var body: some View {
        VStack(spacing: 0.0) {
            HStack(spacing: 24.0) {
                Button {
                    isRotate = false
                    resultDegree = 0
                } label: {
                    Text("リセット")
                        .foregroundColor(.red)
                }

                Button {
                    isRotate = true
                    resultDegree = Double.random(in: 0..<360) + 360
                } label: {
                    Text("スタート!")
                }
                .disabled(isRotate)
            }
            .frame(height: 100.0)

            Image(systemName: "triangle.fill")
                .foregroundColor(.black)
                .rotationEffect(.init(degrees: 180))

            GeometryReader { geometry in
                Roulette(
                    center: .init(x: geometry.size.width / 2, y: geometry.size.height / 2),
                    radius: 150,
                    items: items
                )
                .rotationEffect(Angle.degrees(resultDegree))
                .animation(.easeInOut(duration: isRotate ? 2:0), value: resultDegree)
            }
            .frame(height: 300.0)
        }
    }
}

struct Roulette: View {
    let center: CGPoint
    let radius: CGFloat
    let items: [RouletteItem]

    var body: some View {
        ForEach(items, id: \.self) { item in
            ZStack {
                Path { path in
                    path.move(to: center)
                    path.addArc(
                        center: center,
                        radius: radius,
                        startAngle: .init(degrees: item.startDegree),
                        endAngle: .init(degrees: item.endDegree),
                        clockwise: false
                    )
                }
                .fill(item.color)

                let textDegree = (item.startDegree + item.endDegree) / 2

                Text(item.text)
                    .rotationEffect(.init(degrees: textDegree + 90))
                    .offset(x: radius * 0.8 * cos(textDegree/180 * 3.14), y: radius * 0.8 * sin(textDegree/180 * 3.14))
            }
        }
    }
}

// MARK: - Roulette Data
struct RouletteItem: Hashable {
    let text: String
    let startDegree: Double
    let endDegree: Double
    let color: Color
}

struct RouletteScreen_Previews: PreviewProvider {
    static var previews: some View {
        RouletteScreen()
    }
}
