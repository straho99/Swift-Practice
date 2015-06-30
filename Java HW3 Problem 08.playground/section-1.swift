// Playground - noun: a place where people can play

import Cocoa

//Problem 08: Sum numbers from a text file
var str = "Hello, playground"

// get URL to the the documents directory in the sandbox
let documentsUrl = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0] as NSURL

// add a filename
let fileUrl = documentsUrl.URLByAppendingPathComponent("input.txt")

// write to it
str.writeToURL(fileUrl, atomically: true, encoding: NSUTF8StringEncoding, error: nil)

let x = 5 * 4

let content = String.stringWithContentsOfFile(fileUrl, encoding: NSUTF8StringEncoding, error: nil)

