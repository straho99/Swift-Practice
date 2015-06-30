//
//  Problem11ViewController.swift
//  Java HW4 Problems 9 - 12
//
//  Created by Strahil Ruychev on 10/21/14.
//  Copyright (c) 2014 strahor. All rights reserved.
//

import UIKit

class Problem11ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextView!
    
    @IBOutlet weak var outputTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func findButtonPressed(sender: AnyObject) {
        let inputText = inputTextField.text.lowercaseString as NSString
        let pattern = "\\w+"
        let regex = NSRegularExpression(pattern: pattern, options: nil, error: nil)!
        let matches = regex.matchesInString(inputText, options: nil, range: NSMakeRange(0, inputText.length))
        var words = Dictionary<String, Int>()
        for match in matches {
            let word = inputText.substringWithRange(match.range)
            if let count = words[word] {
                words[word] = count + 1
            }
            else {
                words[word] = 1
            }
        }
        var maxFrequency: Int = 0
        var mostFrequentWord = ""
        var keys = Array(words.keys)
        keys.sort() { $0 < $1 }
        for word in words.keys {
            if words[word] > maxFrequency {
                maxFrequency = words[word]!
            }
        }
        var output = ""
        for key in keys {
            if words[key] == maxFrequency {
                output += "\(key) -> \(words[key]!) times\n"
            }
        }
        outputTextField.text = output

    }

}
