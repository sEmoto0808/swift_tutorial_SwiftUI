//
//  ChangeFrontBackScreen.swift
//  src (iOS)
//
//  Created by Sho Emoto on 2022/10/16.
//

import SwiftUI

struct ChangeFrontBackScreen: View {
    @State var isRedTop: Bool = true
    @State var isStartChanging: Bool = false

    let bottomOffset: (x: CGFloat, y: CGFloat) = (x: -20, y: 11)
    let bottomSlideOffset: (x: CGFloat, y: CGFloat) = (x: -90, y: 11)
    let topOffset: (x: CGFloat, y: CGFloat) = (x: 20, y: -11)
    let topSlideOffset: (x: CGFloat, y: CGFloat) = (x: 90, y: -11)

    @State var blueOffset: (x: CGFloat, y: CGFloat) = (x: -20, y: 11)
//    @State var blueSlideOffset: (x: CGFloat, y: CGFloat) = (x: -20, y: 11)
    @State var blueZIndex: Double = 0
    @State var redOffset: (x: CGFloat, y: CGFloat) = (x: 20, y: -11)
//    @State var redSlideOffset: (x: CGFloat, y: CGFloat) = (x: 20, y: -11)
    @State var redZIndex: Double = 1

    let duration = 0.2

    var body: some View {
        VStack(spacing: 0.0) {
            ZStack {
                itemViewBlue
//                    .offset(x: isRedTop ? blueOffset.x * 2:blueOffset.x, y: blueOffset.y)
                    .offset(x: blueOffset.x, y: blueOffset.y)
//                    .offset(x: isRedTop ? -20:20, y: isRedTop ? 11:-11)
                    .zIndex(blueZIndex)
                    .animation(.easeInOut(duration: duration), value: isRedTop)
                    .onChange(of: isRedTop) { newValue in
                        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                            withAnimation(.easeIn(duration: duration)) {
                                if newValue {
                                    blueOffset = bottomOffset
                                    blueZIndex = 0
                                } else {
                                    blueOffset = topOffset
                                    blueZIndex = 1
                                }
                            }
                        }

                    }


                itemViewRed
//                    .offset(x: isRedTop ? 20:40, y: isRedTop ? -11:11)
                    .offset(x: redOffset.x, y: redOffset.y)
//                    .offset(x: isRedTop ? 20:-20, y: isRedTop ? -11:11)
                    .zIndex(redZIndex)
                    .animation(.easeInOut(duration: duration), value: isRedTop)
                    .onChange(of: isRedTop) { newValue in
                        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                            withAnimation(.easeIn(duration: duration)) {
                                if newValue {
                                    redOffset = topOffset
                                    redZIndex = 1
                                } else {
                                    redOffset = bottomOffset
                                    redZIndex = 0
                                }
                            }
                        }

                    }
            }

            Button {
                isStartChanging = true
//                withAnimation(.easeIn(duration: 1.0)) {
                    if isRedTop {
                        blueOffset = bottomSlideOffset
                        redOffset = topSlideOffset
                    } else {
                        blueOffset = topSlideOffset
                        redOffset = bottomSlideOffset
                    }
                isRedTop.toggle()
//                }
            } label: {
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
