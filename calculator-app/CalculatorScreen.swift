//
//  ContentView.swift
//  calculator-app
//
//  Created by FURKAN AYAZ on 8.12.2024.
//

import SwiftUI

final private class CalculatorScreenVM: ObservableObject {
    @Published var displayValue: String = ""
    @Published var errorMessage: String = ""
    
    var isOperator: Bool = false
    var isAction: Bool = false
    
    let actions: [[AnyCalculatorUIModel]] = [[AnyCalculatorUIModel(Actions.clear), AnyCalculatorUIModel(Actions.negative), AnyCalculatorUIModel(Actions.percent), AnyCalculatorUIModel(Operators.divide)], [AnyCalculatorUIModel(Keys.Seven), AnyCalculatorUIModel(Keys.Eight), AnyCalculatorUIModel(Keys.Nine), AnyCalculatorUIModel(Operators.multiplus)],[AnyCalculatorUIModel(Keys.Four), AnyCalculatorUIModel(Keys.Five), AnyCalculatorUIModel(Keys.Six), AnyCalculatorUIModel(Operators.minus)],[AnyCalculatorUIModel(Keys.One), AnyCalculatorUIModel(Keys.Two), AnyCalculatorUIModel(Keys.Three), AnyCalculatorUIModel(Operators.plus)],[AnyCalculatorUIModel(Keys.Zero), AnyCalculatorUIModel(Keys.Decimal), AnyCalculatorUIModel(Operators.equal)]]
    
    func handleClick(model: AnyCalculatorUIModel, text: Character) {
        if Keys.checkIfExists(id: model.buttonText) {
            handleKey(key: model.buttonText)
        }
        
        if Operators.checkIfExists(id: model.buttonText) {
            do {
                try handleOperator(key: model.buttonText)
            } catch CalculationError.InvalidFormat {
                setErrorMessage(with: "Invalid format!")
            } catch {
                setErrorMessage(with: "Unknown error!")
            }
        }
        
        if Actions.checkIfExists(id: model.buttonText) {
            do {
                try handleAction(key: model.buttonText)
            } catch CalculationError.InvalidFormat {
                setErrorMessage(with: "Invalid format!")
            } catch {
                setErrorMessage(with: "Unknown error!")
            }
        }
    }
    
    func handleKey(key: Character) {
        displayValue += String(key)
    }
    
    func handleOperator(key: Character) throws {
        //if isOperator { throw CalculationError.InvalidFormat }
        if key == Operators.equal.buttonText {
            calculate()
            return
        }
        displayValue += String(key)
    }
    
    func handleAction(key: Character) throws {
        //if isAction { throw CalculationError.InvalidFormat }
        displayValue += String(key)
    }
    
    func handleAction(action: AnyCalculatorUIModel, text: Character) throws {
        switch (displayValue.last) {
        case Operators.divide.buttonText: throw CalculationError.InvalidFormat
            case Operators.multiplus.buttonText: throw CalculationError.InvalidFormat
            case Operators.minus.buttonText: throw CalculationError.InvalidFormat
            case Operators.plus.buttonText: throw CalculationError.InvalidFormat
            default: calculate()
        }
    }
    
    private func calculate() {
        let expression = NSExpression(format: displayValue)
        guard let result = (expression.expressionValue(with: nil, context: nil) as? Double) else {
            displayValue = "Calculation error!"
            return
        }
        
        displayValue = String(result)
    }
    
    private func setErrorMessage(with msg: String) {
        errorMessage = msg
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
                                    viewModel.handleClick(model: action, text: text)
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
