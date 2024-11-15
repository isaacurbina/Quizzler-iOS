//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	// --- MARK:  - Outlets ---
	@IBOutlet weak var scoreLabel: UILabel!
	
	@IBOutlet weak var questionLabel: UILabel!
	
	@IBOutlet weak var trueButton: UIButton!
	
	@IBOutlet weak var falseButton: UIButton!
	
	@IBOutlet weak var progressBar: UIProgressView!
	
	// --- MARK: - constants and variables ---
	var quizBrain = QuizBrain()
	
	// --- MARK: - ViewController callbacks ---
	override func viewDidLoad() {
		super.viewDidLoad()
		progressBar.progress = 0.0
		updateUI()
	}
	
	// --- MARK: - Actions ---
	@IBAction func answerButtonPressed(_ sender: UIButton) {
		let userAnswer = sender.currentTitle! // True, False
		let isAnswerCorrect = quizBrain.checkAnswer(userAnswer)
		
		if isAnswerCorrect {
			sender.backgroundColor = UIColor.green
		} else {
			sender.backgroundColor = UIColor.red
		}
		
		quizBrain.nextQuestion()
		
		Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
	}
	
	// --- MARK: - functions ---
	@objc func updateUI() {
		scoreLabel.text = "Score: \(quizBrain.getScore())"
		questionLabel.text = quizBrain.getQuestionText()
		progressBar.progress = quizBrain.getProgress()
		trueButton.backgroundColor = UIColor.clear
		falseButton.backgroundColor = UIColor.clear
	}
}

