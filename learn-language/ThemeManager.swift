//
//  ThemeManager.swift
//  Learn English Words&Sentences
//
//  Created by yusuf on 31.10.2024.
//

import Foundation
import SwiftUI

class ThemeManager: ObservableObject {
    @Published var currentTheme: Theme = .system
    
    enum Theme {
        case light, dark, system
    }
    
    var isDarkMode: Bool {
        switch currentTheme {
        case .dark:
            return true
        case .light:
            return false
        case .system:
            return UITraitCollection.current.userInterfaceStyle == .dark
        }
    }
}
