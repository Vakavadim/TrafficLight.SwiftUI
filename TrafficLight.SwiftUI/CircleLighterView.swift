//
//  CircleLighterView.swift
//  TrafficLight.SwiftUI
//
//  Created by Вадим Гамзаев on 08.09.2022.
//

import SwiftUI

struct CircleLighterView: View {

    let color: Color
    let opacity: Double
    
    var body: some View {
        Circle()
            .foregroundColor(color)
            .opacity(opacity)
            .frame(width: 120, height: 120)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
    }
}

struct CircleLighterView_Previews: PreviewProvider {
    static var previews: some View {
        CircleLighterView(color: .red, opacity: 1.0)
    }
}
