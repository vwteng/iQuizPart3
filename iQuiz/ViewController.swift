//
//  ViewController.swift
//  iQuiz
//
//  Created by Vivian on 11/1/15.
//  Copyright © 2015 Vivian. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var quizzes = [
        ("Mathematics", "Answer some math problems"),
        ("Marvel Super Heroes", "Test your knowledge of super heroes"),
        ("Science", "Questions about science")
    ]
    
    var mathematics = [
        ["What is 4 + 3?", "1", "5", "7", "12", "7"],
        ["What is 12 * 10?", "0", "2", "100", "120", "120"],
        ["What is 50% of 44?", "11", "22", "33", "44", "22"],
        ["What is 1934.01 * 0?", "0", "10.5", "200.01", "9999", "0"]
    ]
    
    var marvel = [
        ["MarvelQuestion1", "MarvelChoice 1", "Choice 2", "Choice 3", "Choice 4", "Answer #"],
        ["MarvelQuestion2", "MarvelChoice 1", "Choice 2", "Choice 3", "Choice 4", "Answer #"],
        ["MarvelQuestion3", "MarvelChoice 1", "Choice 2", "Choice 3", "Choice 4", "Answer #"],
        ["MarvelQuestion4", "MarvelChoice 1", "Choice 2", "Choice 3", "Choice 4", "Answer #"]
    ]
    
    var science = [
        ["Question1", "Choice 1", "Choice 2", "Choice 3", "Choice 4", "Answer #"],
        ["Question2", "Choice 1", "Choice 2", "Choice 3", "Choice 4", "Answer #"],
        ["Question3", "Choice 1", "Choice 2", "Choice 3", "Choice 4", "Answer #"],
        ["Question4", "Choice 1", "Choice 2", "Choice 3", "Choice 4", "Answer #"]
    ]
    
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
        
        let quiz = quizzes[indexPath.row]
        cell!.textLabel?.text = quiz.0
        cell!.detailTextLabel?.text = quiz.1
        
        return cell!
    }
    
    @IBAction func settings(sender: UIBarButtonItem) {
        let controller = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        controller.addAction(okAction)
        self.presentViewController(controller, animated: true, completion:nil)
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let currCell = tableView.cellForRowAtIndexPath(indexPath)
        selectedQuiz = (currCell?.textLabel?.text)!
        self.performSegueWithIdentifier("ShowQuestion", sender: nil)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? QuestionViewController {
            switch selectedQuiz {
                case "Mathematics":
                    vc.quiz = mathematics
                case "Marvel Super Heroes":
                    vc.quiz = marvel
                case "Science":
                    vc.quiz = science
            default:
                vc.quiz = []
            }
        }
    }
    
}