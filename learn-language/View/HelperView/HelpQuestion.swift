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
    @State private var isCorrect: Bool? = nil
    @State private var showNextButton: Bool = false
    @State private var showFeedback: Bool = false
    
    @EnvironmentObject var themeManager: ThemeManager
    
    var level: String
    var category: String
    
    var progress: Double {
        guard !viewModel.questions.isEmpty else { return 0 }
        return Double(viewModel.currentQuestionIndex + 1) / Double(viewModel.questions.count)
    }
    
    var body: some View {
        VStack {
            if !viewModel.questions.isEmpty && viewModel.currentQuestionIndex < viewModel.questions.count {
                let question = viewModel.questions[viewModel.currentQuestionIndex]
                
                VStack(spacing: 24) {
                    // Progress Bar
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Question \(viewModel.currentQuestionIndex + 1) of \(viewModel.questions.count)")
                                .font(.caption)
                                .foregroundColor(themeManager.isDarkMode ? .gray : Color(hex: "#636e72"))
                            
                            Spacer()
                            
                            Text("\(Int(progress * 100))%")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(themeManager.isDarkMode ? .gray : Color(hex: "#636e72"))
                        }
                        
                        GeometryReader { geometry in
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(themeManager.isDarkMode ? Color(hex: "#2d3436") : Color.gray.opacity(0.2))
                                    .frame(height: 8)
                                
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(
                                        LinearGradient(
                                            colors: [Color(hex: "#667eea"), Color(hex: "#764ba2")],
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .frame(width: geometry.size.width * progress, height: 8)
                                    .animation(.spring(response: 0.3), value: progress)
                            }
                        }
                        .frame(height: 8)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    
                    // Question Card
                    VStack(spacing: 16) {
                        HStack {
                            Image(systemName: "questionmark.circle.fill")
                                .font(.title2)
                                .foregroundColor(themeManager.isDarkMode ? Color(hex: "#667eea") : Color(hex: "#4facfe"))
                            
                            Text("Question")
                                .font(.headline)
                                .foregroundColor(themeManager.isDarkMode ? .gray : Color(hex: "#636e72"))
                            
                            Spacer()
                        }
                        
                        Text(question.question)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(themeManager.isDarkMode ? .white : Color(hex: "#2d3436"))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(24)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(themeManager.isDarkMode ? Color(hex: "#1e1e2e") : Color.white)
                            .shadow(color: .black.opacity(0.1), radius: 15, x: 0, y: 5)
                    )
                    .padding(.horizontal, 20)
                    
                    // Answer Choices
                    VStack(spacing: 16) {
                        ForEach(0..<question.choices.count, id: \.self) { index in
                            Button {
                                if !showNextButton {
                                    selectedAnswer = index
                                    isCorrect = nil
                                }
                            } label: {
                                HStack {
                                    // Answer letter indicator
                                    ZStack {
                                        Circle()
                                            .fill(
                                                selectedAnswer == index ?
                                                    (isCorrect == true ? Color.green :
                                                     isCorrect == false ? Color.red :
                                                     Color(hex: "#667eea")) :
                                                    (themeManager.isDarkMode ? Color(hex: "#2d3436") : Color.gray.opacity(0.2))
                                            )
                                            .frame(width: 40, height: 40)
                                        
                                        Text(String(Character(UnicodeScalar(65 + index)!)))
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .foregroundColor(
                                                selectedAnswer == index && isCorrect != nil ?
                                                    .white :
                                                    (themeManager.isDarkMode ? .white : Color(hex: "#2d3436"))
                                            )
                                    }
                                    
                                    Text(question.choices[index])
                                        .font(.body)
                                        .fontWeight(.medium)
                                        .foregroundColor(
                                            selectedAnswer == index && isCorrect != nil ?
                                                .white :
                                                (themeManager.isDarkMode ? .white : Color(hex: "#2d3436"))
                                        )
                                        .multilineTextAlignment(.leading)
                                    
                                    Spacer()
                                    
                                    if selectedAnswer == index && isCorrect != nil {
                                        Image(systemName: isCorrect == true ? "checkmark.circle.fill" : "xmark.circle.fill")
                                            .font(.title3)
                                            .foregroundColor(.white)
                                    }
                                }
                                .padding(20)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(
                                            {
                                                if selectedAnswer == index {
                                                    if isCorrect == true {
                                                        return AnyShapeStyle(LinearGradient(colors: [Color.green, Color.green.opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing))
                                                    } else if isCorrect == false {
                                                        return AnyShapeStyle(LinearGradient(colors: [Color.red, Color.red.opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing))
                                                    } else {
                                                        return AnyShapeStyle(LinearGradient(colors: [Color(hex: "#667eea"), Color(hex: "#764ba2")], startPoint: .topLeading, endPoint: .bottomTrailing))
                                                    }
                                                } else {
                                                    return AnyShapeStyle(themeManager.isDarkMode ? Color(hex: "#1e1e2e") : Color.white)
                                                }
                                            }()
                                        )
                                        .shadow(
                                            color: selectedAnswer == index ? 
                                                (isCorrect == true ? Color.green.opacity(0.4) :
                                                 isCorrect == false ? Color.red.opacity(0.4) :
                                                 Color(hex: "#667eea").opacity(0.3)) :
                                                .black.opacity(0.05),
                                            radius: selectedAnswer == index ? 10 : 5,
                                            x: 0,
                                            y: selectedAnswer == index ? 5 : 2
                                        )
                                )
                            }
                            .disabled(showNextButton)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    // Feedback Message
                    if showFeedback {
                        HStack {
                            Image(systemName: isCorrect == true ? "checkmark.circle.fill" : "xmark.circle.fill")
                                .foregroundColor(isCorrect == true ? .green : .red)
                            
                            if isCorrect == false {
                                Text("Correct Answer: \(question.choices[question.correctAnswer])")
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .foregroundColor(themeManager.isDarkMode ? .white : Color(hex: "#2d3436"))
                            } else {
                                Text("Great job! That's correct!")
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .foregroundColor(themeManager.isDarkMode ? .white : Color(hex: "#2d3436"))
                            }
                            
                            Spacer()
                        }
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(isCorrect == true ? Color.green.opacity(0.1) : Color.red.opacity(0.1))
                        )
                        .padding(.horizontal, 20)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                    }
                    
                    Spacer()
                    
                    // Submit/Next Button
                    Button {
                        if !showNextButton {
                            if let selectedAnswer = selectedAnswer {
                                isCorrect = selectedAnswer == question.correctAnswer
                                showNextButton = true
                                withAnimation(.spring(response: 0.3)) {
                                    showFeedback = true
                                }
                            }
                        } else {
                            // Next question
                            viewModel.nextQuestion(for: level, category: category)
                            selectedAnswer = nil
                            isCorrect = nil
                            showNextButton = false
                            showFeedback = false
                        }
                    } label: {
                        HStack {
                            Text(showNextButton ? "Next Question" : "Submit Answer")
                                .font(.headline)
                                .fontWeight(.semibold)
                            
                            if showNextButton {
                                Image(systemName: "arrow.right")
                                    .font(.headline)
                            }
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(
                            LinearGradient(
                                colors: [Color(hex: "#667eea"), Color(hex: "#764ba2")],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(16)
                        .shadow(color: Color(hex: "#667eea").opacity(0.4), radius: 15, x: 0, y: 8)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                    .disabled(selectedAnswer == nil && !showNextButton)
                    .opacity(selectedAnswer == nil && !showNextButton ? 0.6 : 1.0)
                }
            } else {
                // Completion View
                VStack(spacing: 24) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.green)
                    
                    Text("Congratulations!")
                        .font(Font.custom("FugazOne-Regular", size: 36))
                        .foregroundColor(themeManager.isDarkMode ? .white : Color(hex: "#2d3436"))
                    
                    Text("You've completed all questions!")
                        .font(.title3)
                        .foregroundColor(themeManager.isDarkMode ? .gray : Color(hex: "#636e72"))
                }
                .padding(40)
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
