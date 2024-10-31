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
            Color(red: 1.0, green: 0.96, blue: 0.9)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HelpQuestion(level: level, category: category)
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
                    HStack {
                        Image(systemName: "chevron.left").foregroundStyle(Color.black)
                        Text("Category").font(Font.custom("FugazOne-Regular", size: 18)).foregroundStyle(Color.black) // Sabit "Home" metni
                    }
                }
            }
        }
        .environment(\.colorScheme, themeManager.isDarkMode ? .dark : .light)
        
    }
}

#Preview {
    QuestionView(title: "ads",level: "A1", category: "Family")
}
