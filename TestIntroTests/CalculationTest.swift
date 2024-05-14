//
//  CalculationTest.swift
//  TestIntroTests
//
//  Created by Martin Wainaina on 14/05/2024.
//

import XCTest
@testable import TestIntro

final class CalculationTest: XCTestCase {
    
    func testSuccessFullTipCalculation() {
        // Given / Arrange
        let enteredAmount = 100.00
        let tipSlider = 25.00
        let calculation = Calculation()
        
        // When / Act
        let tip = calculation.calculateTip(of: enteredAmount, with: tipSlider)
        
        // Then / Assert
        XCTAssertEqual(tip, 25, "DEBUG: Assert that the result is the expected result.")

    }
    
    func testNegativeEnteredAmountTipCalculation() {
        // Given / Arrange
        let enteredAmount = -100.00
        let tipSlider = 25.00
        let calculation = Calculation()
        
        // When / Act
        let tip = calculation.calculateTip(of: enteredAmount, with: tipSlider)
        
        // Then / Assert
        XCTAssertNil(tip, "DEBUG: Assert that entered amount can not be negative")

    }
}
