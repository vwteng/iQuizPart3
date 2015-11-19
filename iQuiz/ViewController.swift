//
//  ViewController.swift
//  iQuizPart3
//
//  Created by Vivian on 11/1/15.
//  Copyright © 2015 Vivian. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var quizzes = [AnyObject]()
    
    @IBOutlet var tableView: UITableView!
//    var quizzes = [
//        ("Mathematics", "Answer some math problems"),
//        ("Marvel Super Heroes", "Test your knowledge of super heroes"),
//        ("Science", "Questions about science")
//    ]
//    
//    var mathematics = [
//        ["What is 4 + 3?", "1", "5", "7", "12", "7"],
//        ["What is 12 * 10?", "0", "2", "100", "120", "120"],
//        ["What is 50% of 44?", "11", "22", "33", "44", "22"],
//        ["What is 1934.01 * 0?", "0", "10.5", "200.01", "9999", "0"],
//        ["What is 10000 / 100?", "0.1", "10", "100", "1000", "100"]
//    ]
//    
//    var marvel = [
//        ["Who is not a part of the original Fantastic Four?", "Mister Fantastic", "Invisible Man", "The Human Torch", "The Thing", "Invisible Man"],
//        ["When did the first TV series based on Marvel characters debut?", "1951", "1959", "1966", "1971", "1966"],
//        ["Who is the alter ego of Captain America?", "Robert Samuels", "Clark Kent", "Joe Simons", "Steve Rogers", "Steve Rogers"],
//        ["What species is the Hulk?", "Human Gamma Mutate", "New Mutate", "Beta Mutate", "Savage Land Mutate", "Human Gamma Mutate"]
//    ]
//    
//    var science = [
//        ["What is the 32nd element?", "Gold", "Gallium", "Germanium", "Gadolinium", "Germanium"],
//        ["What is the least common blood type?", "AB-", "O+", "B-", "AB+ ", "AB-"],
//        ["How many bones are in the body at birth?", "190", "230", "270", "310", "270"]
//    ]
    
    let cellIdentifier = "CellIdentifier"

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as UITableViewCell?
        cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellIdentifier)

        let image = UIImage(named: "icon")
        cell!.imageView?.image = image
        
//        let quiz = quizzes[indexPath.row]
//        cell!.textLabel?.text = quiz.0
//        cell!.detailTextLabel?.text = quiz.1

        let title = quizzes[indexPath.row]["title"] as? String
        let desc = quizzes[indexPath.row]["desc"] as? String
        
        cell!.textLabel?.text = title
        cell!.detailTextLabel?.text = desc
        

        return cell!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var selectedQuiz = ""
    
    var selectedQ = [NSDictionary]()
    
    var quizPicked = [Array<String>()]
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       // let currCell = tableView.cellForRowAtIndexPath(indexPath)
        selectedQ = (quizzes[indexPath.row]["questions"] as? [NSDictionary])!
     
        quizPicked.removeAll()

        
  //      selectedQuiz = (currCell?.textLabel?.text)!
        
        
        // this is where we will look at the array and put all the questions and answers together...
    
        
        for var i = 0; i < selectedQ.count; i++ {
            var currSet = Array<String>()
            
            let curQ = (selectedQ[i]["text"])!
            let curChoices = (selectedQ[i]["answers"])!
            
            currSet.append(curQ as! String)
            
            for var j = 0; j < curChoices.count; j++ {
                currSet.append(curChoices[j] as! String)
            }
            
            let answerIndex = ((selectedQ[i]["answer"])!).integerValue
            let answer1 = (curChoices[answerIndex - 1])!
            
            currSet.append(answer1 as! String)

            quizPicked.append(currSet)
        }
        
        
        
        self.performSegueWithIdentifier("ShowQuestion", sender: nil)
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? QuestionViewController {
            vc.quiz = quizPicked
//            switch selectedQuiz {
//                case "Mathematics":
//                    vc.quiz = mathematics
//                case "Marvel Super Heroes":
//                    vc.quiz = marvel
//                case "Science":
//                    vc.quiz = science
//            default:
//                vc.quiz = []
//            }
        }
    }
    
    @IBAction func exit(segue : UIStoryboardSegue) {
        self.tableView.reloadData()
    }
}