//
//  ContentView.swift
//  calculator-app
//
//  Created by FURKAN AYAZ on 8.12.2024.
//

import SwiftUI

struct CalculatorScreen: View {
    var body: some View {
        VStack {
            GeometryReader { geo in
                ZStack(alignment: .center, content: {
                    Text("0").foregroundStyle(.black).font(.system(size: 100)).fontWeight(.semibold)
                }).frame(width: geo.size.width, height: geo.size.height / 2.25)
                
                
            }
        }.background(LinearGradient(colors: [Color.bgFirst, Color.bgSecond], startPoint: .top, endPoint: .bottom))
    }
}

#Preview {
    CalculatorScreen()
}
