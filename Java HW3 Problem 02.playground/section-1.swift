// Playground - noun: a place where people can play

import UIKit

//Problem 02: Generate three letter words
let characters: [String] = ["a", "b", "c", "d"]
for firstChar in characters {
    for secondChar in characters {
        for thirdChar in characters {
            let combination = firstChar + secondChar + thirdChar
            println(combination)
        }
    }
}