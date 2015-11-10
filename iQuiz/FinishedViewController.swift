//
//  FinishedViewController.swift
//  iQuizPart2
//
//  Created by Vivian on 11/10/15.
//  Copyright © 2015 Vivian. All rights reserved.
//

import UIKit

class FinishedViewController: UIViewController {
    
    var selectedChoice = ""
    var correctAnswer = ""
    var quiz = [Array<String>()]
    var questionNum = 0
    var correctTotal = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextSelected(sender: AnyObject) {
        self.performSegueWithIdentifier("ShowQuizzes", sender: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
