//
//  ViewController.swift
//  Java HW4 Problem 01
//
//  Created by Strahil Ruychev on 10/14/14.
//  Copyright (c) 2014 strahor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextView!
    @IBOutlet weak var outputTextField: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.text=""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        let input = inputTextField.text
        var stringArray = input.componentsSeparatedByString(" ")
        var numbers = Array<Int>()
        for number in stringArray {
            numbers.append(number.toInt()!)
        }
        numbers.sort() {$0 < $1}
        var resultString = ""
        for number in numbers {
            resultString += "\(number) "
        }
        outputTextField.text = resultString
    }

}

