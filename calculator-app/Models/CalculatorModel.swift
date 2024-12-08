//
//  CalculatorModel.swift
//  calculator-app
//
//  Created by FURKAN AYAZ on 8.12.2024.
//

import Foundation
import SwiftUI

enum Keys: String {
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
}

enum Operators: String {
    case percent = "%"
    case multiplus = "x"
    case divide = "÷"
    case plus = "+"
    case minus = "-"
    
    var buttonColor: Color {
        switch (self) {
        case .percent: Color("Hoperator")
        case .divide, .multiplus, .plus, .minus: Color("Voperator")
        }
    }
}

enum Actions: String {
    case negative = "-/+"
    case clear = "AC"
    case equal = "="
    
    var buttonColor: Color {
        switch (self) {
        case .clear, .negative: Color("Hoperator")
        case .equal: Color("Voperator")
        }
    }
}
