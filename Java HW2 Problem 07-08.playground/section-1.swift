// Playground - noun: a place where people can play

import UIKit
extension String {
    subscript (i: Int) -> String {
      return String(Array(self)[i])
    }
}

//Problem 07: Count of bits one
func convertToBinary(number: Int) -> String {
    var result: String = ""    var remainder = number    var bit = 0    while (remainder > 0)    {        bit = remainder - (remainder / 2) * 2;        remainder = remainder / 2;        result = String(bit) + result    }
    return result
}

let numbers: [Int] = [5, 0, 15, 5343, 62241, 17263]
var count = 0
for number in numbers {
    let binaryRepresentation = convertToBinary(number)
    for character in binaryRepresentation {
        if character == "1" {
            count++
        }
    }
    println("Count of 1 bits in integer \(number) = \(count)")
    count = 0
}

//Problem 08: Count of equal bit pairs
//I use numbers array from the previous problem as input data.
//As well as the count variable.
println()
count = 0
for number in numbers {
    let binary = convertToBinary(number)
    for var i = 1; i < countElements(binary); i++ {
        if binary[i] == binary[i-1] {
            count++
        }
    }
    println("Count of equal bit pairs in integer \(number) = \(count)")
    count = 0
}
