//
//  File.swift
//  Quiz
//
//  Created by Eren Çetintaş on 12.02.2024.
//

import Foundation

struct Question {
    
    var questionText : String?
    var answers = [String]()
    var correctAnswer : String?
  
    init(questionText: String? = nil, answers: [String] = [String](), correctAnswer: String? = nil) {
        self.questionText = questionText
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
    
}
