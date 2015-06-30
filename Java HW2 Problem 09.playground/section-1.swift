// Playground - noun: a place where people can play

import UIKit

//Problem 09: Points inside a house?

let thePoints: [(X: Double, Y: Double)] = [(10, 9.7), (11.6, 7), (12.5, 6), (17.5, 13.5), (23, 7.5), (21.45, 9.7)]

func isInsideRectangle(point: (X: Double, Y: Double), left: Double, right: Double, top: Double, bottom: Double) -> Bool {
    if point.X >= left && point.X <= right && point.Y >= top && point.Y <= bottom {
            return true
    }
    else {
            return false
    }
}

func BelowLine(point: (X: Double, Y: Double), a: (X: Double, Y: Double), b: (X: Double, Y: Double)) -> Double {
    var result = (b.X - a.X) * (point.Y - a.Y);
    result = result - (b.Y - a.Y) * (point.X - a.X);
    return result;
}

func IsInsideRoof(point: (X: Double, Y: Double)) -> Bool {
    var inside = false
    let a: (Double, Double) = (12.5, 8.5)
    let b: (Double, Double) = (17.5, 3.5)
    let c: (Double, Double) = (22.5, 8.5)
    let leftSidePosition = BelowLine(point, a, b)
    let rightSidePosition = BelowLine(point, b, c)
    if (leftSidePosition >= 0 && rightSidePosition >= 0 && point.Y <= 8.5) {
        inside = true;
    }

    return inside;
}

func isInsideHouse(point: (X: Double, Y: Double)) -> Bool {
    var inside = false
    inside = IsInsideRoof(point) ||
            isInsideRectangle(point, 12.5, 17.5, 8.5, 13.5) ||
            isInsideRectangle(point, 20, 22.5, 8.5, 13.5)
    return inside;
}

for point in thePoints {
    if isInsideHouse(point) {
        println("Inside")
    }
    else {
        println("Outside")
    }
}
