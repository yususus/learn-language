//
//  QuestionView.swift
//  learn-language
//
//  Created by yusuf on 5.10.2024.
//

import SwiftUI

struct QuestionView: View {
    var title : String
    var level: String
    var category: String
    @ObservedObject var viewModel = HelpQuestionsViewModel()
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
            
            VStack {
                HelpQuestion(level: level, category: category)
                    .environmentObject(HelpQuestionsViewModel())
            }
            .onAppear {
                viewModel.loadQuestions(for: level, category: category)
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack(spacing: 6) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 16, weight: .semibold))
                        Text("Category")
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
        QuestionView(title: "ads",level: "A1", category: "Family")
            .environmentObject(ThemeManager())
    }
}
