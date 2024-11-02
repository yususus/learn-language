//
//  ThemeManager.swift
//  Learn English Words&Sentences
//
//  Created by yusuf on 31.10.2024.
//

import Foundation
import SwiftUI

class ThemeManager: ObservableObject {
    @Published var currentTheme: Theme = .light {
        didSet {
            saveTheme()  // currentTheme değiştiğinde kaydedilir
        }
    }

    enum Theme: String {
        case light, dark
    }

    init() {
        self.currentTheme = loadTheme()  // Uygulama açıldığında son tema yüklenecek
    }

    var isDarkMode: Bool {
        currentTheme == .dark
    }

    // Tema tercihini kaydeden fonksiyon
    private func saveTheme() {
        UserDefaults.standard.set(currentTheme.rawValue, forKey: "selectedTheme")
    }

    // Kaydedilmiş tema tercihini yükleyen fonksiyon
    private func loadTheme() -> Theme {
        if let savedTheme = UserDefaults.standard.string(forKey: "selectedTheme"),
           let theme = Theme(rawValue: savedTheme) {
            return theme
        }
        return .light  // Varsayılan tema açık tema
    }
}




/*
 burada system temasını da kullandığım bir yapı var ancak sayfa geçişlerinde sorun yaşıyor
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
} */

