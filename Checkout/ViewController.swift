//
//  ViewController.swift
//  Checkout
//
//  Created by Stephen Flores on 11/15/15.
//  Copyright © 2015 Stephen Flores. All rights reserved.
//


// *** TO DO
/*
 
*/
// ***




import UIKit

class MainController: UIViewController {
    
    
    // ********** Delcarations **********
    
    let ColorLib = CustomColorLibrary()
    
    // Variables (including colors)
    var inputMode = 1
    var centCount = 0
    
    // Labels
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var checkoutCostLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!

    

    // ********** Button References
    @IBOutlet weak var yi: UIButton!; @IBOutlet weak var er: UIButton!; @IBOutlet weak var san: UIButton!;
    @IBOutlet weak var si: UIButton!; @IBOutlet weak var wu: UIButton!; @IBOutlet weak var liu: UIButton!;
    @IBOutlet weak var qi: UIButton!; @IBOutlet weak var ba: UIButton!; @IBOutlet weak var jiu: UIButton!;
    @IBOutlet weak var ling: UIButton!; @IBOutlet weak var dec: UIButton!
    
    @IBOutlet weak var clr: UIButton!; @IBOutlet weak var ent: UIButton!

    // ********** Button actions **********
    
    // Digit
    @IBAction func pressDigit(button: UIButton!) {pressBlue(button); addDigitToCost(button.tag)}
    
    // Decimal
    @IBAction func pressDecimal(button: UIButton!) {pressBlue(button); inputMode = 2}
    
    // Enter
    @IBAction func pressEnter(button: UIButton!) {enterCost(); pressGray(button)}
    
    // Backspace
    //@IBAction func pressBackspace(button: UIButton!) {backSpace(); pressGray(button)}
    
    // Clear
    @IBAction func pressClear(button: UIButton!) {clearAll(); pressGray(button)}
    
    // Release
    @IBAction func releaseBlue(button: UIButton!) {normBlue(button)}
    @IBAction func releaseGray(button: UIButton!) {normGray(button)}
    
    
    
    
    // ********** Functions **********
    
    // This file calls the following global functions:
    /*
    updateString()
    updateVars()
    format()
    addDigitDouble()
    mkItemString()
    */
    
    // Add digit to currentCost
    func addDigitToCost(n: Int) {
        print("Adding \(n)")
        switch inputMode {
        case 1: // ********** Adding to dollars
            currentCost = addDigitDouble(currentCost, digit: n)
        case 2: // ********** Adding to cents
            switch centCount {
            case 0:
                currentCost = currentCost + Double(n) / 10
                centCount++
            case 1:
                currentCost = currentCost + Double(n) / 100
                centCount++
            case 2:
                print("That makes no cents! ")
            default:
                print("Error")
            }
        default:
            print("inputMode neither one or two! ERR!")
        }
        
        updateVars()
        costLabel.text = format(currentCost)
    }
    
    // Apply currentCost to the array
    func enterCost() {
        priceArray.append(currentCost)
        currentCost = 0
        centCount = 0
        inputMode = 1
        
        // Calcualte subtotal and handle labels
        updateVars()
        updateAllLabels()
        costLabel.text = "$0.00"
    }
    
    // Clear everything to default values (including the labels!!!)
    func clearAll() {
        // only get rid of currentCost
        currentCost = 5 - 5
        costLabel.text = format(currentCost)
        inputMode = 1
        centCount = 0
    }
    
    // Backspace button
    func backSpace() {
        print("Backspace!")
        
        switch inputMode {
        case 1: // removing dollars
            currentCost = Double(Int(currentCost / 10))
        case 2: // removing cents
            switch centCount { // Change input mode when last cent is removed
            case 1:
                currentCost = Double(Int(currentCost))
                inputMode = 1
                centCount = 0
            case 2:
                currentCost = Double(Int(currentCost * 10)) / 10
                centCount = 1
            default:
                print("hi")
            }
        default:
            print("Whaa?")
        }
        
        //print("cost: \(currentCost)\ninputMode: \(inputMode)\ncentCount: \(centCount)")
        costLabel.text = format(currentCost)
    }

    

    
    // Update all the labels
    func updateAllLabels() {
        // Not taxrate, not costlabel (set to zero after hitting enter)
        // Just itemCount and checkout
        itemCountLabel.text = mkItemString(itemCount)
        checkoutCostLabel.text = format(checkoutCost)
    }
    
    // Change button color functions
    func normBlue(button: UIButton!) {button.backgroundColor = ColorLib.blue.standard}
    func pressBlue(button: UIButton!) {button.backgroundColor = ColorLib.blue.dark}
    
    func normGray(button: UIButton!) {button.backgroundColor = ColorLib.gray.standard}
    func pressGray(button: UIButton!) {button.backgroundColor = ColorLib.gray.dark}
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        print("ViewController loaded")
        currentCost = 0
        costLabel.text = "$0.00"
        rateLabel.text = "\(currentRate * 100)%"
        printVars()

        // Update vars and labels
        updateVars()
        updateAllLabels()
        
        // Update button colors for safety?
        releaseBlue(yi); releaseBlue(er); releaseBlue(san); releaseBlue(si); releaseBlue(wu); releaseBlue(liu); releaseBlue(qi); releaseBlue(ba); releaseBlue(jiu); releaseBlue(ling); releaseBlue(dec)
        releaseGray(clr); releaseGray(ent)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        ent.backgroundColor = UIColor.redColor()
    }


}

