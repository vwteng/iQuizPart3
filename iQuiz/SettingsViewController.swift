//
//  SettingsViewController.swift
//  iQuizPart3
//
//  Created by Vivian on 11/17/15.
//  Copyright © 2015 Vivian. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var urlTextField: UITextField!
    
    var quizzes = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.urlTextField.text = "http://tednewardsandbox.site44.com/questions.json"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func downloadQuestions(sender: AnyObject) {
        let newURL = self.urlTextField.text
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        let URL = NSURL(string: newURL!)
        let request = NSMutableURLRequest(URL: URL!)
        request.HTTPMethod = "GET"
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            do {
                self.quizzes = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! [AnyObject]
            } catch {
                print("There was an error...")
            }
        }
        task.resume()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? ViewController {
            vc.quizzes = quizzes
        }
    }
    
}
