//
//  Problem12ViewController.swift
//  Java HW4 Problems 9 - 12
//
//  Created by Strahil Ruychev on 10/21/14.
//  Copyright (c) 2014 strahor. All rights reserved.
//

import UIKit
import Foundation

class Problem12ViewController: UIViewController {

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
    

    @IBAction func calculatePressed(sender: AnyObject) {
        let input = inputTextField.text
        var cards = input.componentsSeparatedByString(" ")
        var faces = Dictionary<String, Int>()
        for card in cards {
            let start = card.startIndex
            let end = advance(start, countElements(card) - 1)
            let face = card.substringWithRange(Range<String.Index>(start: start, end: end))
            if let count = faces[face] {
                faces[face] = count + 1
            }
            else {
                faces[face] = 1
            }
        }
        let totalCards = cards.count
        var output = ""
        for face in faces.keys {
            let frequency = (Double(faces[face]!) / Double(totalCards)) * 100
            output += String(format: "%@ -> %.2f%%\n", face, frequency)
        }
        outputTextField.text = output
    }

}
