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
                    createListItem(title: "Scroll - Expand Center View", itemType: .animationExpandCenterScroll)
                    createListItem(title: "Change Front Back", itemType: .animationChangeFrontBack)
                    createListItem(title: "Rotation - 3D Ring", itemType: .animation3DRotation)
                }

                Section(header: Text("UI Catalog").fontWeight(.bold)) {
                    createCatalogItem(title: "ProgressBar", catalogType: .progressBar)
                }
            }
            .navigationTitle("Home")
        }

    }

    private func createListItem(title: String, itemType: ItemType) -> some View {
        NavigationLink(destination: itemType.destination) {

            HStack {

                Text(title)
                    .fontWeight(.bold)
            }
        }
    }

    private enum ItemType {
        case animationRotation
        case animationFitness
        case animationExpandCenterScroll
        case animationChangeFrontBack
        case animation3DRotation

        var destination: some View {

            // NOTE: https://developer.apple.com/forums/thread/118172
            switch self {
            case .animationRotation:
                return AnyView(RotationCarouselScreen())
            case .animationFitness:
                return AnyView(FitnessScreen())
            case .animationExpandCenterScroll:
                return AnyView(ExpandCenterScrollScreen())
            case .animationChangeFrontBack:
                return AnyView(ChangeFrontBackScreen())
            case .animation3DRotation:
                return AnyView(ThreeDimensionalRotationRingScreen())
            }
        }
    }

    private func createCatalogItem(title: String, catalogType: CatalogType) -> some View {
        NavigationLink(destination: catalogType.destination) {

            HStack {

                Text(title)
                    .fontWeight(.bold)
            }
        }
    }

    private enum CatalogType {
        case progressBar

        var destination: some View {
            switch self {
            case .progressBar:
                return AnyView(ProgressBarScreen())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
