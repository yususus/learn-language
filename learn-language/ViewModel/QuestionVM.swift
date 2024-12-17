//
//  QuestionVm.swift
//  learn-language
//
//  Created by yusuf on 10.10.2024.
//

import Foundation
import SwiftyJSON

class HelpQuestionsViewModel: ObservableObject {
    @Published var questions: [QuestionModel] = []
    @Published var currentQuestionIndex: Int = 0
    @Published var selectedLanguage: String {
            didSet {
                defaults.set(selectedLanguage, forKey: "selectedLanguage") // Dil değişikliğini kaydet
            }
        }
    
    let defaults = UserDefaults.standard
    init() {
            self.selectedLanguage = defaults.string(forKey: "selectedLanguage") ?? "Türkçe"
        }
    
    // Seviye ve kategori için benzersiz bir anahtar oluşturma
    func key(for level: String, category: String) -> String {
        return "\(level)_\(category)_\(selectedLanguage)_progress"
    }
    
    // İlerlemeyi kaydet
    func saveProgress(for level: String, category: String) {
        let progressKey = key(for: level, category: category)
        defaults.set(currentQuestionIndex, forKey: progressKey)
        print("Progress saved for \(progressKey): \(currentQuestionIndex)")
    }
    
    // İlerlemeyi geri yükle
    func loadProgress(for level: String, category: String) {
        let progressKey = key(for: level, category: category)
        if let savedIndex = defaults.value(forKey: progressKey) as? Int {
            currentQuestionIndex = savedIndex
            print("Progress loaded for \(progressKey): \(currentQuestionIndex)")
        } else {
            print("No progress found for \(progressKey), starting from 0.")
            currentQuestionIndex = 0
        }
    }
    
    // Soruları yükle ve ilerlemeyi geri getir
    func loadQuestions(for level: String, category: String) {
        let fileName = "\(level)\(category)\(selectedLanguage)"
        
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                self.questions = try decoder.decode([QuestionModel].self, from: data)
                
                // İlerlemeyi geri yükle
                loadProgress(for: level, category: category)
                
                print("File found: \(fileName).json, questions loaded successfully.")
            } catch {
                print("Error loading questions: \(error)")
            }
        } else {
            print("File not found: \(fileName).json")
        }
    }
    
    // Sıradaki soruya geç
    func nextQuestion(for level: String, category: String) {
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
            saveProgress(for: level, category: category)
        }
    }
}

