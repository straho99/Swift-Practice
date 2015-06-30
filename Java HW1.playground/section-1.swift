// Playground - noun: a place where people can play

import UIKit
//Problem 03: Print your hometown:
let myTown = "Blagoevgrad"
println("My hometown is \(myTown)")


//Problem 05: Print the current date and time:
let currentDate = NSDate()
println(currentDate)


//Problem 06: Sum Two Numbers:
let firstNumber: Int = 2
let secondNumber: Int = 45
println("The sum of the two numbers = \(firstNumber + secondNumber)")


//Problem 08: Sort Array of Strings:
var stringArray = ["Gogo", "Tosho", "Ani", "Petko", "Misho", "Bobi"]
stringArray.sort { $0 < $1 }
for member in stringArray {
    println(member)
}


//Problem 09: Generate cards:
let faces: [String] = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
let suits: [String] = ["\u{2663}", "\u{2666}", "\u{2665}", "\u{2660}"]
for var i=0; i<faces.count; i++ {
    var line: String = ""
    for var j=0; j<suits.count; j++ {
        line = line + faces[i] + suits[j] + " "
    }
    println(line)
}

