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
		"Four + Two is equal to Six",
		"Five - Three is greater than One",
		"Three + Eight is less than Ten"
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
		questionNumber += 1
		updateUI()
	}
	
	private func updateUI() {
		if (questionNumber >= quiz.count) {
			questionLabel.text = "Quiz Complete!"
		} else {
			questionLabel.text = quiz[questionNumber]
		}
	}
	
}

