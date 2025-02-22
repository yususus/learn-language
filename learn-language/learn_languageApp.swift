//
//  learn_languageApp.swift
//  learn-language
//
//  Created by yusuf on 4.10.2024.
//

import SwiftUI

@main
struct learn_languageApp: App {
    @StateObject private var themeManager = ThemeManager()
    @StateObject var viewModel = HelpQuestionsViewModel()
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(themeManager)
                .environmentObject(viewModel)
        }
    }
}
