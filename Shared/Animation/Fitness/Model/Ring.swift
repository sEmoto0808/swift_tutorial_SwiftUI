//
//  Ring.swift
//  src (iOS)
//
//  Created by Sho Emoto on 2022/07/05.
//

import Foundation
import SwiftUI

// MARK: Progress Ring Model and Sample Data
struct Ring: Identifiable {
    let id = UUID().uuidString
    let progress: CGFloat
    let value: String
    let keyIcon: String
    let keyColor: Color
    let isText: Bool
}

let rings = [
    Ring(progress: 72, value: "Steps", keyIcon: "figure.walk", keyColor: Color("Crimson"), isText: false),
    Ring(progress: 36, value: "Calories", keyIcon: "flame.fill", keyColor: Color("LawnGreen"), isText: false),
    Ring(progress: 91, value: "Sleep Time", keyIcon: "bed.double.fill", keyColor: Color("Aqua"), isText: true)
]
