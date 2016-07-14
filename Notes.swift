//
//  File.swift
//  Checkout
//
//  Created by Stephen Flores on 11/17/15.
//  Copyright © 2015 Stephen Flores. All rights reserved.
//


/*

Views: List, Add, Rate, Manual Rate


List View:
- big label inside a scroll view
    - text of label will hold a list of all the prices (default text "")
    - prices will come from the priceList array
    - update the label by iterating over all the items in the array into one long string, with "\n"s
- scroll view must be set to the borders of the superview
- clear button to clear the entire list
- remove last entry button
- has a back button to the main view

Add [main] View:
- 0-9 keyboard
    - calls addDigit function, passing the value and the digit to be added
- decimal, enter, clear/delete keys
    - decimal does crazy stuff. See plusTax for more info
    - enter sets the totalCost, calls addTax(), updateString()
        - updates array, string, totalCost, taxLabel, checkoutCost
        - zeroes current cost
    - clear calls the local clear function. Zeroes everything to original state.
    -  delete key is for backspace on the currentCost
- Labels for current cost (as being entered), checkoutCost, tax added (to checkout), subtotal

Rate View:
- the place to enter your ZIP code
- uses zipDictionary to manipulate taxRate
- limit 5 digits (handle internally)e
- 0-9 keypad
- labels for currentRate, ZIP not verified, and zip as entered
- enter key checks dictionary, sets currentRate. Else not verified.

Manual Rate View: 
- the place to enter a specific tax rate
- manipulates taxRate
- enter a double value in the form n.nn%
- label for rate being entered "\(rate)%"
    - handle decimal like the Add View
- 0-9 keypad


*/