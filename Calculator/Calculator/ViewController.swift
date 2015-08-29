//
//  ViewController.swift
//  Calculator
//
//  Created by Nagarajan on 8/26/15.
//  Copyright © 2015 MotleyTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var op: Int = 0
    var startWithZero: Bool = true
    var operand: Int = 0


    @IBOutlet weak var display: UILabel!

    @IBAction func numPress(sender: AnyObject) {

        if startWithZero {
            display.text = "0"
            startWithZero = false
        }

        var result: Int = Int(display.text!)!

        result = result * 10 + sender.tag!
        display.text = "\(result)"
    }

    @IBAction func clearPressed(sender: AnyObject) {
        display.text = "0"
    }

    func calculateResult(operation operation: Int) -> Int {
        let currVal = Int(display.text!)!
        var result = 0

        switch operation {
        case 1:
            result = operand * currVal
            break

        case 2:
            result = operand / currVal
            break

        case 3:
            result = operand + currVal
            break

        case 4:
            result = operand - currVal
            break
        default:
            result = 0
            break
        }
        return result
    }

    @IBAction func opPressed(sender: AnyObject) {
        if op != 0 {
            operand = calculateResult(operation: op)
            display.text = "\(operand)"
        } else {
            op = sender.tag
            operand = Int(display.text!)!
        }
        op = sender.tag
        startWithZero = true
    }

    @IBAction func equalsPressed(sender: AnyObject) {
        operand = calculateResult(operation: op)
        display.text = "\(operand)"
        startWithZero = true
        op = 0
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        startWithZero = true
        operand = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

