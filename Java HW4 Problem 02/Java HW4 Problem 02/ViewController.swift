//
//  ViewController.swift
//  Java HW4 Problem 02
//
//  Created by Strahil Ruychev on 10/14/14.
//  Copyright (c) 2014 strahor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputField: UITextView!
    @IBOutlet weak var inputField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        outputField.text = "Results will be printed here."
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func inputTouched(sender: AnyObject) {
        inputField.text = ""
    }
    
    //Problem 02: Sequences of equal strings
    @IBAction func buttonPressed(sender: AnyObject) {
        let input = inputField.text
        let words = input.componentsSeparatedByString(" ")
        var sequences = Array<String>()
        sequences.append(words[0])
        for var i = 1; i < countElements(words); i++ {
            if words[i] == words [i-1] {
                var temp = sequences.last!
                temp += " " + words[i]
                sequences.removeLast()
                sequences.append(temp)
            }
            else {
                sequences.append(words[i])
            }
        }
        var output = ""
        for sequence in sequences {
            output += sequence + "\n"
        }
        outputField.text = output
    }

    //Problem 03: Largest sequence of equal strings
    @IBAction func largestSequencePressed(sender: AnyObject) {
        let input = inputField.text
        let words = input.componentsSeparatedByString(" ")
        var sequences = Array<String>()
        sequences.append(words[0])
        for var i = 1; i < countElements(words); i++ {
            if words[i] == words [i-1] {
                var temp = sequences.last!
                temp += " " + words[i]
                sequences.removeLast()
                sequences.append(temp)
            }
            else {
                sequences.append(words[i])
            }
        }
        var maxSequence = ""
        var maxSequenceLength = 0
        for sequence in sequences {
            let members = sequence.componentsSeparatedByString(" ")
            let currentCount = members.count
            if currentCount > maxSequenceLength {
                maxSequence = sequence
                maxSequenceLength = currentCount
            }
        }
        outputField.text = maxSequence
    }

    //Problem 04: Largest sequence of increasing numbers
    @IBAction func largestIncreasingSequencePressed(sender: AnyObject) {
        let input = inputField.text
        let words = input.componentsSeparatedByString(" ")
        var numbers = Array<Int>()
        for word in words {
            let number = word.toInt()!
            numbers.append(number)
        }
        var increasingSequences = Array<Array<Int>>()
        var currentSequence = Array<Int>()
        currentSequence.append(numbers[0])
        for var i = 1; i < countElements(numbers); i++ {
            if numbers[i] > numbers[i-1] {
                currentSequence.append(numbers[i])
                if i == countElements(numbers) - 1 {
                    increasingSequences.append(currentSequence)
                }
            }
            else {
                increasingSequences.append(currentSequence)
                currentSequence.removeAll(keepCapacity: false)
                currentSequence.append(numbers[i])
            }
        }
        var output = ""
        var indexLongest = 0
        var maxLength = 0
        for var i = 0; i < countElements(increasingSequences); i++ {
            var currentLength = increasingSequences[i].count
            if currentLength > 1 {
                for number in increasingSequences[i] {
                    output += "\(number) "
                }
                output += "\n"
                if currentLength > maxLength {
                    indexLongest = i
                    maxLength = currentLength
                }
            }
        }
        output += "Longest: "
        for number in increasingSequences[indexLongest] {
            output += "\(number) "
        }
        outputField.text = output
    }
}

