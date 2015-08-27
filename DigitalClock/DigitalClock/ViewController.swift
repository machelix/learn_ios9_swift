//
//  ViewController.swift
//  DigitalClock
//
//  Created by Nagarajan on 8/24/15.
//  Copyright © 2015 MotleyTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currTimeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        currTimeLabel.text = "--:--:--"
        _ = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("updateClock"), userInfo: nil, repeats: true)
        self.updateClock()
    }

    func get2CharField(tval: Int) -> NSString {
        let result = tval > 9 ? "\(tval)" : "0\(tval)"
        return result
    }

    func updateClock() {
        let date = NSDate()

        let calendar = NSCalendar.currentCalendar()

        let components = calendar.components([.Hour, .Minute, .Second], fromDate: date)
        let hours = self.get2CharField(components.hour)
        let minutes = self.get2CharField(components.minute)
        let seconds = self.get2CharField(components.second)

        let timeStr = "\(hours):\(minutes):\(seconds)"

        currTimeLabel.text = timeStr

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

