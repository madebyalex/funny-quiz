//
//  Question.swift
//  FunnyQuiz
//
//  Created by Alexander on 06.08.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    let details: String?
    
    init(q: String, a: String, d: String?) {
        text = q
        answer = a
        details = d
    }
}
