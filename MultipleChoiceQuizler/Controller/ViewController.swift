//
//  ViewController.swift
//  MultipleChoiceQuizler
//
//  Created by David Malpartida on 31/03/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choiceButton1: UIButton!
    @IBOutlet weak var choiceButton2: UIButton!
    @IBOutlet weak var choiceButton3: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        progressBar.progress = 0.0
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        choiceButton1.setTitle(quizBrain.getOption(0), for: .normal)
        choiceButton2.setTitle(quizBrain.getOption(1), for: .normal)
        choiceButton3.setTitle(quizBrain.getOption(2), for: .normal)
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        choiceButton1.backgroundColor = UIColor.clear
        choiceButton2.backgroundColor = UIColor.clear
        choiceButton3.backgroundColor = UIColor.clear
    }


}

