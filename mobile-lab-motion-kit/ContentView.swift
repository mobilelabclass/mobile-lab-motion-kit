//
//  ContentView.swift
//  mobile-lab-motion-kit
//
//  Created by Sebastian Buys on 2/16/20.
//  Copyright © 2020 Sebastian Buys. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var manager = MotionManager()
    
    var body: some View {
        NavigationView {
            Form {
                // MARK: - Accelerometer section
                Section {
                    Toggle(isOn: $manager.isAccelerometerOn) {
                        Text("Acceleration").bold()
                    }
                    
                    SensorValueView(text: "x", value: manager.acceleration?.x)
                    
                    SensorValueView(text: "y", value: manager.acceleration?.y)
                    
                    SensorValueView(text: "z", value: manager.acceleration?.z)
                }
                
                // MARK: - Gyro section
                Section {
                    Toggle(isOn: $manager.isGyroOn) {
                        Text("Gyrometer").bold()
                    }
                    
                    SensorValueView(text: "x", value: manager.gyroData?.rotationRate.x)
                    
                    SensorValueView(text: "y", value: manager.gyroData?.rotationRate.y)
                    
                    SensorValueView(text: "z", value: manager.gyroData?.rotationRate.z)
                }
                
                // MARK: - Magnetometer section
                Section {
                    Toggle(isOn: $manager.isMagnetometerOn) {
                        Text("Magnetometer").bold()
                    }
                    
                    SensorValueView(text: "x", value: manager.magnetometerData?.magneticField.x)
                    
                    SensorValueView(text: "y", value: manager.magnetometerData?.magneticField.y)
                    
                    SensorValueView(text: "z", value: manager.magnetometerData?.magneticField.z)
                }
                
                
                // MARK: - Device Motion
                Section {
                    Toggle(isOn: $manager.isDeviceMotionOn) {
                        Text("Device motion").bold()
                    }
                    
                    // User acceleration
                    Section {
                        Text("User acceleration").bold()
                        
                        SensorValueView(text: "x", value: manager.deviceMotion?.userAcceleration.x)
                        SensorValueView(text: "y", value: manager.deviceMotion?.userAcceleration.y)
                        SensorValueView(text: "z", value: manager.deviceMotion?.userAcceleration.z)
                    }.padding(.leading)
                    
                    Spacer()
                    
                    // Attitude
                    Section {
                        Text("Attitude").bold()
                        SensorValueView(text: "pitch", value: manager.deviceMotion?.attitude.pitch)
                        SensorValueView(text: "roll", value: manager.deviceMotion?.attitude.roll)
                        SensorValueView(text: "yaw", value: manager.deviceMotion?.attitude.yaw)
                    }.padding(.leading)
                    
                    Spacer()
                    
                    // Gravity
                    Section {
                        Text("Gravity").bold()
                        SensorValueView(text: "x", value: manager.deviceMotion?.gravity.x)
                        SensorValueView(text: "y", value: manager.deviceMotion?.gravity.y)
                        SensorValueView(text: "z", value: manager.deviceMotion?.gravity.z)
                    }.padding(.leading)
                    
                    Spacer()
                    
                    // Rotation rate
                    Section {
                        Text("Rotation rate").bold()
                        SensorValueView(text: "x", value: manager.deviceMotion?.rotationRate.x)
                        SensorValueView(text: "y", value: manager.deviceMotion?.rotationRate.y)
                        SensorValueView(text: "z", value: manager.deviceMotion?.rotationRate.z)
                    }.padding(.leading)
                    
                }
            }.navigationBarTitle(Text("Motion"))
        }
    }}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
