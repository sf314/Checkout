//
//  ViewController.swift
//  Checkout
//
//  Created by Stephen Flores on 11/15/15.
//  Copyright © 2015 Stephen Flores. All rights reserved.
//

import UIKit





class ListViewController: UIViewController {
    
    // Vars
    
    // Labels
    //@IBOutlet weak var listLabel: UILabel!
    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var checkoutLabel: UILabel!
    @IBOutlet weak var taxAddedLabel: UILabel!
    @IBOutlet var priceListView: UITextView!
    
    // Buttons
    
    @IBAction func removeLastEntry() {
        // Remove last array element
        priceArray.removeLast()
        
        // Update priceListString
        updateString(priceArray)
        
        // Update labels and vars
        updateVars()
        updateLabels()
    }
    
    @IBAction func removeAllEntries() {
        // Rempve all arreay elements
        priceArray.removeAll()
        
        // Update things to def values (except taxRate)
        updateString(priceArray)
            // vars
            subtotal = 0
            taxAdded = 0
            checkoutCost = 0
            itemCount = 0
        
        // Update labels and vars
        updateVars()
        updateLabels()
        
        
    }
    
    
    
    
    
    
    // ********** Functions **********
    
    // This file calls the following functions:
    /*
    updateString(someArray: [Double])
    
    */
    
    // Update all labels with one Swift stroke (and the textView)
    func updateLabels() {
        subtotalLabel.text = format(subtotal)
        taxAddedLabel.text = format(taxAdded)
        checkoutLabel.text = format(checkoutCost)
        
        itemCountLabel.text = mkItemString(itemCount)
        
        updateString(priceArray)
        priceListView.text = priceListString
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("ListView loaded")
        printVars()
    
        // update labels and vars
        updateVars()
        updateLabels()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

