// Playground - noun: a place where people can play

import UIKit

//Problem 01: Rectangle area
let a = 20
let b = 5
let area = a * b
println(area)

//Problem 02: Triangle Area
let pointA: (x: Int, y: Int) = (-5, 10)
let pointB: (x: Int, y: Int) = (25, 30)
let pointC: (x: Int, y: Int) = (60, 15)

var triangleArea: Double = (Double)(pointA.x * (pointB.y - pointC.y))
triangleArea += (Double)(pointB.x * (pointC.y - pointA.y))
triangleArea += (Double)(pointC.x * (pointA.y - pointB.y))
triangleArea = triangleArea / 2
println(abs(triangleArea))


