//
//  Const.swift
//  learn-language
//
//  Created by yusuf on 4.10.2024.
//

import Foundation
import SwiftUI


class Const{
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
}

struct PressableButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(
                configuration.isPressed ?
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue]), startPoint: .top, endPoint: .bottom) :
                LinearGradient(gradient: Gradient(colors: [.red.opacity(0.1), .blue.opacity(0.4)]), startPoint: .top, endPoint: .bottomTrailing)
            )
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}


