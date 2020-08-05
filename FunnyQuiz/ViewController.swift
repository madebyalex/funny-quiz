//
//  ViewController.swift
//  FunnyQuiz
//
//  Created by Alexander on 05.08.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    @IBOutlet weak var currentQuestionLbl: UILabel!
    @IBOutlet weak var totalQuestionsLbl: UILabel!
    
    let quiz = [
        Question(text: "Pink is the most common colour of toilet paper in France", answer: "True"),
        Question(text: "Scooby Doo’s full name is Scooberdy Doo", answer: "True"),
        Question(text: "You can sneeze in your sleep", answer: "False")
    ]
    
    var questionNumber = 0
    var totalQuestions: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        totalQuestions = quiz.count
        totalQuestionsLbl.text = String(totalQuestions)
        updateUI()
    }

    @IBAction func answerBtnPressed(_ sender: UIButton) {
        
        checkAnswer(sender: sender.currentTitle ?? "")
        
        if questionNumber + 1 < totalQuestions {
            questionNumber += 1
        } else {
            print("Game over")
            questionNumber = 0
        }
        
        updateUI()
    }
    
    func updateUI() {
        currentQuestionLbl.text = String(questionNumber + 1)
        questionLbl.text = quiz[questionNumber].text
    }
    
    func checkAnswer(sender: String) {
        if quiz[questionNumber].answer == sender {
            print("Correct!")
        } else {
            print("Wrong")
        }
    }
    
}

