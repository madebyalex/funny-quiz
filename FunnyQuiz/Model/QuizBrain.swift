//
//  QuizBrain.swift
//  FunnyQuiz
//
//  Created by Alexander on 06.08.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quiz = [
        Question(q: "Pink is the most common color of toilet paper in France", a: "True", d: ""),
        Question(q: "Scooby Doo’s full name is Scooberdy Doo", a: "False", d: "No, it's Scoobert Doo"),
        Question(q: "You can sneeze in your sleep", a: "False", d: "Nope"),
        Question(q: "The fortune cookie invented in China", a: "False", d: "No, it was invented in San Francisco, USA"),
        Question(q: "Back in the days in England was introduced a beard tax", a: "True", d: ""),
        Question(q: "Interrobang is a question mark immediately followed by an exclamation mark", a: "True", d: ""),
        Question(q: "Blessing is the collective noun for a group of unicorns", a: "True", d: ""),
        Question(q: "USA has the most tornadoes by area", a: "False", d: "Nope, it's England"),
        Question(q: "Charlie Chaplin entered a contest to find his own look-alike and came 2rd", a: "False", d: "No, he came 3rd"),
        Question(q: "French artist Aquabouse paints cows with cow dung", a: "True", d: ""),
        Question(q: "Native to the Caribbean, frog is the mountain chicken", a: "True", d: ""),
        Question(q: "Luxemburg has 158 verses to its national anthem", a: "False", d: "No, it's Greece"),
        Question(q: "Zeedonk is the cross between a donkey and a zebra known as", a: "True", d: "")
        ].shuffled()
    
    var questionNumber = 0

    func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
            return true
        } else {
            return false
        }
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getProgress() -> Float {
        let progress = Float(questionNumber + 1) / Float(quiz.count)
        return progress
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            print("Game over")
            questionNumber = 0
        }
    }
    
}
