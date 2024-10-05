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
                Text("\(title) Degree").font(Font.custom("FugazOne-Regular", size: 30)).foregroundStyle(.white).shadow(radius: 1, x: 5, y: 8)
                Spacer()
            }.padding()
            
        }.frame(width: Const.width * 0.9, height: Const.height * 0.18).background(.red.opacity(0.8).gradient).cornerRadius(20)
        
    }
}

#Preview {
    HelpMain(title: "A1")
}
