//
//  CategoryView.swift
//  learn-language
//
//  Created by yusuf on 4.10.2024.
//

import SwiftUI

struct CategoryView: View {
    var title: String
    var level: String
    let words = ["General"]
    let sentences = ["Sport", "Science","Family", "Education","Life"]
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var themeManager: ThemeManager
    var body: some View {
        VStack{
            
            ZStack {
                Color(themeManager.isDarkMode ? UIColor.black : UIColor(red: 1.0, green: 0.96, blue: 0.9, alpha: 1.0))
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    HStack {
                        Text("Words")
                            .font(Font.custom("FugazOne-Regular", size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize))
                            .foregroundColor(themeManager.isDarkMode ? .white : .black)
                        Spacer()
                    }.padding(.horizontal, Const.width * 0.05)
                    ScrollView(.horizontal){
                        HStack {
                            ForEach(words, id: \.self){ category in
                                NavigationLink {
                                    QuestionView(title: category, level: level, category: category)
                                } label: {
                                    HelpCategory(categoryTitle: category)
                                }
                                .buttonStyle(PressableButtonStyle())
                                
                            }
                        }
                    }.padding()
                    HStack {
                        Text("Sentences")
                            .font(Font.custom("FugazOne-Regular", size:  UIFont.preferredFont(forTextStyle: .largeTitle).pointSize))
                            .foregroundColor(themeManager.isDarkMode ? .white : .black)
                        Spacer()
                    }.padding(.horizontal, Const.width * 0.05)
                    VStack{
                        ForEach(sentences, id: \.self) { seviye in
                            NavigationLink {
                                QuestionView(title: seviye, level: level, category: seviye)
                            } label: {
                                SentencesView(categoryTitle: seviye)
                            }
                            .buttonStyle(PressableButtonStyle())
                        }
                    }
                }.navigationTitle("\(title) Degree")
                    
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
        
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(themeManager.isDarkMode ? .white : .black)
                        Text("Home").font(Font.custom("FugazOne-Regular", size: 18))
                            .foregroundColor(themeManager.isDarkMode ? .white : .black)
                    }
                }
            }
        }
        .environment(\.colorScheme, themeManager.isDarkMode ? .dark : .light)
    }
}

#Preview {
    NavigationView {
        CategoryView(title: "B1", level: "General")
            .environmentObject(ThemeManager())
    }
}
