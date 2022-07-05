//
//  ContentView.swift
//  Shared
//
//  Created by Sho Emoto on 2022/07/02.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {

        NavigationView {

            List {
                Section(header: Text("Animation").fontWeight(.bold)) {
                    createListItem(title: "Rotation - Carousel", itemType: .animationRotation)
                    createListItem(title: "Fitness", itemType: .animationFitness)
                }
            }
            .navigationTitle("Home")
        }

    }

    func createListItem(title: String, itemType: ItemType) -> some View {
        NavigationLink(destination: itemType.destination) {

            HStack {

                Text(title)
                    .fontWeight(.bold)
            }
        }
    }

    enum ItemType {
        case animationRotation
        case animationFitness

        var destination: some View {

            // NOTE: https://developer.apple.com/forums/thread/118172
            switch self {
            case .animationRotation:
                return AnyView(RotationCarouselScreen())
            case .animationFitness:
                return AnyView(FitnessScreen())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
