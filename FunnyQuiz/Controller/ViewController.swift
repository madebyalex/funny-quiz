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

    var quizBrain = QuizBrain()
    var totalQuestions: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        let totalQuestions = quizBrain.quiz.count
        totalQuestionsLbl.text = String(totalQuestions)
        updateUI()
    }

    @IBAction func answerBtnPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = #colorLiteral(red: 0.03087156829, green: 0.728444278, blue: 0.4165882431, alpha: 1)
        } else {
            sender.backgroundColor = #colorLiteral(red: 0.9328396834, green: 0.2781540245, blue: 0.5247239358, alpha: 1)
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        currentQuestionLbl.text = String(quizBrain.questionNumber + 1)
        questionLbl.text = quizBrain.getQuestionText()
        
        trueBtn.backgroundColor = UIColor.clear
        falseBtn.backgroundColor = UIColor.clear
        
        progressBar.setProgress(quizBrain.getProgress(), animated: true)
    }
}

