// Playground - noun: a place where people can play

import UIKit

//Problem 05: Angle unit converter
let angles: [String] = ["180 deg", "90 deg", "3 rad"]
let pi = 3.14159
for angle in angles {
    var index = advance(angle.endIndex, -3)
    let unit = angle.substringFromIndex(index)
    index = advance(index, -1)
    let value = angle.substringToIndex(index)
    //println(value)
    //println(unit)
    if unit=="deg" {
        let result = (Double(value.toInt()!) * pi) / 180
        println("\(result) rad")
    }
    else {
        let otherResult = (Double(value.toInt()!) * 180) / pi
        println("\(otherResult) deg")
    }
}


