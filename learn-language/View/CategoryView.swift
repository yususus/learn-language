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
                    Text("Words").font(Font.custom("FugazOne-Regular", size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize))
                        .foregroundStyle(Color.black.gradient)
                    Spacer()
                }.padding(.horizontal, Const.width * 0.05)
                ScrollView(.horizontal){
                    HStack {
                        ForEach(words, id: \.self){ category in
                            NavigationLink {
                                QuestionView(title: category)
                            } label: {
                                HelpCategory(categoryTitle: category)
                            }
                            .buttonStyle(PressableButtonStyle())
                            
                            
                        }
                        
                    }
                }.padding()
                HStack {
                    Text("Sentences").font(Font.custom("FugazOne-Regular", size:  UIFont.preferredFont(forTextStyle: .largeTitle).pointSize))
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
                        .buttonStyle(PressableButtonStyle())
                    }

                }
                    
            }.navigationTitle("\(title) Degree" ).navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    NavigationView {
        CategoryView(title: "B1")
    }
}
