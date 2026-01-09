//
//  MainView.swift
//  learn-language
//
//  Created by yusuf on 4.10.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject private var themeManager = ThemeManager()
    let levels = ["A1", "A2", "B1", "B2"]
    
    var currentGreeting: String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 6..<10:
            return "Good Morning"
        case 10..<18:
            return "Have a Nice Day"
        default:
            return "Good Night"
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Modern gradient background
                LinearGradient(
                    colors: themeManager.isDarkMode ? 
                        [Color(hex: "#0a0a0a"), Color(hex: "#1a1a2e")] :
                        [Color(hex: "#f8f9fa"), Color(hex: "#e9ecef")],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 16) {
                        // Header section with greeting
                        VStack(spacing: 8) {
                            Text(currentGreeting)
                                .font(Font.custom("FugazOne-Regular", size: 32))
                                .foregroundColor(themeManager.isDarkMode ? .white : Color(hex: "#2d3436"))
                            
                            Text("Choose your level to start learning")
                                .font(.subheadline)
                                .foregroundColor(themeManager.isDarkMode ? .gray : Color(hex: "#636e72"))
                        }
                        .padding(.top, 20)
                        .padding(.bottom, 8)
                        
                        // Level cards with modern design
                        ForEach(levels, id: \.self) { level in
                            NavigationLink {
                                CategoryView(title: level, level: level)
                                    .environmentObject(HelpQuestionsViewModel())
                            } label: {
                                HelpMain(title: level)
                            }
                            .buttonStyle(PressableButtonStyle())
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
                }
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                            SettingsView()
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .font(.system(size: 20))
                                .foregroundColor(themeManager.isDarkMode ? .white : Color(hex: "#2d3436"))
                                .padding(8)
                                .background(
                                    Circle()
                                        .fill(themeManager.isDarkMode ? Color(hex: "#2d3436") : Color.white)
                                        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                                )
                        }
                    }
                }
            }
        }
        .environmentObject(themeManager)
        .environmentObject(HelpQuestionsViewModel())
    }
}





#Preview {
    MainView()
}
