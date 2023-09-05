//
//  WaveAnimationScreen.swift
//  src (iOS)
//
//  Created by Sho Emoto on 2023/08/29.
//

import SwiftUI

struct WaveAnimationScreen: View {
    @State private var percent = 20.0
        @State private var waveOffset1 = Angle(degrees: 0)
    @State private var waveOffset2 = Angle(degrees: 90)

    private let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            Wave2(offSet: Angle(degrees: waveOffset2.degrees), percent: percent)
                .fill(Color.blue.opacity(0.5))
                .ignoresSafeArea(.all)
                .animation(.easeInOut(duration: 5), value: percent)

            Wave(offSet: Angle(degrees: waveOffset1.degrees), percent: percent)
                .fill(Color.blue)
                .ignoresSafeArea(.all)
                .animation(.easeInOut(duration: 5), value: percent)
        }
        .onAppear {
            withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: false)) {
                self.waveOffset1 = Angle(degrees: 360)
                self.waveOffset2 = Angle(degrees: -270)
            }

            //            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            //                withAnimation(.easeInOut(duration: 5)) {
            //                    self.percent = 70.0
            //                }
            //            }

        }
        .onReceive(timer) { _ in
            percent += 0.3
            if percent > 70 {
                timer.upstream.connect().cancel()
            }
        }
    }
}

struct WaveAnimationScreen_Previews: PreviewProvider {
    static var previews: some View {
        WaveAnimationScreen()
    }
}

struct Wave: Shape {

    var offSet: Angle
    var percent: Double

    var animatableData: Double {
        get { offSet.degrees }
        set { offSet = Angle(degrees: newValue) }
    }

    func path(in rect: CGRect) -> Path {
        var p = Path()

        let lowestWave = 0.02
        let highestWave = 1.00

        let newPercent = lowestWave + (highestWave - lowestWave) * (percent / 100)
        let waveHeight = 0.040 * rect.height
        let yOffSet = CGFloat(1 - newPercent) * (rect.height - 4 * waveHeight) + 2 * waveHeight
        let startAngle = offSet
        let endAngle = offSet + Angle(degrees: 360 + 10)

        p.move(to: CGPoint(x: 0, y: yOffSet + waveHeight * CGFloat(sin(offSet.radians))))

        for angle in stride(from: startAngle.degrees, through: endAngle.degrees, by: 5) {
            let x = CGFloat((angle - startAngle.degrees) / 360) * rect.width
            p.addLine(
                to: CGPoint(
                x: x,
                y: yOffSet + waveHeight * CGFloat(sin(Angle(degrees: angle).radians)))
            )
        }

        p.addLine(to: CGPoint(x: rect.width, y: rect.height))
        p.addLine(to: CGPoint(x: 0, y: rect.height))
        p.closeSubpath()

        return p
    }
}

struct Wave2: Shape {

    var offSet: Angle
    var percent: Double

    var animatableData: Double {
        get { offSet.degrees }
        set { offSet = Angle(degrees: newValue) }
    }

    func path(in rect: CGRect) -> Path {
        var p = Path()

        let lowestWave = 0.02
        let highestWave = 1.00

        let newPercent = lowestWave + (highestWave - lowestWave) * (percent / 100)
        let waveHeight = 0.040 * rect.height
        let yOffSet = CGFloat(1 - newPercent) * (rect.height - 4 * waveHeight) + 2 * waveHeight
        let startAngle = offSet
        let endAngle = offSet + Angle(degrees: 360 + 10)

        p.move(to: CGPoint(x: 0, y: yOffSet + waveHeight * CGFloat(sin(offSet.radians))))

        for angle in stride(from: startAngle.degrees, through: endAngle.degrees, by: 5) {
            let x = CGFloat((angle - startAngle.degrees) / 360) * rect.width
            p.addLine(to: CGPoint(x: x, y: yOffSet + waveHeight * CGFloat(sin(Angle(degrees: angle).radians))))
        }

        p.addLine(to: CGPoint(x: rect.width, y: rect.height))
        p.addLine(to: CGPoint(x: 0, y: rect.height))
        p.closeSubpath()

        return p
    }
}
