//
//  MotionManager.swift
//  src (iOS)
//
//  Created by Sho Emoto on 2023/02/12.
//

import SwiftUI
import CoreMotion

/// 端末のMotion Dataを取得するクラス
///
/// - Accelerometer data, indicating the instantaneous acceleration of the device in three dimensional space.
/// - Gyroscope data, indicating the instantaneous rotation around the device's three primary axes.
/// - Magnetometer data, indicating the device's orientation relative to Earth's magnetic field.
/// - Device-motion data, indicating key motion-related attributes such as the device's user-initiated acceleration, its attitude, rotation rates, orientation relative to calibrated magnetic fields, and orientation relative to gravity. This data is provided by Core Motion’s sensor fusion algorithms.
final class MotionManager: ObservableObject {

    @Published var gyroRotationX: Double = 0.0
    @Published var gyroRotationY: Double = 0.0
    @Published var gyroRotationZ: Double = 0.0

    private let manager: CMMotionManager

    init() {
        manager = CMMotionManager()
        manager.accelerometerUpdateInterval = 1/60
        manager.gyroUpdateInterval = 1/60
        manager.deviceMotionUpdateInterval = 1/60
    }

    func startGyroUpdates() {
        manager.startGyroUpdates(to: .main) { (gyroData, error) in
            guard error == nil else {
                // エラーハンドリング
                return
            }

            if let gyroData = gyroData {
                if gyroData.rotationRate.x < 0 {
//                    self.gyroRotationX = (-gyroData.rotationRate.x + 180) / 360.0
                    self.gyroRotationX = -gyroData.rotationRate.x + 0.5
                } else {
                    self.gyroRotationX = gyroData.rotationRate.x
                }

                if gyroData.rotationRate.y < 0 {
//                    self.gyroRotationY = (-gyroData.rotationRate.y + 180) / 360.0
                    self.gyroRotationY = -gyroData.rotationRate.y + 0.5
                } else {
                    self.gyroRotationY = gyroData.rotationRate.y
                }

                if gyroData.rotationRate.z < 0 {
//                    self.gyroRotationZ = (-gyroData.rotationRate.z + 180) / 360.0
                    self.gyroRotationZ = -gyroData.rotationRate.z + 0.5
                } else {
                    self.gyroRotationZ = gyroData.rotationRate.z
                }

                print("----------------------")
                print(self.gyroRotationX)
                print(self.gyroRotationY)
                print(self.gyroRotationZ)
                print("----------------------")
//                print("----------------------")
//                print(gyroData.rotationRate.x)
//                print(gyroData.rotationRate.y)
//                print(gyroData.rotationRate.z)
//                print("----------------------")
            }
        }
    }

    func stopGyroUpdates() {
        manager.stopGyroUpdates()
    }
}
