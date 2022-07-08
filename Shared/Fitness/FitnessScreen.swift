//
//  FitnessScreen.swift
//  src (iOS)
//
//  Created by Sho Emoto on 2022/07/05.
//

import SwiftUI

struct FitnessScreen: View {

    // MARK: Animation Properties
    @State var showView = false

    var body: some View {
        VStack {

            FitnessRingCardView()
                .opacity(showView ? 1 : 0)
                .offset(y: showView ? 0 : 250)
        }
        .foregroundColor(.white)
        .padding()
        .onAppear(perform: animateView)
    }

    // MARK: Animating View
    func animateView() {

        withAnimation(.easeInOut.delay(0.5)) {

            showView = true
        }
    }
}

struct FitnessScreen_Previews: PreviewProvider {
    static var previews: some View {
        FitnessScreen()
    }
}
