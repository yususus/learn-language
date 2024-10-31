//
//  MainView.swift
//  learn-language
//
//  Created by yusuf on 4.10.2024.
//

import SwiftUI

struct MainView: View {
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
                Color(red: 1.0, green: 0.96, blue: 0.9)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    ForEach(levels, id: \.self) { level in
                        NavigationLink {
                            CategoryView(title: level, level: level)
                        } label: {
                            HelpMain(title: level)
                        }
                        .buttonStyle(PressableButtonStyle())
                    }
                }
                
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        // Özel başlık metni
                        Text(currentGreeting)
                            .font(Font.custom("FugazOne-Regular", size: 25))
                            .foregroundColor(.black)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                            SettingsView()
                        } label: {
                            Image(systemName: "gear")
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }
    }
}





#Preview {
    MainView()
}
