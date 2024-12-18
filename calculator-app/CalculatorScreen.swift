//
//  ContentView.swift
//  calculator-app
//
//  Created by FURKAN AYAZ on 8.12.2024.
//

import SwiftUI

final private class CalculatorScreenVM: ObservableObject {
    @Published var displayValue: String = ""
    
    func handleAction(action: Actions) {
        
    }
    
    func handleOperator(operator: Operators) {
        
    }
    
}

struct CalculatorScreen: View {
    @StateObject private var viewModel = CalculatorScreenVM()
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                ZStack(alignment: .center, content: {
                    Text(viewModel.displayValue).foregroundStyle(.black).font(.system(size: 100)).fontWeight(.semibold)/*.background(.yellow)*/
                }).frame(width: geo.size.width, height: geo.size.height / 2.25)
                
                VStack(alignment: .center, spacing: 10) {
                    let actions: [[AnyCalculatorUIModel]] = [[AnyCalculatorUIModel(Actions.clear), AnyCalculatorUIModel(Actions.negative), AnyCalculatorUIModel(Actions.percent), AnyCalculatorUIModel(Operators.divide)], [AnyCalculatorUIModel(Keys.Seven), AnyCalculatorUIModel(Keys.Eight), AnyCalculatorUIModel(Keys.Nine), AnyCalculatorUIModel(Operators.multiplus)],[AnyCalculatorUIModel(Keys.Four), AnyCalculatorUIModel(Keys.Five), AnyCalculatorUIModel(Keys.Six), AnyCalculatorUIModel(Operators.minus)],[AnyCalculatorUIModel(Keys.One), AnyCalculatorUIModel(Keys.Two), AnyCalculatorUIModel(Keys.Three), AnyCalculatorUIModel(Operators.plus)],[AnyCalculatorUIModel(Keys.Zero), AnyCalculatorUIModel(Keys.Decimal), AnyCalculatorUIModel(Operators.equal)]]
                    
                    ForEach(0..<actions.count, id: \.self) { index in
                        HStack(alignment: .center, spacing: 20) {
                            ForEach(actions[index]) { action in
                                CalculatorButton(expression: action, onClick: { text in
                                    viewModel.displayValue += text
                                })
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
