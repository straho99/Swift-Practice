// Playground - noun: a place where people can play

import UIKit

extension String {
    subscript (i: Int) -> String {
      return String(Array(self)[i])
    }
}

//Problem 01: Symetric numbers in range
let start = 555
let end = 777
for var i = start; i <= end; i++ {
    let stringNumber = String(i)
    if countElements(stringNumber) == 1 {
        print(stringNumber + " ")
    }
    else if countElements(stringNumber) == 2 {
        if stringNumber[0] == stringNumber[1] {
            print(stringNumber + " ")
        }
    }
    else {
        if stringNumber[0] == stringNumber[2] {
            print(stringNumber + " ")
        }
    }
}
