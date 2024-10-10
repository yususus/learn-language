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
                        } label: {
                            Text(question.choices[index])
                                .foregroundStyle(.black.opacity(0.7))
                                .fontWeight(.bold)
                                .frame(width: Const.width * 0.9, height: Const.height * 0.07)
                                .background(.brown.opacity(0.1))
                                .cornerRadius(20)
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 1))
                        }
                    }

                    Spacer()

                    Button {
                        if let selectedAnswer = selectedAnswer, selectedAnswer == question.correctAnswer {
                            print("Correct Answer!")
                        } else {
                            print("Wrong Answer.")
                        }
                    } label: {
                        Text("Submit")
                            .foregroundStyle(LinearGradient(colors: [.black.opacity(0.65), .black.opacity(0.8)], startPoint: .top, endPoint: .bottomTrailing))
                            .fontWeight(.bold)
                            .frame(width: Const.width * 0.9, height: Const.height * 0.07)
                            .background(.brown.opacity(0.3))
                            .cornerRadius(20)
                    }
                }
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
