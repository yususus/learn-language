//
//  SettingsView.swift
//  Learn English Words&Sentences
//
//  Created by yusuf on 31.10.2024.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var themeManager: ThemeManager
    
    enum Theme {
        case light, dark, system
    }
    
    var body: some View {
        ZStack {
            Color(themeManager.isDarkMode ? UIColor.black : UIColor(red: 1.0, green: 0.96, blue: 0.9, alpha: 1.0))
                                .edgesIgnoringSafeArea(.all)
            VStack {
                Group {
                    Text("Settings")
                        .foregroundColor(themeManager.isDarkMode ? .white : .black)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    
                    GroupBox(label: Text("Theme").font(.title).fontWeight(.semibold)) {
                        Rectangle()
                            .frame(height: 2)
                            .frame(width: Const.width * 0.85)
                        
                        Toggle(isOn: Binding(
                            get: { themeManager.currentTheme == .dark },
                            set: {
                                if $0 {
                                    themeManager.currentTheme = .dark
                                }
                            }
                        )) {
                            Text("Dark Mode")
                                .font(.headline)
                                .foregroundColor(themeManager.isDarkMode ? .white : .black)
                        }
                        .padding(.vertical, 5)
                        
                        Rectangle()
                            .frame(height: 0.4)
                            .frame(width: Const.width * 0.85)
                        
                        Toggle(isOn: Binding(
                            get: { themeManager.currentTheme == .light },
                            set: {
                                if $0 {
                                    themeManager.currentTheme = .light
                                }
                            }
                        )) {
                            Text("Light Mode")
                                .font(.headline)
                                .foregroundColor(themeManager.isDarkMode ? .white : .black)
                        }
                        .padding(.vertical, 5)
                    }.frame(width: Const.width * 0.9)
                    
                    Spacer()
                }
            }
            
        }
        .environment(\.colorScheme, themeManager.isDarkMode ? .dark : .light)
    }
}

#Preview {
    SettingsView()
        .environmentObject(ThemeManager())
}
