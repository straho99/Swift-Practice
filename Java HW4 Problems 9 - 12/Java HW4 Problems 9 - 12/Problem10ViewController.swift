//
//  SecondViewController.swift
//  Java HW4 Problems 9 - 12
//
//  Created by Strahil Ruychev on 10/20/14.
//  Copyright (c) 2014 strahor. All rights reserved.
//

import UIKit

class Problem10ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextView!
    @IBOutlet weak var outputTextField: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func extractButtonPressed(sender: AnyObject) {
        let inputText = inputTextField.text as NSString
        let pattern = "\\w+"
        let regex = NSRegularExpression(pattern: pattern, options: nil, error: nil)!
        let matches = regex.matchesInString(inputText, options: nil, range: NSMakeRange(0, inputText.length))
        var uniqueWords = Array<String>()
        for match in matches {
            let word = inputText.substringWithRange(match.range)
            if !contains(uniqueWords, word) {
                uniqueWords.append(word)
            }
        }
        var output = ""
        for word in uniqueWords {
            output += word + " "
        }
        outputTextField.text = output
    }

}

