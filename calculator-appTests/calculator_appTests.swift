//
//  calculator_appTests.swift
//  calculator-appTests
//
//  Created by FURKAN AYAZ on 8.12.2024.
//

import XCTest
@testable import calculator_app

final class calculator_appTests: XCTestCase {
    var calculationValue: String = ""
    
    func testCalculation_add_with8And9_expected17() {
        calculationValue = "8+9"
        let expression = NSExpression(format: calculationValue)
        
        let result = expression.expressionValue(with: nil, context: nil) as? Double
        
        calculationValue = String(result ?? 0.0)
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result, 17.0)
        XCTAssertEqual(calculationValue, "17.0")
    }
    
    func testCalculation_subtract_with35And13_expected22() {
        calculationValue = "35-13"
        let expression = NSExpression(format: calculationValue)
        
        let result = expression.expressionValue(with: nil, context: nil) as? Double
        
        calculationValue = String(result ?? 0)
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result, 22.0)
        XCTAssertEqual(calculationValue, "22.0")
    }
    
    func testCalculation_multiply_with5And6_expected30() {
        calculationValue = "5*6"
        let expression = NSExpression(format: calculationValue)
        
        let result = expression.expressionValue(with: nil, context: nil) as? Double
        
        calculationValue = String(result ?? 0)
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result, 30.0)
        XCTAssertEqual(calculationValue, "30.0")
    }
    
    func testCalculation_divide_with20And4_expected5() {
        calculationValue = "20 / 4"
        let expression = NSExpression(format: calculationValue)
        
        let result = expression.expressionValue(with: nil, context: nil) as? Double
        
        calculationValue = String(result ?? 0)
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result, 5.0)
        XCTAssertEqual(calculationValue, "5.0")
    }
    
    func testCalculation_complexCalculation_expectedCorrectResult() {
        calculationValue = "(20 + 10) * 6 / 4"
        let modResult = NSExpression.modulus(format: calculationValue, modBy: 2)
        
        calculationValue = String(modResult)
        
        XCTAssertNotNil(modResult)
        XCTAssertEqual(modResult, 1.0)
        XCTAssertEqual(calculationValue, "1.0")
    }
    
    func testCalculation_negativeCalculation_expectedGreaterThan0() {
        calculationValue = "5 * 7 * -1"
        let expression = NSExpression(format: calculationValue)
        
        let result = (expression.expressionValue(with: nil, context: nil) as? Int) ?? 0
        
        calculationValue = String(result)
        
        XCTAssertNotNil(result)
        XCTAssertLessThan(result, 0)
        XCTAssertEqual(calculationValue, "\(result)")
    }
}
