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
	@IBOutlet weak var questionLabel: UILabel!
	
	@IBOutlet weak var trueButton: UIButton!
	
	@IBOutlet weak var falseButton: UIButton!
	
	@IBOutlet weak var progressBar: UIProgressView!
	
	// --- MARK: - constants and variables ---
	private let quiz = [
		Question(q: "A slug's blood is green.", a: "True"),
		Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
		Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
		Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
		Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
		Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
		Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
		Question(q: "Google was originally called 'Backrub'.", a: "True"),
		Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
		Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
		Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
		Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
	]
	private var questionNumber = 0
	
	// --- MARK: - ViewController callbacks ---
	override func viewDidLoad() {
		super.viewDidLoad()
		progressBar.progress = 0.0
		updateUI()
	}
	
	// --- MARK: - Actions ---
	@IBAction func answerButtonPressed(_ sender: UIButton) {
		let userAnswer = sender.currentTitle // True, False
		let correctAnswer = quiz[questionNumber].answer
		
		if userAnswer == correctAnswer {
			sender.backgroundColor = UIColor.green
		} else {
			sender.backgroundColor = UIColor.red
		}
		
		if (questionNumber + 1 < quiz.count) {
			questionNumber += 1
			UIView.animate(withDuration: 0.5, animations: {
				self.updateUI()
			})
		} else {
			questionLabel.text = "Quiz Complete!"
			progressBar.progress = 1.0
			trueButton.isEnabled = false
			falseButton.isEnabled = false
			UIView.animate(withDuration: 0.5, animations: {
				self.trueButton.backgroundColor = UIColor.clear
				self.falseButton.backgroundColor = UIColor.clear
			})
		}
	}
	
	private func updateUI() {
		questionLabel.text = quiz[questionNumber].question
		let progress = Float(questionNumber + 1) / Float(quiz.count)
		
			trueButton.backgroundColor = UIColor.clear
			falseButton.backgroundColor = UIColor.clear
			progressBar.progress = progress
	}
}

