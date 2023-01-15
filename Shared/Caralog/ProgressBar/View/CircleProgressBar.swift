//
//  CircleProgressBar.swift
//  src (iOS)
//
//  Created by Sho Emoto on 2023/01/15.
//

import SwiftUI

struct CircleProgressBar: View {
    @Binding var progress: CGFloat

    var body: some View {
        ZStack {
            // 背景の円
            Circle()
            // 円形の線を描画するように指定
                .stroke(lineWidth: 24.0)
                .opacity(0.3)
                .foregroundColor(.blue)

            // 進捗を示す円
            Circle()
            // 始点/終点を指定して円を描画する
            // 始点/終点には0.0-1.0の範囲に正規化した値を指定する
                .trim(from: 0.0, to: min(progress, 1.0))
            // 線の端の形状などを指定
                .stroke(style: StrokeStyle(lineWidth: 24, lineCap: .round, lineJoin: .round))
                .foregroundColor(.blue)
            // デフォルトの原点は時計の12時の位置ではないので回転させる
                .rotationEffect(Angle(degrees: 270.0))

            // 進捗率のテキスト
            Text(String(format: "%.0f%%", min(progress, 1.0) * 100.0))
                .font(.largeTitle)
                .bold()
        }
    }
}

struct CircleProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressBar(
            progress: .constant(0.3)
        )
        .previewLayout(.sizeThatFits)
    }
}
