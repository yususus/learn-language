//
//  QuestionModel.swift
//  learn-language
//
//  Created by yusuf on 10.10.2024.
//

import Foundation

struct QuestionModel: Codable, Identifiable {
    let id: Int 
    let question: String
    let choices: [String]
    let correctAnswer: Int
}
