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
                Text("\(categoryTitle)").font(Font.custom("FugazOne-Regular", size: 30)).foregroundStyle(.black).shadow(radius: 1.2, x: 10, y: 10)
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
                Text("\(categoryTitle)").font(Font.custom("FugazOne-Regular", size: 30)).foregroundStyle(.black).shadow(radius: 2, x: 10, y: 10)
                Spacer()
            }.padding()
            
        }.frame(width: Const.width * 0.9, height: Const.height * 0.18).background(Color.brown.opacity(0.3)).cornerRadius(20)
    }
}

#Preview {
    HelpCategory(categoryTitle: "Education")
}
