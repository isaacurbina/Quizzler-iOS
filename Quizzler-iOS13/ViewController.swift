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
		["Four + Two is equal to Six", "True"],
		["Five - Three is greater than One", "True"],
		["Three + Eight is less than Ten", "False"]
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
		let correctAnswer = quiz[questionNumber][1]
		
		if userAnswer == correctAnswer {
			print("Right!")
		} else {
			print("Wrong!")
		}
	
		if (questionNumber + 1 < quiz.count) {
			questionNumber += 1
			updateUI()
		} else {
			questionLabel.text = "Quiz Complete!"
			progressBar.progress = 1.0
		}
	}
	
	private func updateUI() {
		questionLabel.text = quiz[questionNumber][0]
		let progress = Float(questionNumber) / Float(quiz.count)
		progressBar.progress = progress
	}
	
}

