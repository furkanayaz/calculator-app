//
//  ContentView.swift
//  calculator-app
//
//  Created by FURKAN AYAZ on 8.12.2024.
//

import SwiftUI

struct CalculatorScreen: View {
    var body: some View {
        GeometryReader { geo in
            VStack {
                ZStack(alignment: .center, content: {
                    Text("0").foregroundStyle(.black).font(.system(size: 100)).fontWeight(.semibold).background(.yellow)
                }).frame(width: geo.size.width, height: geo.size.height / 2.25)
                
                VStack(alignment: .center, spacing: 10) {
                    let actions: [[AnyCalculatorUIModel]] = [[AnyCalculatorUIModel(Actions.clear), AnyCalculatorUIModel(Actions.negative), AnyCalculatorUIModel(Actions.percent), AnyCalculatorUIModel(Operators.divide)], [AnyCalculatorUIModel(Keys.Seven), AnyCalculatorUIModel(Keys.Eight), AnyCalculatorUIModel(Keys.Nine), AnyCalculatorUIModel(Operators.multiplus)],[AnyCalculatorUIModel(Keys.Four), AnyCalculatorUIModel(Keys.Five), AnyCalculatorUIModel(Keys.Six), AnyCalculatorUIModel(Operators.minus)],[AnyCalculatorUIModel(Keys.One), AnyCalculatorUIModel(Keys.Two), AnyCalculatorUIModel(Keys.Three), AnyCalculatorUIModel(Operators.plus)],[AnyCalculatorUIModel(Keys.Zero), AnyCalculatorUIModel(Keys.Decimal), AnyCalculatorUIModel(Operators.equal)]]
                    
                    ForEach(0..<actions.count, id: \.self) { index in
                        HStack(alignment: .center, spacing: 20) {
                            ForEach(actions[index]) { action in
                                CalculatorButton(expression: action)
                            }
                        }
                    }
                }
            }
        }.background(LinearGradient(colors: [Color.bgFirst, Color.bgSecond], startPoint: .top, endPoint: .bottom))
    }
}

#Preview {
    CalculatorScreen()
}
