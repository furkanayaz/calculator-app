//
//  ContentView.swift
//  calculator-app
//
//  Created by FURKAN AYAZ on 8.12.2024.
//

import SwiftUI

final private class CalculatorScreenVM: ObservableObject {
    @Published var displayValue: String = ""
    
    let actions: [[AnyCalculatorUIModel]] = [[AnyCalculatorUIModel(Actions.clear), AnyCalculatorUIModel(Actions.negative), AnyCalculatorUIModel(Actions.percent), AnyCalculatorUIModel(Operators.divide)], [AnyCalculatorUIModel(Keys.Seven), AnyCalculatorUIModel(Keys.Eight), AnyCalculatorUIModel(Keys.Nine), AnyCalculatorUIModel(Operators.multiplus)],[AnyCalculatorUIModel(Keys.Four), AnyCalculatorUIModel(Keys.Five), AnyCalculatorUIModel(Keys.Six), AnyCalculatorUIModel(Operators.minus)],[AnyCalculatorUIModel(Keys.One), AnyCalculatorUIModel(Keys.Two), AnyCalculatorUIModel(Keys.Three), AnyCalculatorUIModel(Operators.plus)],[AnyCalculatorUIModel(Keys.Zero), AnyCalculatorUIModel(Keys.Decimal), AnyCalculatorUIModel(Operators.equal)]]
    
    func handleAction(action: AnyCalculatorUIModel, text: Character) throws {
        switch (displayValue.last) {
        case Operators.divide.buttonText: throw CalculationError.InvalidFormat
            case Operators.multiplus.buttonText: throw CalculationError.InvalidFormat
            case Operators.minus.buttonText: throw CalculationError.InvalidFormat
            case Operators.plus.buttonText: throw CalculationError.InvalidFormat
            default: if action.buttonText == Operators.equal.buttonText {
                calculate()
            }
        }
    }
    
    private func calculate() {
        
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
                    ForEach(0..<viewModel.actions.count, id: \.self) { index in
                        HStack(alignment: .center, spacing: 20) {
                            ForEach(viewModel.actions[index]) { action in
                                CalculatorButton(expression: action, onClick: { text in
                                    viewModel.displayValue += String(text)
                                    
                                    do {
                                        try viewModel.handleAction(action: action, text: text)
                                    } catch {
                                        print(error.localizedDescription)
                                    }
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
