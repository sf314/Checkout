//
//  CheckoutTests.swift
//  CheckoutTests
//
//  Created by Stephen Flores on 9/14/16.
//  Copyright © 2016 Stephen Flores. All rights reserved.
//

import XCTest

class CheckoutTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testRateToStringConversion() {
        let myCart = Cart()
        var testResult = ""
        
        testResult = myCart.rateToPercent(0.0885)
        XCTAssert(testResult == "8.85%", "Cart::rateToPercent() not formatting string correctly:\n\tReturned \(testResult)\n\tExpected '8.85%'")
        
        let thing = myCart.setRate(fromZip: 85395)
        print("thing = \(thing)")
        print("cart.currentRate = \(myCart.currentRate)")
        XCTAssert(myCart.currentRate == 0.088)
        testResult = myCart.rateToPercent(myCart.currentRate)
        XCTAssert(testResult == "8.8%", "Cart::setRate() not formatting string correctly:\n\tReturned \(testResult)\n\tExpected '8.8%'")
        
    }
    
    func testSetRateFromZip() {
        //let myCart = Cart()
    }
    
    func testZipcodeEdgeCases() {
        //let myCart = Cart()
        
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
