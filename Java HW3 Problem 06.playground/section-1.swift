// Playground - noun: a place where people can play

import UIKit

//Problem 06: Random hands of 5 cards
var faces = [String] (count: 13, repeatedValue: "")
var suits = [String] (count: 4, repeatedValue: "")
suits[0] = "\u{2663}"
suits[1] = "\u{2666}"
suits[2] = "\u{2665}"
suits[3] = "\u{2660}"
for (var i = 0; i < 9; i++) {
    faces[i] = String(i+2);
}
faces[9]="J";
faces[10]="Q";
faces[11]="P";
faces[12]="A";

func randomInt(min: Int, max:Int) -> Int {
    return min + Int(arc4random_uniform(UInt32(max - min + 1)))
}

func doesCardExist(card: (face: String, suit: String), faces: [String], suits: [String]) -> Bool {
    var result = false
    for (index, value) in enumerate(faces) {
        if value == card.face && suits[index] == card.suit {
            return true
        }
    }
    return result
}

var handFaces = [String]()
var handSuits = [String]()
let numberOfHands = 5
var hand: String = ""
for index in 1...5 {
    while handFaces.count < 5 {
        let randomFace = randomInt(0, 12)
        let randomSuite = randomInt(0, 3)
        if !doesCardExist((String(randomFace), String(randomSuite)), handFaces, handSuits) {
            handFaces.append(String(randomFace))
            handSuits.append(String(randomSuite))
            hand += faces[randomFace] + suits[randomSuite] + " "
        }
    }
    println(hand)
    hand=""
    handFaces=[]
    handSuits=[]
}

