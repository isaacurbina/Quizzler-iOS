//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Isaac Urbina on 11/14/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

struct Question {
	let question: String
	let answers: [String]
	let correctAnswer: String
	
	init(q: String, a: [String], correctAnswer: String) {
		self.question = q
		self.answers = a
		self.correctAnswer = correctAnswer
	}
}

