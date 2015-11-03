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
        ("Mathematics", "Mathematics description"),
        ("Marvel Super Heroes", "Marvel Super Heroes description"),
        ("Science", "Science description")
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


}