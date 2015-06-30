// Playground - noun: a place where people can play

import UIKit
//Problem 03: Points inside a figure:
let thePoints: [(X: Double, Y: Double)] = [(10, 9.7), (11.6, 7), (12.5, 6), (17.5, 13.5), (23, 7.5)]

func isInsideRectangle(point: (X: Double, Y: Double), left: Double, right: Double, top: Double, bottom: Double) -> Bool {
    if point.X >= left && point.X <= right && point.Y >= top && point.Y <= bottom {
            return true
    }
    else {
            return false
    }
}

for point in thePoints {
    if isInsideRectangle(point, 12.5, 22.5, 6.0, 8.5) ||
        isInsideRectangle(point, 12.5, 17.5, 8.5, 13.5) ||
        isInsideRectangle(point, 20, 22.5, 8.5, 13.5) {
            println("Inside")
    }
    else {
        println("Outside")
    }
}

//Problem 04: The smallest of three numbers
let numbers: [Int] = [2, 5, -1]
var minNumber: Int = Int.max
for number in numbers {
    if number < minNumber {
        minNumber=number
    }
}
println(minNumber)
let test = min(2, 3, -3)

//Problem 5: Decimal to Hexadecimal
let decimalNumber = 6779
var hexadecimal = NSString(format:"%2X", decimalNumber)

//Problem 06: Formatting numbers

func convertToBinary(number: Int) -> String {
    var result: String = ""    var remainder = number    var bit = 0    while (remainder > 0)    {        bit = remainder - (remainder / 2) * 2;        remainder = remainder / 2;        result = String(bit) + result    }
    if countElements(result) < 10 {
        for var i = 0; i <= 10 - countElements(result); i++ {
            result = "0" + result
        }
    }
    return result
}

let a = 254
let b = 11.6
let c = 0.5
var output: String = ""
output = String(format:"|%-10X|", a)
output += convertToBinary(a) + "|"
output += String(format: "%10.2f|", b)
output += String(format: "%-10.3f|", c)



