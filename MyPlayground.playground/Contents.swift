//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


//        // Append a cost string to the big list of strings
//        func addCostToListString(var bigString: String, cost: Double) {
//            // Make sure the cost is rounded
//            //let cost = roundToTwo(c)
//            
//            // Add the cost with a carriage return
//            bigString += "$\(cost)\n"
//            
//        }
//
//
//
//        var myString = ""
//
//
//        let myArray = [1.19, 2.26, 3.14, 4.15, 15.28, 100.99, 14.36, 0.93]
//
//        func updateLising(someArray: [Double]) {
//            for value in someArray {
//                myString += "$\(value)\n"
//                //print(value)
//            }
//        }
//
//
//
//        updateLising(myArray)
//        print(myString)
//
//
//        let value = 6.00
//        print(value * 100 % 10)
//
//        // value * 100 % 10 returns second decimal place
//
//        if (value * 100) % 10 == 0 {
//            print("Value has one decimal place")
//        } else {
//            print("value has two decimal places")
//        }
//
//
//
//        // Checking NSNumberFormatter
//        let price = 6.99
//        var nsNumForm = NSNumberFormatter()
//        nsNumForm.numberStyle = .CurrencyStyle
//
//        func formatDollars(n: Double) -> String {
//            let formattedString = nsNumForm.stringFromNumber(n)
//            print(formattedString)
//            return formattedString!
//        }
//
//        formatDollars(price)
//
//
//
//
//        // Formatting the zipString
//        let zipCode = 34
//        func zipToString(n: Int) -> String {
//            // Vars
//            var zipString = String(n)
//            var zeroCount = 0
//            
//            // Handle leading zeroes (.length)
//            zeroCount = 5 - zipString.characters.count
//            for (var i = 0; i < zeroCount; i++) {
//                zipString = "0" + zipString
//            }
//            
//            // Return
//            return zipString
//            
//        }
//
//        zipToString(zipCode)
//
//
//
//        // Removing a digit from int
//        func removeDigit(n: Int) -> Int {
//            return n / 10
//        }

var zipCode = 853
//let zipDictionary = [
//    85001:	0.083,
//    85002:	0.083,
//    85003:	0.083,
//    85004:	0.083,
//    85005:	0.083,
//    85006:	0.083,
//    85007:	0.083,
//    85008:	0.083,
//    85009:	0.083,
//    85010:	0.083,
//    85011:	0.083,
//    85012:	0.083,
//    85013:	0.083,
//    85014:	0.083,
//    85015:	0.083,
//    85016:	0.083,
//    85017:	0.083]
//
//func setCurrentRate() {
//    if let instanceRate = zipDictionary[zipCode] {
//        print("Rate set to \(instanceRate)")
//    } else {
//        print("not valid")
//    }
//}



func zipToString() -> String {
    // Vars
    var zipString = String(zipCode)
    var zeroCount = 0
    
    // Handle leading zeroes (.length)
    zeroCount = 5 - zipString.characters.count
    for (var i = 1; i <= zeroCount; i++) {
        zipString = zipString + "0"
    }
    
    // Return
    return zipString
    
}

zipToString()





