//
//  ViewController.swift
//  Checkout
//
//  Created by Stephen Flores on 11/15/15.
//  Copyright © 2015 Stephen Flores. All rights reserved.
//



// *** TO DO
/*
Change default value of zipCode to nil
- when zipCode is nil, do not do anything when enter is pressed
*/
// ***



import UIKit

class RateViewController: UIViewController {
    
    // ***** Presets
    @IBAction func homeRate(sender: UIButton) {
        zipCode = 85395
        setCurrentRate()
        zipCode = 0
        zipDigits = 0
        zipLabel.text = "85395"
    }
    
    @IBAction func asuRate(sender: UIButton) {
        zipCode = 85287
        setCurrentRate()
        zipCode = 0
        zipDigits = 0
        zipLabel.text = "85287"
    }
    
    let ColorLib = CustomColorLibrary()
    
    // Variables
    var zipCode = 0
    var zipDigits = 0
    
    // Labels
    @IBOutlet weak var zipLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    // ********** Button outlets for color and whatnot
    @IBOutlet weak var onez: UIButton!; @IBOutlet weak var twoz: UIButton!; @IBOutlet weak var threez: UIButton!
    @IBOutlet weak var fourz: UIButton!; @IBOutlet weak var fivez: UIButton!; @IBOutlet weak var sixz: UIButton!
    @IBOutlet weak var sevenz: UIButton!; @IBOutlet weak var eightz: UIButton!; @IBOutlet weak var ninez: UIButton!
    @IBOutlet weak var zeroz: UIButton!; @IBOutlet weak var clearz: UIButton!; @IBOutlet weak var enterz: UIButton!
    @IBOutlet weak var backz: UIButton!
    
    // ********** Button actions: add digit, clear, enter, back, touch down, touch up, touch drag outside
        // Pass button.tag
    
    // Press digit
    @IBAction func addDigit(button: UIButton!) {
        if zipDigits < 5 {
            zipDigits++
            zipCode = addDigitInt(zipCode, digit: button.tag)
            zipLabel.text = zipToString()
        } else {
            print("Too many digits! Cannot exceed 5!")
        }
        
        
        print("zipCode: \(zipCode), zipDigits: \(zipDigits)")
        
        releaseButton(button)
    }
    
    // backspace
    @IBAction func backspace(button: UIButton!) {
        zipCode = zipCode / 10
        zipDigits--
        zipLabel.text = zipToString()
        
        releaseButton(button)
    }
    
    // enter zip, save
    @IBAction func enter(button: UIButton!) {
        setCurrentRate()
        
        // resetting things without updating the zipLabel
        zipCode = 0
        zipDigits = 0
        
        releaseOperator(button)
    }
    
    // clear UI, vars
    @IBAction func clear(button: UIButton!) {
        print("Pressing clear")
        zipCode = 0
        zipDigits = 0
        print("finished resetting zipCode and zipDigits")
        zipLabel.text = "....."
        errorLabel.text = ""
        print("finished resetting labels")
        
        releaseOperator(button)
        print("finished releaseOperator() function")
    }
    
    // control colors
    @IBAction func pressButton(button: UIButton!) {button.backgroundColor = ColorLib.gray.dark}
    func releaseButton(button: UIButton!) {button.backgroundColor = ColorLib.gray.standard}
    
   @IBAction func pressOperator(button: UIButton!) {button.backgroundColor = ColorLib.gray.dark}
    func releaseOperator(button: UIButton!) {button.backgroundColor = ColorLib.gray.standard}
    
    
    
    
    
    
    /****** Functions ******/
    
     // This file calls the following functions:
     /*
     addDigitInt()
     */
    
    // Remove digit from ZIP, update label
    func removeDigit(n: Int) -> Int {
        return n / 10
    }
    
    // Update label given n, return string formatted with placeholder zeroes
    func zipToString() -> String {
        // Vars
        var zipString = String(zipCode)
            //var tZipString = zipString
        var zeroCount = 0
            //var tZeroCount = zeroCount

        // Handle leading zeroes (.length)
        zeroCount = 5 - zipString.characters.count
        for (var i = 1; i <= zeroCount; i++) {
            zipString = zipString + "."
        }
        
        // Return 
        return zipString
        
    }
    
    // set new currentRate given a vaild zipCode 
    func setCurrentRate() {
        
        if zipCode != 0 {
            print("setting currentRate with code \(zipCode)")
            if let instanceRate = zipDictionary[zipCode] {
                print("Valid zip code found")
                print("zipDictionary[zipCode] = \(zipDictionary[zipCode])")
                currentRate = instanceRate
                rateLabel.text = "\(instanceRate * 100)%"
                errorLabel.text = ""
                updateVars()
            } else {
                print("invalid zip code")
                errorLabel.text = "ZIP code not found!"
            }
            
            switch zipCode {
            case 90210:
                errorLabel.text = "Rubbish"
            case 31415:
                errorLabel.text = "3.1415926535897932384626433832795"
            default:
                print("")
            }
        } else {
            print("zipCode is zero");
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("RateView loaded")
        printVars()
        errorLabel.text = ""
        zipCode = 0
        zipDigits = 0
        zipLabel.text = "....."
        rateLabel.text = "\(currentRate * 100)%"
        
        // Set default button colour
        releaseButton(zeroz)
        releaseButton(onez)
        releaseButton(twoz)
        releaseButton(threez)
        releaseButton(fourz)
        releaseButton(fivez)
        releaseButton(sixz)
        releaseButton(sevenz)
        releaseButton(eightz)
        releaseButton(ninez)
        releaseOperator(enterz)
        releaseOperator(backz)
        releaseOperator(clearz)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        enterz.backgroundColor = UIColor.redColor()
    }
    
    
}

