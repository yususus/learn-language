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
    @State private var isCorrect: Bool? = nil // Doğru veya yanlış durumu için

    var body: some View {
        VStack {
            if let question = viewModel.questions.first {
                VStack {
                    Text(question.question)
                        .foregroundStyle(LinearGradient(colors: [.black.opacity(0.8), .black.opacity(0.65)], startPoint: .top, endPoint: .bottomTrailing))
                        .bold()
                        .font(.title3)
                        .padding()
                        .frame(width: Const.width * 0.9, height: Const.height * 0.25)
                        .background(.brown.opacity(0.25))
                        .cornerRadius(20)

                    Spacer()

                    ForEach(0..<question.choices.count, id: \.self) { index in
                        Button {
                            selectedAnswer = index
                            isCorrect = nil // Seçim yapıldığında durumu sıfırla
                        } label: {
                            Text(question.choices[index])
                                .foregroundStyle(.black.opacity(0.7))
                                .fontWeight(.bold)
                                .frame(width: Const.width * 0.9, height: Const.height * 0.07)
                                .background(selectedAnswer == index ? (isCorrect == true ? Color.green : (isCorrect == false ? Color.red : Color.blue.opacity(0.2))) : Color.brown.opacity(0.1)) // Seçim yapılınca yeşil/kırmızı arka plan
                                .cornerRadius(20)
                                .overlay(RoundedRectangle(cornerRadius: 20)
                                    .stroke(selectedAnswer == index ? (isCorrect == true ? Color.green : (isCorrect == false ? Color.red : Color.blue)) : Color.black, lineWidth: 1) // Seçim yapılınca yeşil/kırmızı çerçeve
                                )
                        }
                    }

                    Spacer()
                    // Doğru cevabı göstermek için yeni bir VStack
                    if isCorrect == false {
                        Text("Correct Answer: \(question.choices[question.correctAnswer])")
                            .foregroundColor(.green)
                            .fontWeight(.bold)
                            .padding()
                    }
                    Button {
                        if let selectedAnswer = selectedAnswer {
                            isCorrect = selectedAnswer == question.correctAnswer
                        }
                    } label: {
                        Text("Submit")
                            .foregroundStyle(LinearGradient(colors: [.black.opacity(0.65), .black.opacity(0.8)], startPoint: .top, endPoint: .bottomTrailing))
                            .fontWeight(.bold)
                            .frame(width: Const.width * 0.9, height: Const.height * 0.07)
                            .background(Color.brown.opacity(0.3)) // Submit butonu için sabit arka plan
                            .cornerRadius(20)
                    }

                    
                }
                .padding()
            }
        }
        .onAppear {
            viewModel.loadQuestions()
        }
    }
}

#Preview {
    HelpQuestion()
}
