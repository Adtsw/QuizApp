//
//  QuizViewController.swift
//  quizzler
//
//  Created by Harsh Parikh on 2019-11-16.
//  Copyright © 2019 Aditya. All rights reserved.
//

import UIKit

class quizCell : UITableViewCell
{
	
	@IBOutlet weak var answerLabel: UILabel!
	
}

class QuizViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
	
	var quizModule = Quiz()
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return quizAnswerList.count
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		answerCheck = quizAnswerList[indexPath.row]
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cell = tableView.dequeueReusableCell(withIdentifier: "quizCell") as! quizCell
		cell.answerLabel.text = quizAnswerList[indexPath.row]
		return cell
	}
	var answerCheck = "Nothing"
	var quizAnswerList = ["answer 1", "answer 2", "answer 3", "answer 4"]

	@IBOutlet weak var questionLabel: UILabel!
	
	@IBOutlet weak var countLabel: UILabel!
	
	
	@IBAction func actionSubmit(_ sender: UIButton) {
		chooseAnswer()
	}
	
	
	@IBOutlet weak var quizTable: UITableView!
	
	
	override func viewDidLoad() {
		quizTable.delegate = self
		quizTable.dataSource = self
		
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
	
	override func viewDidAppear(_ animated: Bool) {
		quizModule.reset()
		setUp(check: true)
	}
	
	func setUp(check : Bool)
	{
		if(check)
		{
			setCount()
			setQuestion()
			setChoices()
			quizTable.reloadData()
		}
		else{
			performSegue(withIdentifier: "QuizToEnd", sender: nil)
		}
	}
	
	func setCount()
	{
		var temp = ""
		temp.append(String(quizModule.giveCurrentQuestionValue()))
		temp.append("/")
		temp.append(String(quizModule.giveTotalQuestionCount()))
		
		countLabel.text = temp
	}
	
	func setQuestion()
	{
		questionLabel.text = quizModule.giveCurrentQuestion().giveQuestion()//giveCurrentQuestion().giveQuestion()
	}
	
	func setChoices()
	{
		quizAnswerList = quizModule.giveCurrentQuestion().giveChoices()
		answerCheck = quizAnswerList[0]
	}
    
	func chooseAnswer()
	{
		quizModule.inputAnswer(input: quizModule.giveCurrentQuestion().checkAnswers(input: answerCheck))
		setUp(check: quizModule.moveToNextQuestion())
	}

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "QuizToEnd")
	{
		var seg = segue.destination as! EndViewController
		seg.quizModule = self.quizModule
	}
    }
    

}
