// Playground - noun: a place where people can play

import UIKit

//Problem 03: Full House
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
var fullHouse = "";
//Generate all combinations with lots and lots of nested loops:
var fullHouseCount=0;
//the first 4 loops generate the combinations for the 3 cards of the first face:
for (var firstFace = 0; firstFace < 13; firstFace++) {
    for (var i = 0; i < 2; i++) {
        for (var j = i+1; j < 3; j++) {
            for (var j2 = j+1; j2 < 4; j2++) {
                //with the next 3 loops we generate combinations for the 2 cards of the second face
                for (var secondFace = 0; secondFace < 13; secondFace++) {
                    if (firstFace==secondFace) {
                        continue; //must be different faces...
                    }
                    
                    for (var k = 0; k < 3; k++) {
                        for (var m = k+1; m < 4; m++) {
                            fullHouse=faces[firstFace] +  suits[i] + " " + faces[firstFace] + suits[j] 
                                    + " " + faces[firstFace] + suits[j2] + " " + faces[secondFace] + suits[k] 
                                + " " + faces[secondFace] +  suits[m]
                            fullHouseCount++;
                            println(fullHouse)
                        }
                    }
                }
            }
        }
    }
}
println("Total count of full houses found = \(fullHouseCount)")


