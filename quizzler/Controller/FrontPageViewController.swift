//
//  FrontPageViewController.swift
//  quizzler
//
//  Created by Harsh Parikh on 2019-11-16.
//  Copyright © 2019 Aditya. All rights reserved.
//

import UIKit

class FrontPageViewController: UIViewController {
	
	var quizModule = Quiz()
	
	

	@IBAction func StartPress(_ sender: UIButton) {
		
		performSegue(withIdentifier: "StartToQuiz", sender: nil)
	}
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	if(segue.identifier == "startToQuiz")
	{
		let seg = segue.destination as! QuizViewController
		seg.quizModule = self.quizModule
	}
    }
    

}
