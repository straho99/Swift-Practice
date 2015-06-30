// Playground - noun: a place where people can play

import UIKit

//Problem 07: Days between two dates
class Date {

    class func from(#year:Int, month:Int, day:Int) -> NSDate {
        var c = NSDateComponents()
        c.year = year
        c.month = month
        c.day = day

        var gregorian = NSCalendar(identifier:NSGregorianCalendar)
        var date = gregorian.dateFromComponents(c)
        return date!
    }

    class func parse(dateStr:String, format:String="yyyy-MM-dd") -> NSDate {
        var dateFmt = NSDateFormatter()
        dateFmt.timeZone = NSTimeZone.defaultTimeZone()
        dateFmt.dateFormat = format
        return dateFmt.dateFromString(dateStr)!
    }
}

var startDate = Date.from(year: 2014, month: 1, day: 15)
let endDate = Date.from(year: 2014, month: 1, day: 30)
var daysCount = 0
var dateComparisionResult:NSComparisonResult = startDate.compare(endDate)
while dateComparisionResult == NSComparisonResult.OrderedAscending {
    startDate = startDate.dateByAddingTimeInterval(60 * 60 * 24)
    dateComparisionResult = startDate.compare(endDate)
    daysCount++
}
println(daysCount)