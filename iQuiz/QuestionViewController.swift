//
//  QuestionViewController.swift
//  iQuizPart2
//
//  Created by Vivian on 11/9/15.
//  Copyright © 2015 Vivian. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var quiz = [(String, String, String, String, String, String)]()
    var questionNum = 0
    var selectedAnswer = ""
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choiceOne: UIButton!
    @IBOutlet weak var choiceTwo: UIButton!
    @IBOutlet weak var choiceThree: UIButton!
    @IBOutlet weak var choiceFour: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionLabel.text = quiz[questionNum].0
        choiceOne.setTitle(quiz[questionNum].1, forState: .Normal)
        choiceTwo.setTitle(quiz[questionNum].2, forState: .Normal)
        choiceThree.setTitle(quiz[questionNum].3, forState: .Normal)
        choiceFour.setTitle(quiz[questionNum].4, forState: .Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        if let vc = segue.destinationViewController as? AnswerViewController {
//        }
//    }

}
