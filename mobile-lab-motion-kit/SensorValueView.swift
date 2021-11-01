//
//  SensorValueView.swift
//  mobile-lab-motion-kit
//
//  Created by Sebastian Buys on 2/16/20.
//  Copyright © 2020 Sebastian Buys. All rights reserved.
//

import SwiftUI

struct SensorValueView: View {
    var text: String?
    var value: Double?
    
    var body: some View {
        HStack {
            Text(text ?? "")
                .frame(width: 120.0, alignment: .leading)
                .foregroundColor(Color.secondary)
            Text("\(value ?? 0.0)")
                .foregroundColor(Color.secondary)
            Spacer()
        }
    }
}

struct SensorValueView_Previews: PreviewProvider {
    static var previews: some View {
        SensorValueView()
    }
}
