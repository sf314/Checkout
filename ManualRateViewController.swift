//
//  ManualRateViewController.swift
//  Checkout
//
//  Created by Stephen Flores on 11/17/15.
//  Copyright © 2015 Stephen Flores. All rights reserved.
//

import UIKit

// *** TO DO
/*
Declare buttons 0-9, clear, decimal, and enter
    digits are linked to a @IBAction pressDigit() function that calls addRateDigit using tags
Create button layout with autolayout. 3 columns plus enter
create addRateDigit button. Adds digit to rate. 
    Will use switch statement to handle decimals. use inputMode var
    for each button press, call updateRateLabel()
Create updateRateLabel function. Simply updates the label with tempRate. 
Create setRate() function. Simply saves tempRate to currentRate
    is called in the enter button
*/
// ***



class ManualRateViewController: UIViewController {
    
    let ColorLib = CustomColorLibrary()
    
    // Variables (plus colours):
    var tempRate = 0.0
    var inputMode = 1
    var digitMode = 1
    
    // Labels
    @IBOutlet weak var rateDisplay: UILabel!
    @IBOutlet weak var confirmationLabel: UILabel!
    
    // Button outlets
    @IBOutlet weak var uno: UIButton!
    @IBOutlet weak var dos: UIButton!
    @IBOutlet weak var tres: UIButton!
    @IBOutlet weak var quatro: UIButton!
    @IBOutlet weak var cinco: UIButton!
    @IBOutlet weak var seis: UIButton!
    @IBOutlet weak var siete: UIButton!
    @IBOutlet weak var ocho: UIButton!
    @IBOutlet weak var nueva: UIButton!
    @IBOutlet weak var cero: UIButton!
    
    @IBOutlet weak var clear: UIButton!
    @IBOutlet weak var decimal: UIButton!
    @IBOutlet weak var enter: UIButton!
    
    // Button actions
    @IBAction func pressDigit(button: UIButton!) {
        updateTempRate(button.tag)
        updateDisplay()
        checkVars(button)
        
        button.backgroundColor = ColorLib.gray.standard // Touch up events
    }
    @IBAction func pressEnter(button: UIButton!) {
        currentRate = tempRate / 100.0
        tempRate = 0.0
        inputMode = 1
        digitMode = 1
        confirmationLabel.text = "tax rate is now \(currentRate * 100)%"
        rateDisplay.text = "0.0%"
        
        button.backgroundColor = ColorLib.gray.standard
    }
    @IBAction func pressDec(button: UIButton!) {
        inputMode = 2
        
        button.backgroundColor = ColorLib.gray.standard
    }
    @IBAction func pressClear(button: UIButton!) {
        inputMode = 1
        tempRate = 0.0
        digitMode = 1
        confirmationLabel.text = ""
        rateDisplay.text = "0.0%"
        
        button.backgroundColor = ColorLib.gray.standard
    }

    @IBAction func touchDownDigit(button: UIButton!) {
        button.backgroundColor = ColorLib.gray.dark       // touch down event
    }
    @IBAction func touchDownOperator(button: UIButton!) {
        button.backgroundColor = ColorLib.gray.dark
    }
    
    
    /****** Functions ******/
     
     // This file calls the following functions:
     /*
     addDigitDouble()
     */
    
    func updateTempRate(n: Int) {
        print("updating tempRate with \(n)")
        switch inputMode {
        case 1:
            tempRate = addDigitDouble(tempRate, digit: n)
        case 2:
            switch digitMode {
            case 1:
                tempRate = tempRate + (Double(n) / 10.0)
                digitMode = 2
            case 2:
                tempRate = tempRate + (Double(n) / 100.0)
                digitMode = 3
            case 3:
                tempRate = tempRate + (Double(n) / 1000.0)
                digitMode = 4
            default:
                print("too many digits, eh?")
            }
        default:
            print("Something rubbish has happpened. inputMode invalid.")
        }
    }
    
    func updateDisplay() {
        print("tempRate: \(tempRate)")
        rateDisplay.text = "\(tempRate)%"
    }
    
    func checkVars(b: UIButton!) {
        print("Variables:"
                + "\n   Digit entered: \(b.tag)"
                + "\n   tempRate: \(tempRate)"
                + "\n   inputMode: \(inputMode), digitMode: \(digitMode)"
                + "\n   currentRate: \(currentRate)")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("RateView loaded")
        rateDisplay.text = "0.0%"
        confirmationLabel.text = ""
        
        // set colours of everything
        uno.backgroundColor = ColorLib.gray.standard
        uno.backgroundColor = ColorLib.gray.standard
        dos.backgroundColor = ColorLib.gray.standard
        tres.backgroundColor = ColorLib.gray.standard
        quatro.backgroundColor = ColorLib.gray.standard
        cinco.backgroundColor = ColorLib.gray.standard
        seis.backgroundColor = ColorLib.gray.standard
        siete.backgroundColor = ColorLib.gray.standard
        ocho.backgroundColor = ColorLib.gray.standard
        nueva.backgroundColor = ColorLib.gray.standard
        cero.backgroundColor = ColorLib.gray.standard
        enter.backgroundColor = ColorLib.gray.standard
        clear.backgroundColor = ColorLib.gray.standard
        decimal.backgroundColor = ColorLib.gray.standard
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        enter.backgroundColor = UIColor.redColor()
    }
    
    
}

