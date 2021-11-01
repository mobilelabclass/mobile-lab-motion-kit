//
//  MotionManager.swift
//  mobile-lab-motion-kit
//
//  Created by Sebastian Buys on 2/16/20.
//  Copyright © 2020 Sebastian Buys. All rights reserved.
//

import Foundation
import Combine
import CoreMotion
import CoreLocation

class MotionManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    // https://developer.apple.com/documentation/coremotion/cmmotionmanager
    // CMMotionManager is responsible for starting and managing motion services.
    private let cmMotionManager = CMMotionManager()
    private let locationManager = CLLocationManager()
    
    // Motion Values
    @Published var acceleration: CMAcceleration?
    @Published var gyroData: CMGyroData?
    @Published var magnetometerData: CMMagnetometerData?
    @Published var deviceMotion: CMDeviceMotion?
    @Published var heading: CLHeading?
    
    // Motion on / off
    @Published var isAccelerometerOn: Bool = false
    @Published var isLocationOn: Bool = false
    @Published var isGyroOn: Bool = false
    @Published var isMagnetometerOn: Bool = false
    @Published var isDeviceMotionOn: Bool = false
    
    private var subscriptions: Set<AnyCancellable> = []
    
    override init() {
        super.init()
        // Subscriptions
        $isAccelerometerOn.sink { [weak self] in
            $0 ? self?.startAccelerometer() : self?.stopAccelerometer()
        }.store(in: &subscriptions)
        
        $isMagnetometerOn.sink { [weak self] in
            $0 ? self?.startMagnetometer() : self?.stopMagnetometer()
        }.store(in: &subscriptions)
        
        $isGyroOn.sink { [weak self] in
            $0 ? self?.startGyro() : self?.stopGyro()
        }.store(in: &subscriptions)
        
        $isDeviceMotionOn.sink { [weak self] in
            $0 ? self?.startDeviceMotion() : self?.stopDeviceMotion()
        }.store(in: &subscriptions)
        
        $isLocationOn.sink { [weak self] in
            $0 ? self?.startLocation() : self?.stopLocation()
        }.store(in: &subscriptions)
        
        locationManager.delegate = self
        
    }
    
    
    // MARK: - Accelerometer methods
    func startAccelerometer() {
        cmMotionManager.startAccelerometerUpdates(to: .main) { [weak self] data, error in
            guard let data = data else { return }
            self?.acceleration = data.acceleration
        }
    }
    
    func stopAccelerometer() {
        cmMotionManager.stopAccelerometerUpdates()
    }
    
    // MARK: - Gyro methods
    func startGyro() {
        cmMotionManager.startGyroUpdates(to: .main) { [weak self] data, error in
            guard let data = data else { return }
            self?.gyroData = data
        }
    }
    
    func stopGyro() {
        cmMotionManager.stopGyroUpdates()
    }
    
    // MARK: - Magnetometer methods
    func startMagnetometer() {
        cmMotionManager.startMagnetometerUpdates(to: .main) { [weak self] data, error in
            guard let data = data else { return }
            self?.magnetometerData = data
        }
    }
    
    func stopMagnetometer() {
        cmMotionManager.stopMagnetometerUpdates()
    }
    
    // MARK: - Location (heading) methods
    func startLocation() {
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()

    }
    
    func stopLocation() {
        locationManager.stopUpdatingLocation()
        locationManager.stopUpdatingHeading()
    }
    
    // MARK: - Device motion methods
    func startDeviceMotion() {
        cmMotionManager.startDeviceMotionUpdates(to: .main) { [weak self] motion, error in
            guard let motion = motion else { return }
            self?.deviceMotion = motion
        }
    }
    
    func stopDeviceMotion() {
        cmMotionManager.stopDeviceMotionUpdates()
    }
    
    // MARK - delegate methods
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        self.heading = newHeading
    }
}

