//
//  HelpCategory.swift
//  learn-language
//
//  Created by yusuf on 4.10.2024.
//

import SwiftUI

struct HelpCategory: View {
    var categoryTitle: String
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text("\(categoryTitle)").font(Font.custom("FugazOne-Regular", size: 30)).foregroundStyle(LinearGradient(colors: [.black.opacity(0.65), .black.opacity(0.8), ], startPoint: .top, endPoint: .bottomTrailing)).shadow(radius: 1, x: 5, y: 8)
                Spacer()
            }.padding()
            
        }.frame(width: Const.width * 0.48, height: Const.height * 0.18).background(Color.brown.opacity(0.3)).cornerRadius(20)
    }
}

struct SentencesView: View {
    var categoryTitle: String
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text("\(categoryTitle)").font(Font.custom("FugazOne-Regular", size: 30)).foregroundStyle(LinearGradient(colors: [.black.opacity(0.65), .black.opacity(0.8), ], startPoint: .top, endPoint: .bottomTrailing)).shadow(radius: 1, x: 5, y: 8)
                Spacer()
            }.padding()
            
        }.frame(width: Const.width * 0.9, height: Const.height * 0.18).background(Color.brown.opacity(0.3)).cornerRadius(20)
    }
}

#Preview {
    HelpCategory(categoryTitle: "Education")
}
