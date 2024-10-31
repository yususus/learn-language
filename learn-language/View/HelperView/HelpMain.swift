//
//  HelpMain.swift
//  learn-language
//
//  Created by yusuf on 4.10.2024.
//

import SwiftUI

struct HelpMain: View {
    var title: String
    @StateObject var themeManager = ThemeManager()
    var body: some View {
        
        VStack(alignment: .leading){
            HStack {
                Image(title).resizable()
            }
            
        }.frame(width: Const.width * 0.9, height: Const.height * 0.18)
            .background(themeManager.isDarkMode ? Color.gray.opacity(0.3) : Color.brown.opacity(0.3)).cornerRadius(20)
            .environmentObject(themeManager)
            
        
    }
}

#Preview {
    HelpMain(title: "A1")
}
