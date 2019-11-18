//
//  EndViewController.swift
//  quizzler
//
//  Created by Harsh Parikh on 2019-11-16.
//  Copyright © 2019 Aditya. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {

	var quizModule = Quiz()
	@IBOutlet weak var correctLabel: UILabel!
	
	@IBOutlet weak var incorrectLabel: UILabel!
	
	@IBOutlet weak var totalLabel: UILabel!
	
	@IBOutlet weak var RemarksLabel: UILabel!
	
    override func viewDidLoad() {
	setUp()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
	
	func setUp()
	{
		setCorrect()
		feedback()
		setIncorrect()
		setTotal() 
	}
        func setCorrect()
	{
		correctLabel.text = String(quizModule.giveCorrectCount())
	}
	
	func setIncorrect()
	{
		incorrectLabel.text = String(quizModule.giveIncorrectQuestionCount())
	}
	
	func setTotal()
	{
		totalLabel.text = String(quizModule.giveTotalQuestionCount())
	}
	func feedback()
	{
		RemarksLabel.text = String(quizModule.getScore())
	}

   
}
