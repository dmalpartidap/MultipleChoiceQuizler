//
//  Question.swift
//  MultipleChoiceQuizler
//
//  Created by David Malpartida on 31/03/24.
//

import Foundation

struct Question {
    let text: String
    let options: [String]
    let answer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        options = a
        answer = correctAnswer
    }
}
