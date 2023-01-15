//
//  ProgressBarScreen.swift
//  src (iOS)
//
//  Created by Sho Emoto on 2023/01/15.
//

import SwiftUI

struct ProgressBarScreen: View {
    private let screenPadding = 16.0
    private let itemPadding = 8.0

    var body: some View {
        ZStack {
            VStack {
                HStack(spacing: itemPadding) {
                    ZStack {
                        itemBackground

                        CircleProgressBar(
                            progress: .constant(0.3)
                        )
                        .frame(
                            width: (UIScreen.main.bounds.size.width - screenPadding * 2 - itemPadding) / 2 - 48,
                            height: (UIScreen.main.bounds.size.width - screenPadding * 2 - itemPadding) / 2 - 48
                        )
                    }


                    ZStack(alignment: .center) {
                        itemBackground

                        LineProgressBar(
                            progress: .constant(0.5)
                        )
                        .frame(
                            width: (UIScreen.main.bounds.size.width - screenPadding * 2 - itemPadding) / 2 - 32,
                            height: (UIScreen.main.bounds.size.width - screenPadding * 2 - itemPadding) / 2 - 32
                        )
                    }
                }

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(Color("BackgroundGray"))
            .padding(screenPadding)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color("BackgroundGray"))
        .navigationTitle("ProgressBar")
        .navigationBarTitleDisplayMode(.inline)
    }


    private var itemBackground: some View {
        VStack {
            Color.white
                .frame(
                    width: (UIScreen.main.bounds.size.width - screenPadding * 2 - itemPadding) / 2,
                    height: (UIScreen.main.bounds.size.width - screenPadding * 2 - itemPadding) / 2
                )
                .cornerRadius(16)
        }
    }
}

struct ProgressBarScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarScreen()
    }
}
