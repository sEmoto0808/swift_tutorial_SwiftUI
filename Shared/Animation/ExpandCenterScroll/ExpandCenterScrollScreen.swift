//
//  ExpandCenterScrollScreen.swift
//  src (iOS)
//
//  Created by Sho Emoto on 2022/07/10.
//

import SwiftUI

// Scrollして画面中央に来たViewを拡大する
struct ExpandCenterScrollScreen: View {

    let halfScreenWidth = UIScreen.main.bounds.width / 2
    let magnification: CGFloat = 1.8

    var body: some View {

        ScrollView(.horizontal, showsIndicators: false) {

            HStack(alignment: .center) {

                ForEach(0..<10, id: \.self) { _ in

                    GeometryReader { geometry in

                        Circle()
                            .frame(width: 100, height: 100)
                            .scaleEffect(

                                max(
                                    1,
                                    magnification - abs(geometry.frame(in: .global).midX - halfScreenWidth) / halfScreenWidth * magnification
                                )
                            )
                    }
                    .frame(width: 100, height: magnification * 100)
                    .padding()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct ExpandCenterScrollScreen_Previews: PreviewProvider {
    static var previews: some View {
        ExpandCenterScrollScreen()
    }
}
