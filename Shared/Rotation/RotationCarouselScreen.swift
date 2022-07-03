//
//  RotationScreen.swift
//  src (iOS)
//
//  Created by Sho Emoto on 2022/07/03.
//

import SwiftUI

struct RotationCarouselScreen: View {
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

                GeometryReader {proxy in

                    let size = proxy.size

                    Image("food1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
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
    }

    func menuLabel(text: String, icon: String) -> some View {
        return Label {
            Text(text)
        } icon: {
            Image(systemName: icon)
                .frame(width: 30)
        }
    }
}

struct RotationCarouselScreen_Previews: PreviewProvider {
    static var previews: some View {
        RotationCarouselScreen()
    }
}
