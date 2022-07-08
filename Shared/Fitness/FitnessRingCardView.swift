//
//  FitnessRingCardView.swift
//  src (iOS)
//
//  Created by Sho Emoto on 2022/07/06.
//

import SwiftUI

struct FitnessRingCardView: View {
    var body: some View {

        VStack(spacing: 15) {

            Text("Progress")
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack(spacing: 10) {

                ZStack {

                    ForEach(rings.indices, id: \.self) { index in

                        ZStack {
                            Circle()
                                .stroke(.gray.opacity(0.3), lineWidth: 10)

                            Circle()
                            // NOTE: 塗り潰しの設定
                                .trim(from: 0, to: rings[index].progress / 100)
                                .stroke(
                                    rings[index].keyColor,
                                    style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round)
                                )
                            // NOTE: 角度調整
                                .rotationEffect(.init(degrees: -90))
                        }
                        .padding(CGFloat(index) * 16)
                    }

                }
                .frame(width: 130, height: 130)

                VStack(alignment: .leading, spacing: 12) {

                    ForEach(rings) { ring in

                        Label {

                            HStack(alignment: .bottom, spacing: 6) {

                                Text("\(Int(ring.progress))%")
                                    .font(.title3.bold())

                                Text(ring.value)
                                    .font(.caption)
                            }
                        } icon: {

                            Group {

                                Image(systemName: ring.keyIcon)
                                    .font(.title2)
                                    .foregroundColor(ring.keyColor)
                            }
                            .frame(width: 30)
                        }
                    }
                }
                .padding(.leading, 10)
            }
            .padding(.top, 20)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 25)
        .foregroundColor(.white)
        .background(

            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color("MidnightBlue"))
        )
    }
}

struct FitnessRingCardView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessScreen()
    }
}
