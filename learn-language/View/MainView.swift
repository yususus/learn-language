//
//  MainView.swift
//  learn-language
//
//  Created by yusuf on 4.10.2024.
//

import SwiftUI

struct MainView: View {
    let levels = ["A1", "A2", "B1", "B2"]

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
            .navigationTitle("Good Morning")
        }
    }
}





#Preview {
    MainView()
}