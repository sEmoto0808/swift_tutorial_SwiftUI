//
//  RotationScreen.swift
//  src (iOS)
//
//  Created by Sho Emoto on 2022/07/03.
//

import SwiftUI

struct RotationCarouselScreen: View {

    // MARK: rotate image
    @State var imageAnimated = false
    @State var degrees = 0.0

    var body: some View {
        VStack {

            Text("Food Title")
                .font(.largeTitle.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 100, alignment: .top)
                .padding(.top)

            HStack(spacing: 10) {

                VStack(alignment: .leading, spacing: 25) {

                    menuLabel(text: "1 Hour", icon: "flame")

                    menuLabel(text: "40", icon: "bookmark")

                    menuLabel(text: "Easy", icon: "bolt")

                    menuLabel(text: "Safety", icon: "safari")

                    menuLabel(text: "Healthy", icon: "drop")
                }
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)

                GeometryReader { _ in

                    Image("food1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .rotationEffect(.init(degrees: imageAnimated ? degrees : 0))
                        .offset(x: -20)
                }
                .frame(height: getScreenSize().width)
            }

            Spacer()

            Text("A text view draws a string in your app’s user interface using a body font that’s appropriate for the current platform. You can choose a different standard font, like title or caption, using the font(_:) view modifier.")
                .font(.callout)
                .foregroundStyle(.secondary)
                .lineSpacing(8)
                .padding(.vertical)

        }
            .padding()
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(
                Color("MidnightBlue")
            )
            .gesture(

                DragGesture().onEnded({ value in

                    if imageAnimated {
                        return
                    }

                    let transrationY = value.translation.height

                    if transrationY < 0 {
                        // MARK: Swiped Up
                        animateRotation(isUp: true)
                    }

                    if transrationY > 0 {
                        // MARK: Swiped Down
                        animateRotation(isUp: false)
                    }
                })
            )
    }

    func menuLabel(text: String, icon: String) -> some View {
        return Label {
            Text(text)
        } icon: {
            Image(systemName: icon)
                .frame(width: 30)
        }
    }

    func animateRotation(isUp: Bool) {

        withAnimation(.interactiveSpring(response: 1.5, dampingFraction: 0.8, blendDuration: 0.8)) {

            degrees = isUp ? 360:-360
            imageAnimated = true
        }

        // Setting Back to Original State after animation Finished
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {

            degrees = 0
            imageAnimated = false
        }
    }
}

struct RotationCarouselScreen_Previews: PreviewProvider {
    static var previews: some View {
        RotationCarouselScreen()
    }
}
