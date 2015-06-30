// Playground - noun: a place where people can play

import Cocoa

//Problem 08: Sum numbers from a text file
let bundle = NSBundle.mainBundle()
let path = bundle.pathForResource("input", ofType: "txt")
let content = NSString.stringWithContentsOfFile(path) as String

println(content) // prints the content of data.txt
