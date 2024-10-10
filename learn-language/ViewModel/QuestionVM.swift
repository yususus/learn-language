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
    
    init() {
        loadQuestions()
    }
    
    func loadQuestions() {
        // Burada JSON dosyasını okuyacak kodu yazıyoruz
        if let url = Bundle.main.url(forResource: "life-sentencesa1", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonResponse = try decoder.decode([String: [QuestionModel]].self, from: data)
                self.questions = jsonResponse["sentences"] ?? []
            } catch {
                print("Error loading questions: \(error)")
            }
        }
    }
}
