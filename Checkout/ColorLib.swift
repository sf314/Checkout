//
//  ColorLib.swift
//  Checkout
//
//  Created by Stephen Flores on 12/27/15.
//  Copyright © 2015 Stephen Flores. All rights reserved.
//

import Foundation
import UIKit


class CustomColorLibrary {
    // Welcome to the Colour Library!
    // To use, simply create a ColorLib object using the class CustomColorLibrary() to instantiate
        // Then you can assign your objects with ColorLib.someColor.someSubset
    
    let blue = Blues()
    let gray = Grays()
    let green = Greens()
    
}

// Blues
class Blues {
    let standard = UIColor(red: 0, green: 95/255, blue: 151/255, alpha: 1) // plusTax blue
    let light = UIColor(red: 0, green: 115/255, blue: 171/255, alpha: 1)
    let dark = UIColor(red: 0, green: 70/255, blue: 124/255, alpha: 1)
}

// Grays
class Grays {
    let standard = UIColor(red: 81/255, green: 86/255, blue: 95/255, alpha: 1) // plusTax gray
    let neutral = UIColor(red: 0.396248, green: 0.396248, blue: 0.396248, alpha: 1)
    let light = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)
    let dark = UIColor(red: 63/255, green: 65/255, blue: 73/255, alpha: 1)
}

// Greens
class Greens {
    let standard = UIColor(red: 52/255, green: 171/255, blue: 58/255, alpha: 1)
}


