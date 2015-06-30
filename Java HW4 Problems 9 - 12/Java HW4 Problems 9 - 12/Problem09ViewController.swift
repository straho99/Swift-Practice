//
//  FirstViewController.swift
//  Java HW4 Problems 9 - 12
//
//  Created by Strahil Ruychev on 10/20/14.
//  Copyright (c) 2014 strahor. All rights reserved.
//

import UIKit

class Problem09ViewController: UIViewController {

    @IBOutlet weak var outputTextField: UITextView!
    @IBOutlet weak var inputTextField: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func combineButtonPressed(sender: AnyObject) {
        let inputText = inputTextField.text
        let lines = inputText.componentsSeparatedByString("\n")
        var firstList = lines[0].componentsSeparatedByString(" ")
        let secondList = lines[1].componentsSeparatedByString(" ")
        var thirdList = Array<String>()
        for letter in secondList {
            if !contains(firstList, letter) {
                thirdList.append(letter)
            }
        }
        for letter in thirdList {
            firstList.append(letter)
        }
        var output = ""
        for letter in firstList {
            output += letter + " "
        }
        outputTextField.text = output
    }

}

