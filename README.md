# Mobile Lab Motion Kit

This kit uses the [CoreMotion](https://developer.apple.com/documentation/coremotion) framework to receive motion data from the device's onboard sensors.

MotionManager is a custom class that manages an instance of [CMMotionManager](https://developer.apple.com/documentation/coremotion/cmmotionmanager).

MotionManager implements the [ObservableObject](https://developer.apple.com/documentation/combine/observableobject) protocol, making sensor data and sensor on/off state bindable to a SwiftUI View.

## MotionManager sensor data

- @Published var acceleration: CMAcceleration?
- @Published var gyroData: CMGyroData?
- @Published var magnetometerData: CMMagnetometerData?
- @Published var deviceMotion: CMDeviceMotion?

## MotionManager on / off state

- @Published var isAccelerometerOn: Bool
- @Published var isGyroOn: Bool
- @Published var isMagnetometerOn: Bool
- @Published var isDeviceMotionOn: Bool

<br/>
<img alt="screenshot" src="https://raw.githubusercontent.com/mobilelabclass/mobile-lab-motion-kit/master/screen_recording.gif">
