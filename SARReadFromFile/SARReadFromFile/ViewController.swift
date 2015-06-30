//
//  ViewController.swift
//  SARReadFromFile
//
//  Created by Strahil Ruychev on 10/9/14.
//  Copyright (c) 2014 strahor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var textField: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        

        //Problem 08: Sum numbers from a text file
        var filePath = NSBundle.mainBundle().pathForResource("input", ofType:"txt")
        var bytes = NSData(contentsOfFile:filePath!)
        let content = NSString(data: bytes!, encoding: NSUTF8StringEncoding) as String
        //println(content)

        let splitContent = content.componentsSeparatedByString("\n")
        var sum = 0
        for member in splitContent {
            sum += member.toInt()!
        }
        //println("The sum of all numbers in the file = \(sum)")
        sumLabel.text = "The sum of all numbers in the file = \(sum)"
        let products = readProducts()
        var text = ""
        for price in products.keys {
            text += "Product name: \(products[price]!); price: \(price)\n"
        }
        //textField.text = text

        var sortedPrices = Array<Double>()
        for price in products.keys {
            sortedPrices.append(price)
        }
        sortedPrices.sort { $0 < $1 }
        text = "List of products:\n"
        for price in sortedPrices {
            text += "\(price) \(products[price]!)\n"
        }
        //textField.text = text

        let orders = readOrders()

        text += "\nList of orders:\n"
        for price in orders.keys {
            text += "\(price) \(orders[price]!)\n"
        }

        var orderTotal = 0.0
        for quantity in orders.keys {
            for price in products.keys {
                if products[price] == orders[quantity] {
                    orderTotal += quantity * price
                    println("\(price) - \(quantity)")
                }
            }
        }

        text += "Total ammount of order: \(orderTotal) BGN"
        textField.text=text
    }

    func readProducts() -> Dictionary<Double, String> {
        var filePath = NSBundle.mainBundle().pathForResource("products", ofType:"txt")
        var bytes = NSData(contentsOfFile:filePath!)
        let content = NSString(data: bytes!, encoding: NSUTF8StringEncoding) as String
        var products = Dictionary<Double, String>()
        let splitContent = content.componentsSeparatedByString("\n")
        for product in splitContent {
            var members = product.componentsSeparatedByString(" ")
            let name = members[0]
            let price = Double((members[1] as NSString).doubleValue)
            products[price] = name
        }
        return products
    }

    func readOrders() -> Dictionary<Double, String> {
        var filePath = NSBundle.mainBundle().pathForResource("orders", ofType:"txt")
        var bytes = NSData(contentsOfFile:filePath!)
        let content = NSString(data: bytes!, encoding: NSUTF8StringEncoding) as String
        var orders = Dictionary<Double, String>()
        let splitContent = content.componentsSeparatedByString("\n")
        for line in splitContent {
            var members = line.componentsSeparatedByString(" ")
            let name = members[1]
            let quantity = Double((members[0] as NSString).doubleValue)
            orders[quantity] = name
        }
        return orders
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

