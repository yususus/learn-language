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
    
    func loadQuestions(for level: String, category: String) {
        // Seviye ve kategoriye göre JSON dosyası adını oluştur
        let fileName = "\(level)\(category)"
        
        // Dosyayı yükle
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                self.questions = try decoder.decode([QuestionModel].self, from: data)
                print("File found: \(fileName).json")
            } catch {
                print("Error loading questions: \(error)")
            }
        } else {
            print("File not found: \(fileName).json")
        }
    }
}
