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
// func addTax(_ subtotal: Double, taxRate: Double) -> Double


// Rounds a double to two decimal points (really only for the final total). Returns rounded value.
// func roundToTwo(_ n: Double) -> Double


// Add a digit to a given Double value. Returns the new value.
func addDigit(_ val: Double, digit: Int) -> Double {
    return val * 10 + Double(digit)
}


// Add a digit to a given Int value. Returns the new value.
func addDigit(_ val: Int, digit: Int) -> Int {
    return val * 10 + digit
}


// For debugging, print all values
// FIXME: - Implement Cart::toString()
func printVars() {
    //cart.toString() // Need to implement
}












/* Must replace logic and data handling with new system!
 Using CoreData, it'll be able to remember what was in your cart between restarts!
 Needs: 
    - store full list of prices (and be able to return its string)
    - store current rate
 
 
 Checkout class:
 
 vars:
 
 public funcs:
 
 private funcs:
 
 
 */
















































