//
//  ViewController.swift
//  Java HW4 Problem 05-08
//
//  Created by Strahil Ruychev on 10/15/14.
//  Copyright (c) 2014 strahor. All rights reserved.
//

import UIKit
import Foundation

extension String {
    func rangesOfString(findStr:String) -> [Range<String.Index>] {
        var arr = [Range<String.Index>]()
        var startInd = self.startIndex
        // check first that the first character of search string exists
        if contains(self, first(findStr)!) {
            // if so set this as the place to start searching
            startInd = find(self,first(findStr)!)!
        }
        else {
            // if not return empty array
            return arr
        }
        var i = distance(self.startIndex, startInd)
        while i<=countElements(self)-countElements(findStr) {
            if self[advance(self.startIndex, i)..<advance(self.startIndex, i+countElements(findStr))] == findStr {
                arr.append(Range(start:advance(self.startIndex, i),end:advance(self.startIndex, i+countElements(findStr))))
                i = i+countElements(findStr)
            }
            i++
        }
        return arr
    }
}


class ViewController: UIViewController {

    
    @IBOutlet weak var outputField: UITextView!
    @IBOutlet weak var inputField: UITextField!




    override func viewDidLoad() {
        super.viewDidLoad()
        outputField.text = ""
        var myColor : UIColor = UIColor.redColor()
        outputField.layer.borderColor = myColor.CGColor
        inputField.layer.borderColor = myColor.CGColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

   
    @IBAction func inputTouched(sender: AnyObject) {
        inputField.text = ""
    }

    //Problem 05: Count all words in a text
    @IBAction func countWordsPressed(sender: AnyObject) {
        let input = inputField.text
        var words = Array<String>()
        let regExpression = NSRegularExpression(pattern: "\\W+", options: nil, error: nil)!
        let strangeSeparator = "GloryGloryManUnited"
        let modifiedInput = regExpression.stringByReplacingMatchesInString(input, options: NSMatchingOptions(),
            range: NSMakeRange(0, countElements(input)), withTemplate: strangeSeparator)
        words = modifiedInput.componentsSeparatedByString(strangeSeparator)
        for var i = 0; i < countElements(words); i++ {
            if words[i] == "" {
                words.removeAtIndex(i)
            }
        }
        var output = ""
        for word in words {
            output += word + "-"
        }
        outputField.text = "\(words.count)"
    }

    //Problem 06: Count a specific word (given at the second line of the output field)
    @IBAction func countAWordPressed(sender: AnyObject) {
        let input = outputField.text.lowercaseString
        let lines = input.componentsSeparatedByString("\n")
        let text = lines[0]
        let word = lines[1]
        var words = Array<String>()
        let regExpression = NSRegularExpression(pattern: "\\W+", options: nil, error: nil)!
        let strangeSeparator = "GloryGloryManUnited"
        let modifiedInput = regExpression.stringByReplacingMatchesInString(text, options: NSMatchingOptions(),
            range: NSMakeRange(0, countElements(text)), withTemplate: strangeSeparator)
        words = modifiedInput.componentsSeparatedByString(strangeSeparator)
        for var i = 0; i < countElements(words); i++ {
            if words[i] == "" {
                words.removeAtIndex(i)
            }
        }
        var count = 0
        for oneWord in words {
            if oneWord == word {
                count++
            }
        }
        outputField.text = "\(count)"
    }

    //Problem 07: Count occurences of a given substring
    @IBAction func substringOccurencesPressed(sender: AnyObject) {
        let input = outputField.text.lowercaseString
        let lines = input.componentsSeparatedByString("\n")
        let text = lines[0] as NSString
        let word = lines[1] as NSString
        var count = 0
        var start: Int = 0
        var length: Int = text.length
        var searchedRange = NSMakeRange(start, length)
        var rangeFound = text.rangeOfString(word, options: nil, range: searchedRange, locale: nil)
        while rangeFound.length > 0 {
            count++
            start = rangeFound.location + 1
            length = text.length - start
            searchedRange = NSMakeRange(start, length)
            rangeFound = text.rangeOfString(word, options: nil, range: searchedRange, locale: nil)
        }
        inputField.text = "Occurences found = \(count)"
    }

    //Problem 08: Extract emails
    
    @IBAction func extractEmailsPressed(sender: AnyObject) {
        let input = outputField.text as NSString
        let emailPattern="\\w+[-_.]?\\w+@[a-zA-Z]+(-)?(\\.[a-zA-Z]+)+"
        let regExpression = NSRegularExpression(pattern: emailPattern, options: nil, error: nil)!
        let matches = regExpression.matchesInString(input, options: nil, range: NSMakeRange(0, input.length))
        var output = ""
        for match in matches {
            output += input.substringWithRange(match.range) + ", "
        }
        var index = output.endIndex
        index = advance(index, -2)
        output = output.substringToIndex(index)
        inputField.text = output
    }

}

