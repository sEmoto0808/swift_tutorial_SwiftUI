//
//  FitnessScreen.swift
//  src (iOS)
//
//  Created by Sho Emoto on 2022/07/05.
//

import SwiftUI

struct FitnessScreen: View {

    var body: some View {
        VStack {

            FitnessRingCardView()
        }
        .foregroundColor(.white)
        .padding()
    }

}

struct FitnessScreen_Previews: PreviewProvider {
    static var previews: some View {
        FitnessScreen()
    }
}
