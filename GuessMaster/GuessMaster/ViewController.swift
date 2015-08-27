//
//  ViewController.swift
//  GuessMaster
//
//  Created by Nagarajan on 8/25/15.
//  Copyright © 2015 MotleyTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quesLabel: UILabel!
    @IBOutlet weak var answerText: UITextField!

    var question: Int = 0

    @IBAction func nextButton(sender: AnyObject) {
        if question == 1 {
            quesLabel.text = "Think of a number"
            answerText.text = ""
            answerText.hidden = true
            sender.setTitle("Next", forState: UIControlState.Normal)
        } else if question == 2 {
            quesLabel.text = "Multiply it with 5"
        } else if question == 3 {
            quesLabel.text = "Now add 5 to the total"
        } else if question == 4 {
            quesLabel.text = "Multiply the answer with 2"
        } else if question == 5 {
            quesLabel.text = "Now add 2 to the total"
        } else if question == 6 {
            quesLabel.text = "What is the total?"
            answerText.hidden = false
        } else if question == 7 {
            if answerText.text != "" {
                let input: Int = Int(answerText.text!)!
                let num = ((input - 2)/2 - 5)/5
                quesLabel.text = "Your number was \(num)"
                sender.setTitle("Play again?", forState: UIControlState.Normal)
            } else {
                let alert = UIAlertController(title: "Oops", message: "Please provide total", preferredStyle: .Alert)

                alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
            self.view.endEditing(true)
        }

        question += 1

        if question > 7 {
            question = 1
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        self.quesLabel.text = "Play?"
        self.answerText.text = ""
        self.answerText.hidden = true
        question = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }


}

