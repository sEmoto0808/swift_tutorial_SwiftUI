//
//  ChangeFrontBackScreen.swift
//  src (iOS)
//
//  Created by Sho Emoto on 2022/10/16.
//

import SwiftUI

struct ChangeFrontBackScreen: View {
    var body: some View {
        VStack(spacing: 0.0) {
            ZStack {
                itemViewBlue
                    .offset(x: -20, y: 11)

                itemViewRed
                    .offset(x: 20, y: -11)
            }

            Button {} label: {
                Text("Tap to Change")
                    .foregroundColor(.white)
                    .background(
                        Color.black
                        .contentShape(Rectangle())
                        .frame(width: 150, height: 44)
                    )
            }
        }
    }

    var itemViewBlue: some View {
        Text("")
            .background(
                Color.blue
                .contentShape(Rectangle())
                .frame(width: 170, height: 300)
            )
    }

    var itemViewRed: some View {
        Text("")
            .background(
                Color.red
                .contentShape(Rectangle())
                .frame(width: 170, height: 300)
            )
    }
}

struct ChangeFrontBackScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChangeFrontBackScreen()
    }
}
