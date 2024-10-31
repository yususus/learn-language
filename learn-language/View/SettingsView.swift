//
//  SettingsView.swift
//  Learn English Words&Sentences
//
//  Created by yusuf on 31.10.2024.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var selectTheme: Theme  = .system
    
    enum Theme {
        case light, dark, system
    }
    
    var body: some View {
        ZStack {
            Color(red: 1.0, green: 0.96, blue: 0.9)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Group {
                    Text("Settings")
                        .foregroundStyle(.black)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    
                    GroupBox(label: Text("Theme").font(.title).fontWeight(.semibold)) {
                        Rectangle()
                            .frame(height: 2)
                            .frame(width: Const.width * 0.85)
                        
                        Toggle(isOn: Binding(
                            get: { selectTheme == .dark },
                            set: { if $0 { selectTheme = .dark } }
                        )) {
                            Text("Dark Mode")
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                        .padding(.vertical, 5)
                        
                        Toggle(isOn: Binding(
                            get: { selectTheme == .light },
                            set: { if $0 { selectTheme = .light } }
                        )) {
                            Text("Light Mode")
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                        .padding(.vertical, 5)
                        
                        Toggle(isOn: Binding(
                            get: { selectTheme == .system },
                            set: { if $0 { selectTheme = .system } }
                        )) {
                            Text("System Mode")
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                        .padding(.vertical, 5)
                        
                    }.frame(width: Const.width * 0.9)
                    
                    Spacer()
                }
            }
            
        }
    }
}

#Preview {
    SettingsView()
}
