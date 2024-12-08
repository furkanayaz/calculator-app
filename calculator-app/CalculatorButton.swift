//
//  CalculatorButton.swift
//  calculator-app
//
//  Created by FURKAN AYAZ on 8.12.2024.
//

import SwiftUI

struct CalculatorButton: View {
    var expression: CalculatorUIModel
    
    var body: some View {
        Button(action: {
            
        }, label: {
            Circle().frame(width: expression.buttonSize.width, height: expression.buttonSize.height, alignment: .center).foregroundStyle(expression.buttonColor).overlay(content: {
                Text(expression.buttonText).font(.system(size: 35, weight: .light)).foregroundStyle(.black)
            })
        })
    }
}

#Preview {
    CalculatorButton(expression: Keys.Zero)
}
