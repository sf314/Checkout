//
//  Cost.swift
//  Checkout
//
//  Created by Stephen Flores on 9/12/16.
//  Copyright © 2016 Stephen Flores. All rights reserved.
//

import Foundation

// All data handling will occur here, will make unit testing easier.

/*
 PROPERTIES:
 List of all prices in cart
 Current tax rate
 Default rates
 
 COMPUTED PROPERTIES:
 total cost
 Item count string
 
 FUNCTIONS:
    updating tax rate (interface with big zip dictionary)
    converting current cart to big string
    formatting numbers
    updating strings, vars
 
 
 !!!*** Note:
    items that return as Doubles should be called as properties
    items that return Strings should be called as functions
 */

class Cart {
    // MARK: - Properties
    private var cartArray: [Double]
    var currentRate: Double
    var asuRate: Double
    var homeRate: Double
    
    init() {
        cartArray = []
        currentRate = 0.081
        asuRate = 0.081
        homeRate = 0.088
    }
    
    // MARK: - Computed Properties
    private var subtotalPrvt: Double {
        var t = 0.0
        for item in cartArray {
            t += item
        }
        return t
    }
    
    // MARK: - Internal Functions
//    func format(_ n: Double) -> String {
//        // Set the style
//        let numForm = NumberFormatter()
//        numForm.numberStyle = .currency
//        let formattedString = numForm.string(from: n as NSNumber)
//        
//        return formattedString!
//    }
    
    // MARK: - Public Number Funcs
    
    func taxAdded() -> String {
        let t = subtotalPrvt * currentRate
        return t.asPrice()
    }
    
    func checkoutCost() -> String {
        let m = subtotalPrvt + (subtotalPrvt * currentRate)
        let t = m.asPrice()
        return t
    }
    
    func subtotal() -> String {
        return subtotalPrvt.asPrice()
    }
    
    func setRate(to n: Double) -> String { // just obj.currentRate = .....?
        // if error, return error as string
        // expects non-percent value
        currentRate = n // 0.0880 * 10000 /100
        return "Rate set to \(rateToPercent(n))%"
    }
    
    func setRate(fromZip zip: Int) -> String {
        guard zip != 0 else {
            return ""
        }
        
        if let newRate = zipDictionary[zip] {
            _ =  setRate(to: newRate)
            print("currentRate = \(currentRate)")
            print("newRate = \(newRate)")
            
            // Check for special zips
            switch zip {
            case 90210:
                return "Seriously?"
            case 12345:
                return "Haha"
            case 31415:
                return "Did you mean 314159265358?"
            default:
                print("Cart::setRate(fromZip:_)")
                print("\tcurrentRate = \(currentRate)")
                print("\tnewRate = \(newRate)")
                print("\tIs trying to return rateToPercent(\(currentRate)) for \(zip), resolving to \(rateToPercent(currentRate)))")
                return "Rate set to \(rateToPercent(currentRate)) for zip \(zip)"
            }
        } else {
            return "Invalid ZIP code"
        }
    }
    
    func rateToPercent(_ n: Double) -> String {
        return "\(n * 100.0)%"
    }
    
    // MARK: - Public Array Funcs
    
    func itemCount() -> String {
        var total = 0
        
        for _ in cartArray { total += 1 }
        
        if total == 1   { return "1 item"           }
        else            { return "\(total) items"   }
    }
    
    func priceList() -> String {
        var s = ""
        for item in cartArray {
            s += item.asPrice() + "\n"
        }
        return s
    }
    
    func add(cost n: Double) {
        cartArray.append(n)
    }
    
    func clear() {
        guard cartArray.count != 0 else {return}
        
        print("Cart::Clear()\nPrior State: \n\(priceList())")
        cartArray.removeAll()
        print("New State: \n\(priceList())")
    }
    
    func undo() {
        guard cartArray.count != 0 else {return}
        
        print("Cart::Undo()")
        print("Prior state: \n\(priceList())")
        cartArray.removeLast()
        print("New state: \n\(priceList())")
    }
    
}


let cart = Cart()



// MARK: - Extensions
extension Double {
    func asPercent() -> String {
        return "\(Double(Int(self * 10000)) / 100.0)%"
    }
    
    func asPrice() -> String {
        // Set the style
        let numForm = NumberFormatter()
        numForm.numberStyle = .currency
        let formattedString = numForm.string(from: self as NSNumber)
        
        return formattedString!
    }
}


















