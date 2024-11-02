//
//  HelpQuestion.swift
//  learn-language
//
//  Created by yusuf on 8.10.2024.
//

import SwiftUI

struct HelpQuestion: View {
    @StateObject var viewModel = HelpQuestionsViewModel()
    @State private var selectedAnswer: Int? = nil
    @State private var isCorrect: Bool? = nil // Doğru veya yanlış durumu
    @State private var showNextButton: Bool = false
    
    @EnvironmentObject var themeManager: ThemeManager
    
    var level: String
    var category: String
    
    var body: some View {
        VStack {
            if !viewModel.questions.isEmpty && viewModel.currentQuestionIndex < viewModel.questions.count {
                            let question = viewModel.questions[viewModel.currentQuestionIndex]
                
                VStack {
                    Text(question.question)
                        .foregroundColor(themeManager.isDarkMode ? .white : .black)
                        .bold()
                        .font(.title3)
                        .padding()
                        .frame(width: Const.width * 0.9, height: Const.height * 0.25)
                        .background(themeManager.isDarkMode ? Color(UIColor(hex : "#06402b")) : Color.brown.opacity(0.3))
                        .cornerRadius(20)
                    
                    Spacer()
                    
                    ForEach(0..<question.choices.count, id: \.self) { index in
                        Button {
                            selectedAnswer = index
                            isCorrect = nil // Seçim yapıldığında durumu sıfırla
                        } label: {
                            Text(question.choices[index])
                                .foregroundColor(themeManager.isDarkMode ? .white : .black.opacity(0.7))
                                .fontWeight(.bold)
                                .frame(width: Const.width * 0.9, height: Const.height * 0.07)
                                .background(selectedAnswer == index ? (isCorrect == true ? Color.green : (isCorrect == false ? Color.red : Color.blue.opacity(0.2))) : themeManager.isDarkMode ? Color(UIColor(hex : "#085957")) : Color.brown.opacity(0.1))
                                .cornerRadius(20)
                                .overlay(RoundedRectangle(cornerRadius: 20)
                                    .stroke(selectedAnswer == index ? (isCorrect == true ? Color.green : (isCorrect == false ? Color.red : Color.blue)) : Color.black, lineWidth: 1) // Seçim yapılınca yeşil/kırmızı çerçeve
                                )
                        }
                    }
                    
                    Spacer()
                    
                    if isCorrect == false {
                        Text("Correct Answer: \(question.choices[question.correctAnswer])")
                            .foregroundColor(.green)
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Button {
                        if let selectedAnswer = selectedAnswer {
                            isCorrect = selectedAnswer == question.correctAnswer
                            showNextButton = true // Cevap kontrol edildikten sonra Next butonunu göster
                        }
                    } label: {
                        Text("Submit")
                            .foregroundColor(themeManager.isDarkMode ? .white : .black)
                            .fontWeight(.bold)
                            .frame(width: Const.width * 0.9, height: Const.height * 0.07)
                            .background(themeManager.isDarkMode ? Color(UIColor(hex : "#06402b")) : Color.brown.opacity(0.3))
                            .cornerRadius(20)
                    }
                    
                    // Next butonu sadece cevap verildikten sonra görünecek
                    if showNextButton {
                        Button {
                            // Sıradaki soruya geç
                            viewModel.nextQuestion(for: level, category: category)
                            
                            selectedAnswer = nil
                            isCorrect = nil
                            showNextButton = false
                        } label: {
                            Text("Next")
                                .fontWeight(.bold)
                                .frame(width: Const.width * 0.9, height: Const.height * 0.07)
                                .background(Color.blue.opacity(0.3))
                                .cornerRadius(20)
                        }
                        .padding()
                    }
                }
                .padding()
            } else {
                Text("No more questions")
                //finish View eklenecek
            }
        }
        .onAppear {
            viewModel.loadQuestions(for: level, category: category)
        }
        .environment(\.colorScheme, themeManager.isDarkMode ? .dark : .light)
    }
}

#Preview {
    HelpQuestion(level: "A1", category: "General")
        .environmentObject(ThemeManager())
}
