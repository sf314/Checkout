//
//  ViewController.swift
//  Checkout
//
//  Created by Stephen Flores on 11/15/15.
//  Copyright © 2015 Stephen Flores. All rights reserved.
//

import UIKit


// *** To do:
/*
 
*/
// ***





class ListViewController: UIViewController {
    
    // Vars
    
    // MARK: - UI
    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var checkoutLabel: UILabel!
    @IBOutlet weak var taxAddedLabel: UILabel!
    @IBOutlet var priceListView: UITextView!
    
    // MARK: - Buttons
    @IBAction func removeLastEntry() {
        cart.undo()
        updateLabels()
    }
    
    @IBAction func removeAllEntries() {
        // Rempve all arreay elements
        cart.clear()
        updateLabels()
    }
    
    
    
    
    
    
    // MARK: - Functions
    
    // Update all labels with one Swift stroke (and the textView)
    func updateLabels() {
        subtotalLabel.text = cart.subtotal()
        taxAddedLabel.text = cart.taxAdded()
        checkoutLabel.text = cart.checkoutCost()
        
        itemCountLabel.text = cart.itemCount()
        priceListView.text = cart.priceList()
    }
    
    
    
    // MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("ListView loaded")
        print("currentRate = \(cart.currentRate)")
        //printVars()
        updateLabels()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

