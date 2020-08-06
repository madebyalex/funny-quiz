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
        
        if quiz[questionNumber].answer == sender.currentTitle {
            sender.backgroundColor = #colorLiteral(red: 0.03087156829, green: 0.728444278, blue: 0.4165882431, alpha: 1)
        } else {
            sender.backgroundColor = #colorLiteral(red: 0.9328396834, green: 0.2781540245, blue: 0.5247239358, alpha: 1)
        }
        
        if questionNumber + 1 < totalQuestions {
            questionNumber += 1
        } else {
            print("Game over")
            questionNumber = 0
        }
        
        Timer.scheduledTimer(timeInterval: 00.6, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        currentQuestionLbl.text = String(questionNumber + 1)
        questionLbl.text = quiz[questionNumber].text
        
        trueBtn.backgroundColor = UIColor.clear
        falseBtn.backgroundColor = UIColor.clear
        
        progressBar.setProgress(Float(questionNumber + 1) / Float(totalQuestions), animated: true)
    }
}

