//
//  CalculatorButton.swift
//  calculator-app
//
//  Created by FURKAN AYAZ on 8.12.2024.
//

import SwiftUI

struct CalculatorButton: View {
    var expression: AnyCalculatorUIModel
    var onClick: (Character) -> Void
    
    var body: some View {
        Button(action: {
            switch (expression.buttonText) {
                case Actions.clear.buttonText: return
                case Actions.negative.buttonText: return
                case Actions.percent.buttonText: return
                default: onClick(expression.buttonText)
            }
        }, label: {
            RoundedRectangle(cornerRadius: 50, style: .circular).frame(width: expression.buttonSize.width, height: expression.buttonSize.height, alignment: .center).foregroundStyle(expression.buttonColor).shadow(color: .black.opacity(0.5), radius: 1, y: 3).overlay(content: {
                Text(String(expression.buttonText)).font(.system(size: 35, weight: .light)).foregroundStyle(.black)
            })
        })
    }
}

#Preview {
    CalculatorButton(expression: AnyCalculatorUIModel(Keys.Zero), onClick: { text in /* no-op */ })
}
