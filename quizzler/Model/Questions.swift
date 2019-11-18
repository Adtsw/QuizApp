//
//  Questions.swift
//  quizzler
//
//  Created by Harsh Parikh on 2019-11-16.
//  Copyright © 2019 Aditya. All rights reserved.
//

import Foundation
 class Questions
{
	private var question : String
	private var answer : String
	private var choice1 : String
	private var choice2 : String
	private var choice3 : String
	private var choice4 : String
	
	init(){
		question = "Has this question properly set up?"
		answer = "NO"
		choice1 = "NO"
		choice2 = "NO"
		choice3 = "NO"
		choice4 = "NO"
	}
	init(q : String, ans : String, c1 : String, c2 : String, c3 : String, c4 : String){
		question = q
		answer = ans
		choice1 = c1
		choice2 = c2
		choice3 = c3
		choice4 = c4
	}
	func giveChoices() -> [String]
	{
		var temp : [String] = []
		temp.append(choice1)
		temp.append(choice2)
		temp.append(choice3)
		temp.append(choice4)
		
		return temp
	}
	
	func checkAnswers(input : String) -> Bool
	{
		if(input == answer)
		{return true}
		else
		{return false}
	}
	func giveQuestion() -> String {
		return question
	}
}
