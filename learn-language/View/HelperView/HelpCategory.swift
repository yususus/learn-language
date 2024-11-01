//
//  HelpCategory.swift
//  learn-language
//
//  Created by yusuf on 4.10.2024.
//

import SwiftUI

struct HelpCategory: View {
    var categoryTitle: String
    @EnvironmentObject var themeManager: ThemeManager
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text("\(categoryTitle)").font(Font.custom("FugazOne-Regular", size: 30))
                    .foregroundColor(themeManager.isDarkMode ? .white : .black)
                    .shadow(radius: 1.2, x: 10, y: 10)
                Spacer()
            }.padding()
            
        }
        .frame(width: Const.width * 0.48, height: Const.height * 0.18)
        .background(themeManager.isDarkMode ? Color(UIColor(hex : "#06402b")) : Color.brown.opacity(0.3))
        .cornerRadius(20)
        .environment(\.colorScheme, themeManager.isDarkMode ? .dark : .light)
    }
}

struct SentencesView: View {
    var categoryTitle: String
    @EnvironmentObject var themeManager: ThemeManager
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text("\(categoryTitle)").font(Font.custom("FugazOne-Regular", size: 30))
                    .foregroundColor(themeManager.isDarkMode ? .white : .black)
                    .shadow(radius: 2, x: 10, y: 10)
                Spacer()
            }.padding()
            
        }
        .frame(width: Const.width * 0.9, height: Const.height * 0.18)
        .background(themeManager.isDarkMode ? Color(UIColor(hex : "#06402b")) : Color.brown.opacity(0.3))
        .cornerRadius(20)
        .environment(\.colorScheme, themeManager.isDarkMode ? .dark : .light)
    }
}

#Preview {
    HelpCategory(categoryTitle: "Education")
        .environmentObject(ThemeManager())
}
