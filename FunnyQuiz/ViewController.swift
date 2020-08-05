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
        ["Pink is the most common colour of toilet paper in France", "True"],
        ["Scooby Doo’s full name is Scooberdy Doo", "False"],
        ["You can sneeze in your sleep", "False"]
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
        questionLbl.text = quiz[questionNumber][0]
    }
    
    func checkAnswer(sender: String) {
        if quiz[questionNumber][1] == sender {
            print("Correct!")
        } else {
            print("Wrong")
        }
    }
    
}

