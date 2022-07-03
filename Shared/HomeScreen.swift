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
                createListItem(title: "Animation - Rotation", listType: .animationRotation)
            }
        }

    }

    func createListItem(title: String, listType: ListType) -> some View {
        NavigationLink(destination: listType.destination) {

            HStack {

                Text(title)
                    .fontWeight(.bold)
            }
        }
    }

    enum ListType {
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
