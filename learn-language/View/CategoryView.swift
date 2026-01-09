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
        ZStack {
            // Modern gradient background
            LinearGradient(
                colors: themeManager.isDarkMode ? 
                    [Color(hex: "#0a0a0a"), Color(hex: "#1a1a2e")] :
                    [Color(hex: "#f8f9fa"), Color(hex: "#e9ecef")],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 24) {
                    // Words Section
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "text.book.closed.fill")
                                .font(.title2)
                                .foregroundColor(themeManager.isDarkMode ? Color(hex: "#667eea") : Color(hex: "#4facfe"))
                            
                            Text("Words")
                                .font(Font.custom("FugazOne-Regular", size: 28))
                                .foregroundColor(themeManager.isDarkMode ? .white : Color(hex: "#2d3436"))
                            
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        
                        VStack(spacing: 12) {
                            ForEach(words, id: \.self) { category in
                                NavigationLink {
                                    QuestionView(title: category, level: level, category: category)
                                        .environmentObject(HelpQuestionsViewModel())
                                } label: {
                                    HelpCategory(categoryTitle: category)
                                }
                                .buttonStyle(PressableButtonStyle())
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.top, 10)
                    
                    // Sentences Section
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "bubble.left.and.bubble.right.fill")
                                .font(.title2)
                                .foregroundColor(themeManager.isDarkMode ? Color(hex: "#f093fb") : Color(hex: "#fa709a"))
                            
                            Text("Sentences")
                                .font(Font.custom("FugazOne-Regular", size: 28))
                                .foregroundColor(themeManager.isDarkMode ? .white : Color(hex: "#2d3436"))
                            
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        
                        VStack(spacing: 12) {
                            ForEach(sentences, id: \.self) { seviye in
                                NavigationLink {
                                    QuestionView(title: seviye, level: level, category: seviye)
                                        .environmentObject(HelpQuestionsViewModel())
                                } label: {
                                    SentencesView(categoryTitle: seviye)
                                }
                                .buttonStyle(PressableButtonStyle())
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                }
                .padding(.vertical, 20)
            }
        }
        .navigationTitle("\(title) Level")
        .navigationBarTitleDisplayMode(.large)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack(spacing: 6) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 16, weight: .semibold))
                        Text("Home")
                            .font(Font.custom("FugazOne-Regular", size: 18))
                    }
                    .foregroundColor(themeManager.isDarkMode ? .white : Color(hex: "#2d3436"))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(
                        Capsule()
                            .fill(themeManager.isDarkMode ? Color(hex: "#2d3436") : Color.white)
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                    )
                }
            }
        }
        .environment(\.colorScheme, themeManager.isDarkMode ? .dark : .light)
        .environmentObject(HelpQuestionsViewModel())
    }
}

#Preview {
    NavigationView {
        CategoryView(title: "B1", level: "General")
            .environmentObject(ThemeManager())
    }
}
