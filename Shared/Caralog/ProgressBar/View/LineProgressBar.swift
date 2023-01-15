//
//  LineProgressBar.swift
//  src (iOS)
//
//  Created by Sho Emoto on 2023/01/15.
//

import SwiftUI

struct LineProgressBar: View {
    @Binding var progress: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 8.0) {
                // 進捗率のテキスト
                Text(String(format: "%.0f%%", min(progress, 1.0) * 100.0))
                    .font(.largeTitle)
                    .bold()

                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(height: 24.0)
                        .opacity(0.3)
                        .foregroundColor(.blue)
                        .cornerRadius(12)

                    Rectangle()
                        .frame(
                            width: geometry.size.width * progress,
                            height: 24.0
                        )
                        .foregroundColor(.blue)
                        .cornerRadius(12)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }

    }
}

struct LineProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        LineProgressBar(
            progress: .constant(0.3)
        )
        .previewLayout(.sizeThatFits)
    }
}
