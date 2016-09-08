//
//  File.swift
//  Checkout
//
//  Created by Stephen Flores on 11/28/15.
//  Copyright © 2015 Stephen Flores. All rights reserved.
//

import Foundation


// Function Library


/****** Global functions (Like a libary I suppose) ******/


// Add tax to a subtotal. Returns total including tax
func addTax(_ subtotal: Double, taxRate: Double) -> Double {
    return (subtotal + (subtotal * taxRate))
}


// Rounds a double to two decimal points (really only for the final total). Returns rounded value.
func roundToTwo(_ n: Double) -> Double {
    // Multiply by 100
    // Truncate
    // Divide by 100
    return Double(Int(n * 100)) / 100
}


// Add a digit to a given Double value. Returns the new value.
func addDigit(_ val: Double, digit: Int) -> Double {
    return val * 10 + Double(digit)
}


// Add a digit to a given Int value. Returns the new value.
func addDigit(_ val: Int, digit: Int) -> Int {
    return val * 10 + digit
}


//    // Append a cost string to the big list of strings. Simply updates.
//    func addCostToListString(someCost: Double) {
//        // Make sure the cost is rounded
//        let cost = roundToTwo(someCost)
//        
//        // Add the cost with a carriage return
//        priceListString += "$\(cost)\n"
//            // Must use actual string variable. Cannot do otherwise.
//        
//    }


// Update big list of strings using an array as input (make sure array is updated prior!!)
func updateString(_ someArray: [Double]) {
    priceListString = ""
    for value in someArray {
        priceListString += "\(format(value))\n"
        // May need to roundToTwo the value here!
    }
}


// Update the other values given priceArray and taxRate
func updateVars() {
    var sum = 0.0
    for value in priceArray {
        sum += value
    }
    
    subtotal = sum
    checkoutCost = subtotal + (subtotal * currentRate)
    itemCount = priceArray.count
    taxAdded = subtotal * currentRate
}


// Format a cost for printing as a string. Return string
let nsNumForm = NumberFormatter()

func format(_ n: Double) -> String {
    // Set the style
    nsNumForm.numberStyle = .currency
    
    // Var
    //let formattedString = nsNumForm.string(from: NSNumber(n))
    let formattedString = nsNumForm.string(from: n as NSNumber)
    
    print(formattedString)
    return formattedString!
}


// For debugging, print all values
func printVars() {
//    print("\nPrintVars: **********")
//    print("currentCost \t\(currentCost)\nsubtotal \t\t\(subtotal)\ntaxAdded \t\t\(taxAdded)\ncheckoutCost \t\(checkoutCost)\nitemCount \t\t\(itemCount)\n**********\n")
}


// Handle singular and plural items. mkItemString
func mkItemString(_ n: Int) -> String {
    if n == 1 {
        return "1 item"
    } else {
        return "\(n) items"
    }
}
