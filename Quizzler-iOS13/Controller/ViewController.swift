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
	
	@IBOutlet weak var aButton: UIButton!
	
	@IBOutlet weak var bButton: UIButton!
	
	@IBOutlet weak var cButton: UIButton!
	
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
		let userAnswer = sender.currentTitle!
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
		// update score and progress bar
		scoreLabel.text = "Score: \(quizBrain.getScore())"
		questionLabel.text = quizBrain.getQuestionText()
		progressBar.progress = quizBrain.getProgress()
		
		// clear button colors
		aButton.backgroundColor = UIColor.clear
		bButton.backgroundColor = UIColor.clear
		cButton.backgroundColor = UIColor.clear
		
		// update answers for new question
		let answers = quizBrain.getQuestionAnswers()
		aButton.setTitle(answers[0], for: .normal)
		bButton.setTitle(answers[1], for: .normal)
		cButton.setTitle(answers[2], for: .normal)
	}
}

