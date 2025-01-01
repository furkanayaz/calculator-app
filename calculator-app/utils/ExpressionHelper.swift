//
//  ExpressionHelper.swift
//  calculator-app
//
//  Created by FURKAN AYAZ on 1.01.2025.
//

import Foundation

extension NSExpression {
    static func modulus(format expressionParam: String, modBy: Double) -> Double {
        let expression = NSExpression(format: expressionParam)
        let result = expression.expressionValue(with: nil, context: nil) as? Double
        return (result ?? 0).truncatingRemainder(dividingBy: modBy)
    }
}
