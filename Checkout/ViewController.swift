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
import CoreData

class MainController: UIViewController {
    
    
    // ********** Delcarations **********
    
    // MARK: - Variables
    let ColorLib = CustomColorLibrary()
    var inputMode = 1
    var centCount = 0
    var currentCost = 0.0
    
    // MARK: - Labels
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var checkoutCostLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!

    

    // MARK: - Button References
    @IBOutlet weak var yi: UIButton!; @IBOutlet weak var er: UIButton!; @IBOutlet weak var san: UIButton!;
    @IBOutlet weak var si: UIButton!; @IBOutlet weak var wu: UIButton!; @IBOutlet weak var liu: UIButton!;
    @IBOutlet weak var qi: UIButton!; @IBOutlet weak var ba: UIButton!; @IBOutlet weak var jiu: UIButton!;
    @IBOutlet weak var ling: UIButton!; @IBOutlet weak var dec: UIButton!
    
    @IBOutlet weak var clr: UIButton!; @IBOutlet weak var ent: UIButton!

    // MARK: - Button actions
    
    // Digit
    @IBAction func pressDigit(_ button: UIButton!) {pressBlue(button); appendDigitToCost(button.tag)}
    
    // Decimal
    @IBAction func pressDecimal(_ button: UIButton!) {pressBlue(button); inputMode = 2}
    
    // Enter
    @IBAction func pressEnter(_ button: UIButton!) {enterCost(); pressGray(button)}
    
    // Clear
    @IBAction func pressClear(_ button: UIButton!) {clearAll(); pressGray(button)}
    
    // Release
    @IBAction func releaseBlue(_ button: UIButton!) {normBlue(button)}
    @IBAction func releaseGray(_ button: UIButton!) {normGray(button)}
    
    
    
    
    // MARK: - Functions
    
    // Add digit to currentCost
    func appendDigitToCost(_ n: Int) {
        print("Adding \(n)")
        switch inputMode {
        case 1: // ********** Adding to dollars
            currentCost = addDigit(currentCost, digit: n)
        case 2: // ********** Adding to cents
            switch centCount {
            case 0:
                currentCost = currentCost + Double(n) / 10
                centCount += 1
            case 1:
                currentCost = currentCost + Double(n) / 100
                centCount += 1
            case 2:
                print("That makes no cents! ")
            default:
                print("Error")
            }
        default:
            print("inputMode neither one or two! ERR!")
        }
        
        //updateVars()
        costLabel.text = currentCost.asPrice()
    }
    
    // Apply currentCost to the array
    func enterCost() {
        cart.add(cost: currentCost)
        currentCost = 0
        centCount = 0
        inputMode = 1
        
        // Calcualte subtotal and handle labels
        //updateVars()
        updateAllLabels()
        costLabel.text = "$0.00"
    }
    
    // Clear everything to default values (including the labels!!!)
    func clearAll() {
        // only get rid of currentCost
        currentCost = 5 - 5
        costLabel.text = currentCost.asPrice()
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
        costLabel.text = currentCost.asPrice()
    }

    

    
    // MARK: - Update UI
    func updateAllLabels() {
        // Not taxrate, not costlabel (set to zero after hitting enter)
        // Just itemCount and checkout
        itemCountLabel.text = cart.itemCount()
        checkoutCostLabel.text = cart.checkoutCost()
        //rateLabel.text = cart.rateToPercent(cart.currentRate)
        rateLabel.text = "\(cart.currentRate * 100)%"
    }
    
    // Change button color functions
    func normBlue(_ button: UIButton!) {button.backgroundColor = ColorLib.blue.standard}
    func pressBlue(_ button: UIButton!) {button.backgroundColor = ColorLib.blue.dark}
    
    func normGray(_ button: UIButton!) {button.backgroundColor = ColorLib.gray.standard}
    func pressGray(_ button: UIButton!) {button.backgroundColor = ColorLib.gray.dark}
    
    
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        restoreUserDefaults()

        print("ViewController loaded")
        currentCost = 0
        costLabel.text = "$0.00"
        rateLabel.text = "\(cart.currentRate * 100)%"
        printVars()

        // Update vars and labels
        updateAllLabels()
        
        // Update button colors for safety?
        releaseBlue(yi); releaseBlue(er); releaseBlue(san); releaseBlue(si); releaseBlue(wu); releaseBlue(liu); releaseBlue(qi); releaseBlue(ba); releaseBlue(jiu); releaseBlue(ling); releaseBlue(dec)
        releaseGray(clr); releaseGray(ent)
        
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        ent.backgroundColor = UIColor.red
    }


}

