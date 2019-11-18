//
//  Quiz.swift
//  quizzler
//
//  Created by Harsh Parikh on 2019-11-16.
//  Copyright © 2019 Aditya. All rights reserved.
//

import Foundation
import GameKit
class Quiz
{
	private var questionList : [Questions]
	private var currentQuesion : Int
	private var correctCount : Int
	private var incorrectCount : Int
	
	init()
	{
		currentQuesion = 0
		correctCount = 0
		incorrectCount = 0
		questionList = [
			Questions(q: "Which of the following countries has the most residents?", ans: "Nigeria", c1: "Nigeria" , c2: "Russia", c3: "Iran", c4: "Vietnam"),
			Questions(q: "Which nation produces the most oil?", ans: "Canada", c1: "Iran", c2: "Iraq", c3: "Canada", c4: "Brazil"),
			Questions(q: "Which of the following rivers is longest?", ans: "Mississippi", c1: "Yangtze", c2: "Mississippi", c3: "Congo", c4: "Mekong"),
			Questions(q: "Which country was the first to allow women to vote in national elections?", ans: "Poland", c1: "Poland", c2: "United States", c3: "Sweden", c4: "Senegal"),
			Questions(q:  "Which of these countries won the most  medals in the 2012 Summer Games?", ans: "Great Britian", c1: "France", c2: "Germany", c3: "Japan", c4: "Great Britian")]
			
	}
	
	func  giveCurrentQuestion() -> Questions {
		return questionList[currentQuesion]
	}
	
	func inputAnswer(input : Bool)
	{
		if(input)
		{
			correctCount += 1
		}
		else
		{
			incorrectCount += 1
		}
	}
	
	func moveToNextQuestion() -> Bool
	{
		if(currentQuesion == questionList.count-1)
		{
			return false
		}
		else
		{
			currentQuesion += 1
			return true
		}
	}
	
	func giveTotalQuestionCount() -> Int
	{
		return questionList.count
	}
	
	func giveIncorrectQuestionCount() -> Int
	{
		return incorrectCount 
	}
	
	func giveCurrentQuestionValue() -> Int
	{
		return currentQuesion + 1 
	}
	
	func giveCorrectCount() -> Int
	{
		return correctCount
	}
	func getScore() -> String {
        let percentile = Double(correctCount) / Double(5)
        
        if (percentile <= 0.40) {
            return "Please Try Again. Select the Back Option TWICE"
        } else if (percentile == 0.60) {
            return "Good Job"
	} else if (percentile == 0.80) {
            return "Excellent Work"
	} else if (percentile == 1.0) {
	    return "You are a GENIUS"
	}
		return ""
	}
	func reset()
	{
		currentQuesion = 0
		correctCount = 0
		incorrectCount = 0
	}
}
