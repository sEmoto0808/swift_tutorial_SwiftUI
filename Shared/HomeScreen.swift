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
                createListItem(title: "Animation - Rotation", itemType: .animationRotation)
            }
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
                return RotationScreen()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
