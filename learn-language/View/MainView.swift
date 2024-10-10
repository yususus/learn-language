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
            ScrollView {
                ForEach(levels, id: \.self) { level in
                    NavigationLink {
                        CategoryView(title: level)
                    } label: {
                        HelpMain(title: level)
                    }
                    .buttonStyle(PressableButtonStyle())
                }
            }
            .navigationTitle(currentGreeting)
        }
    }
}





#Preview {
    MainView()
}
