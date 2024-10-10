//
//  HelpMain.swift
//  learn-language
//
//  Created by yusuf on 4.10.2024.
//

import SwiftUI

struct HelpMain: View {
    var title: String
    var body: some View {
        
        VStack(alignment: .leading){
            HStack {
                Image(title).resizable()
            }.padding()
            
        }.frame(width: Const.width * 0.9, height: Const.height * 0.18).background(LinearGradient(gradient: Gradient(colors: [.red.opacity(0.25), .brown.opacity(0.25), ]), startPoint: .topTrailing, endPoint: .bottomTrailing)).cornerRadius(20)
        
            
        
    }
}

#Preview {
    HelpMain(title: "A1")
}
