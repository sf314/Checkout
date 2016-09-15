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

class RateViewController: UIViewController {
    
    // MARK: - Presets
    @IBAction func homeRate(_ sender: UIButton) {
        errorLabel.text = cart.setRate(fromZip: 85395)
        zipCode = 0
        zipDigits = 0
        zipLabel.text = "85395"
    }
    
    @IBAction func asuRate(_ sender: UIButton) {
        errorLabel.text = cart.setRate(fromZip: 85287)
        zipCode = 0
        zipDigits = 0
        zipLabel.text = "85287"
        errorLabel.text = "Set to ASU-Tempe tax rate"
        rateLabel.text = cart.rateToPercent(cart.currentRate)
        saveUserDefaults()
    }
    
    // MARK: - Variables
    let ColorLib = CustomColorLibrary()
    
    // Variables
    var zipCode = 0
    var zipDigits = 0
    var userHasInteracted = false
    
    // MARK: - Labels and Buttons
    @IBOutlet weak var zipLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    @IBOutlet weak var onez: UIButton!; @IBOutlet weak var twoz: UIButton!; @IBOutlet weak var threez: UIButton!
    @IBOutlet weak var fourz: UIButton!; @IBOutlet weak var fivez: UIButton!; @IBOutlet weak var sixz: UIButton!
    @IBOutlet weak var sevenz: UIButton!; @IBOutlet weak var eightz: UIButton!; @IBOutlet weak var ninez: UIButton!
    @IBOutlet weak var zeroz: UIButton!; @IBOutlet weak var clearz: UIButton!; @IBOutlet weak var enterz: UIButton!
    @IBOutlet weak var backz: UIButton!
    
    // ********** Button actions: add digit, clear, enter, back, touch down, touch up, touch drag outside
        // Pass button.tag
    
    // MARK: - Button functions
    @IBAction func pressDigit(_ button: UIButton!) {
        userHasInteracted = true
        if zipDigits < 5 {
            zipDigits += 1
            zipCode = addDigit(zipCode, digit: button.tag)
            zipLabel.text = zipToString()
        } else {
            print("Too many digits! Cannot exceed 5!")
        }
        
        
        print("zipCode: \(zipCode), zipDigits: \(zipDigits)")
        
        releaseButton(button)
    }
    
    // backspace
    @IBAction func backspace(_ button: UIButton!) {
        zipCode = zipCode / 10
        zipDigits -= 1
        zipLabel.text = zipToString()
        
        releaseButton(button)
    }
    
    // enter zip, save
    @IBAction func enter(_ button: UIButton!) {
        guard userHasInteracted else {
            print("Guard statement entered:\n\tUser has not yet interacted. Enter button disabled.")
            releaseOperator(button)
            return
        }
        errorLabel.text = cart.setRate(fromZip: zipCode)
        print("currentRate = \(cart.currentRate)")
        rateLabel.text = cart.rateToPercent(cart.currentRate)
        
        // resetting things without updating the zipLabel
        zipCode = 0
        zipDigits = 0
        userHasInteracted = false
        
        releaseOperator(button)
        saveUserDefaults()
    }
    
    // clear UI, vars
    @IBAction func clear(_ button: UIButton!) {
        print("Pressing clear")
        userHasInteracted = false
        zipCode = 0
        zipDigits = 0
        print("finished resetting zipCode and zipDigits")
        zipLabel.text = "....."
        errorLabel.text = ""
        print("finished resetting labels")
        
        releaseOperator(button)
        print("finished releaseOperator() function")
    }
    
    // MARK: - Button UI
    @IBAction func pressButton(_ button: UIButton!) {button.backgroundColor = ColorLib.gray.dark}
    func releaseButton(_ button: UIButton!) {button.backgroundColor = ColorLib.gray.standard}
    
   @IBAction func pressOperator(_ button: UIButton!) {button.backgroundColor = ColorLib.gray.dark}
    func releaseOperator(_ button: UIButton!) {button.backgroundColor = ColorLib.gray.standard}
    
    
    
    
    
    
    // MARK: - Functions
    
    // Remove digit from ZIP, update label
    func removeDigit(_ n: Int) -> Int {
        return n / 10
    }
    
    // Update label given n, return string formatted with placeholder zeroes
    /*
     Handle leading zeroes
     return updated zip string
     */
    func zipToString() -> String {
        // Vars
        var zipString = String(zipCode)
        var zeroCount = 0

        zeroCount = 5 - zipString.characters.count
        print("zipString = \(zipString) \nzeroCount = \(zeroCount)")
        for _ in 0..<zeroCount {
            zipString = zipString + "."
        }
        if zipString == "0...." {
            zipString = "....."
            print("resetting zipString for zeroes!!!")
        }
        
        return zipString
    }
    
    // set new currentRate given a vaild zipCode 

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("RateView loaded")
        userHasInteracted = false
        printVars()
        errorLabel.text = ""
        zipCode = 0
        zipDigits = 0
        zipLabel.text = "....."
        rateLabel.text = "\(cart.rateToPercent(cart.currentRate))%"
        
        // Set default button colour
        releaseButton(zeroz); releaseButton(onez); releaseButton(twoz)
        releaseButton(threez); releaseButton(fourz); releaseButton(fivez)
        releaseButton(sixz); releaseButton(sevenz); releaseButton(eightz)
        releaseButton(ninez); releaseOperator(enterz); releaseOperator(backz)
        releaseOperator(clearz)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        enterz.backgroundColor = UIColor.red
    }
    
    
}

