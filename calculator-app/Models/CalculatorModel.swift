//
//  CalculatorModel.swift
//  calculator-app
//
//  Created by FURKAN AYAZ on 8.12.2024.
//

import Foundation
import SwiftUI

protocol CalculatorUIModel: Identifiable {
    var buttonText: String { get }
    var buttonColor: Color { get }
    var buttonSize: CGSize { get }
}

enum Keys: String, CalculatorUIModel {
    var id: String { self.rawValue }
    
    case Decimal = "."
    case Zero = "0"
    case One = "1"
    case Two = "2"
    case Three = "3"
    case Four = "4"
    case Five = "5"
    case Six = "6"
    case Seven = "7"
    case Eight = "8"
    case Nine = "9"
    
    var buttonText: String { get { self.rawValue } }
    
    var buttonColor: Color {
        get {
            Color.num
        }
    }
    
    var buttonSize: CGSize {
        get {
            switch (self) {
            case .Zero: CGSize(width: 160, height: 80)
            default: CGSize(width: 80, height: 80)
            }
        }
    }
}

enum Operators: String, CalculatorUIModel {
    var id: String { self.rawValue }
    
    case multiplus = "x"
    case divide = "÷"
    case plus = "+"
    case minus = "-"
    case equal = "="
    
    var buttonText: String { get { self.rawValue } }
    
    var buttonColor: Color {
        get {
            switch (self) {
            case .divide, .multiplus, .plus, .minus, .equal: Color.voperator
            }
        }
    }
    
    var buttonSize: CGSize {
        get {
            CGSize(width: 80, height: 80)
        }
    }
}

enum Actions: String, CalculatorUIModel {
    var id: String { self.rawValue }
    
    case negative = "-/+"
    case clear = "AC"
    case percent = "%"
    
    var buttonText: String { get { self.rawValue } }
    
    var buttonColor: Color {
        get {
            switch (self) {
            case .clear, .negative, .percent: Color.hoperator
            }
        }
    }
    
    var buttonSize: CGSize {
        get {
            CGSize(width: 80, height: 80)
        }
    }
}
