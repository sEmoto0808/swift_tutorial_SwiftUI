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

        var destination: some View {

            switch self {
            case .animationRotation:
                return RotationCarouselScreen()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
