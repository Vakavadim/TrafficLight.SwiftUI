//
//  ContentView.swift
//  TrafficLight.SwiftUI
//
//  Created by Вадим Гамзаев on 08.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    enum CurrentLight {
        case red, yellow, green
    }
    
    enum Toggle: Double {
        case on = 1.0
        case off = 0.3
    }
    
    @State var currentLight = CurrentLight.red
    @State var redLight = Toggle.off
    @State var yellowLight = Toggle.off
    @State var greenLight = Toggle.off
    @State var buttonText = "Start"
    
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            VStack (spacing: 90) {
                VStack (spacing: 30) {
                    CircleLighterView(color: .red,
                                      opacity: redLight.rawValue)
                    CircleLighterView(color: .yellow,
                                      opacity: yellowLight.rawValue)
                    CircleLighterView(color: .green,
                                      opacity: greenLight.rawValue)
                }
                Button(action: {changeLights()}) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.white, lineWidth: 5)
                        RoundedRectangle(cornerRadius: 10)
                        Text(buttonText)
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 120, height: 60)
                    .font(.title)
                }
            }
        }
    }
    
    private func changeLights() {
        
        buttonText = "Next"
        
        switch currentLight {
        case .red:
            redLight = Toggle.on
            yellowLight = Toggle.off
            greenLight = Toggle.off
            currentLight = CurrentLight.yellow
        case .yellow:
            redLight = Toggle.off
            yellowLight = Toggle.on
            greenLight = Toggle.off
            currentLight = CurrentLight.green
        case .green:
            redLight = Toggle.off
            yellowLight = Toggle.off
            greenLight = Toggle.on
            currentLight = CurrentLight.red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
