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
        Question(q: "Pink is the most common color of toilet paper in France", a: "True"),
        Question(q: "Scooby Doo’s full name is Scooberdy Doo", a: "False"),
        Question(q: "You can sneeze in your sleep", a: "False"),
        Question(q: "The fortune cookie invented in China", a: "False"),
        Question(q: "Back in the days in England was introduced a beard tax", a: "True"),
        Question(q: "Interrobang is a question mark immediately followed by an exclamation mark", a: "True"),
        Question(q: "Blessing is the collective noun for a group of unicorns", a: "True"),
        Question(q: "USA has the most tornadoes by area", a: "False")
        
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
        
//        checkAnswer(sender: sender.currentTitle ?? "")
        
        if quiz[questionNumber].answer == sender.currentTitle {
            sender.backgroundColor = #colorLiteral(red: 0, green: 0.6666666667, blue: 0.368627451, alpha: 1)
            print("Correct!")
        } else {
            sender.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
            print("Wrong")
        }
        
        if questionNumber + 1 < totalQuestions {
            questionNumber += 1
        } else {
            print("Game over")
            questionNumber = 0
        }
        
        
    }
    
    @objc func updateUI() {
        currentQuestionLbl.text = String(questionNumber + 1)
        questionLbl.text = quiz[questionNumber].text
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        trueBtn.backgroundColor = UIColor.clear
        falseBtn.backgroundColor = UIColor.clear
    }
    
//    func checkAnswer(sender: String) {
//        if quiz[questionNumber].answer == sender {
//            print("Correct!")
//        } else {
//            print("Wrong")
//        }
//    }
    
}

