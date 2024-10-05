//
//  CategoryView.swift
//  learn-language
//
//  Created by yusuf on 4.10.2024.
//

import SwiftUI

struct CategoryView: View {
    var title: String
    let words = ["Sport", "Science","Family", "Education", "Life"]
    let sentences = ["Sport", "Science","Family", "Education","Life"]
    var body: some View {
        VStack{
            
            ScrollView {
                HStack {
                    Text("Words").font(Font.custom("FugazOne-Regular", size: 40))
                        .foregroundStyle(Color.black.gradient)
                    Spacer()
                }.padding(.horizontal, Const.width * 0.05)
                ScrollView(.horizontal){
                    HStack {
                        ForEach(words, id: \.self){
                            category in
                            
                            NavigationLink(destination: QuestionView(title: category)){
                                HelpCategory(categoryTitle: category)
                            }
                            
                            
                        }
                        
                    }
                }.padding()
                HStack {
                    Text("Sentences").font(Font.custom("FugazOne-Regular", size: 40))
                        .foregroundStyle(Color.black.gradient)
                    Spacer()
                }.padding(.horizontal, Const.width * 0.05)
                VStack{
                    ForEach(sentences, id: \.self) { level in
                        NavigationLink {
                            QuestionView(title: level)
                        } label: {
                            SentencesView(categoryTitle: level)
                        }
                    }

                }
                    
            }.navigationTitle("\(title) Degree" ).navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    CategoryView(title: "B1")
}
