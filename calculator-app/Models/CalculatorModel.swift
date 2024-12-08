//
//  CalculatorModel.swift
//  calculator-app
//
//  Created by FURKAN AYAZ on 8.12.2024.
//

import Foundation
import SwiftUI

protocol BaseCalculatorUIModel: Identifiable {
    var id: String { get }
    var buttonText: String { get }
    var buttonColor: Color { get }
    var buttonSize: CGSize { get }
}

struct AnyCalculatorUIModel: BaseCalculatorUIModel {
    var id: String
    var buttonText: String
    var buttonColor: Color
    var buttonSize: CGSize
    
    init<T: BaseCalculatorUIModel>(_ base: T) {
        self.id = base.id
        self.buttonText = base.buttonText
        self.buttonColor = base.buttonColor
        self.buttonSize = base.buttonSize
    }
}

enum Keys: String, BaseCalculatorUIModel {
    case Zero, Decimal, One, Two, Three, Four, Five, Six, Seven, Eight, Nine
    
    var id: String {
        get {
            switch self {
                case .Decimal: return "."
                case .Zero: return "0"
                case .One: return "1"
                case .Two: return "2"
                case .Three: return "3"
                case .Four: return "4"
                case .Five: return "5"
                case .Six: return "6"
                case .Seven: return "7"
                case .Eight: return "8"
                case .Nine: return "9"
            }
        }
    }
    
    var buttonText: String { get { id } }
    
    var buttonColor: Color {
        get {
            Color.key
        }
    }
    
    var buttonSize: CGSize {
        get {
            switch (self) {
            case .Zero: CGSize(width: 180, height: 80)
            default: CGSize(width: 80, height: 80)
            }
        }
    }
}

enum Operators: String, BaseCalculatorUIModel {
    case multiplus, divide, plus, minus, equal
    
    var id: String {
        get {
            switch self {
                case .multiplus: return "x"
                case .divide: return "÷"
                case .plus: return "+"
                case .minus: return "-"
                case .equal: return "="
            }
        }
    }
    
    var buttonText: String { get { id } }
    
    var buttonColor: Color {
        get {
            switch (self) {
            case .divide, .multiplus, .plus, .minus, .equal: Color.operator
            }
        }
    }
    
    var buttonSize: CGSize {
        get {
            CGSize(width: 80, height: 80)
        }
    }
}

enum Actions: String, BaseCalculatorUIModel {
    case negative, clear, percent
    
    var id: String {
        get {
            switch self {
            case .negative: return "-/+"
            case .clear: return "AC"
            case .percent: return "%"
            }
        }
    }
    
    var buttonText: String { get { id } }
    
    var buttonColor: Color {
        get {
            switch (self) {
            case .clear, .negative, .percent: Color.action
            }
        }
    }
    
    var buttonSize: CGSize {
        get {
            CGSize(width: 80, height: 80)
        }
    }
}
