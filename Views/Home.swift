//
//  Home.swift
//  Calculator
//
//  Created by Beketay Symbat on 27.03.2024.
//

import SwiftUI

struct Home: View {
    
    @State var displayValue = "0"
    @State var computeValue = 0.0
    @State var currentOperation: Operation = .none

    //Buttons
    let buttons: [[CalculatorButtons]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                //MARK: Display
                Spacer()
                HStack{
                    Spacer()
                    Text("\(displayValue)")
                        .bold()
                        .font(.system(size: 100))
                        .foregroundStyle(.white)
                }
                .padding()
                
                //MARK: Buttons
                ForEach(buttons, id: \.self) { row in
                    
                    HStack(spacing: 12){
                        ForEach(row, id: \.self){ item in
                            Button{
                                self.didTap(button: item)
                            } label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(width: self.buttonWidth(item: item), height: self.buttonHeight())
                                    .background(item.buttonColor)
                                    .clipShape(.rect(cornerRadius: self.buttonWidth(item: item) / 2))
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                    .padding(.bottom, 3)
                }
            }
        }
    }
    
    //  Button Width
    func buttonWidth(item: CalculatorButtons) -> CGFloat {
        if item == .zero {
            return ((UIScreen.main.bounds.width - (4 * 12)) / 4 ) * 2
        }
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    
    // MARK: DidTap function
    func didTap(button: CalculatorButtons){
        switch button {
        case .add, .subtract, .multiply, .divide, .equal:
            if button == .add {
                self.currentOperation = .add
                self.computeValue = Double(self.displayValue) ?? 0
            } else if button == .subtract {
                self.currentOperation = .subtract
                self.computeValue = Double(self.displayValue) ?? 0
            } else if button == .multiply {
                self.currentOperation = .multiply
                self.computeValue = Double(self.displayValue) ?? 0
            } else if button == .divide {
                self.currentOperation = .divide
                self.computeValue = Double(self.displayValue) ?? 0
            } else if button == .equal {
                let runningValue = self.computeValue
                let currentValue = Double(self.displayValue) ?? 0
                switch self.currentOperation {
                case .add:
                    self.displayValue = "\(runningValue + currentValue)"
                case .subtract:
                    self.displayValue = "\(runningValue - currentValue)"
                case .multiply:
                    self.displayValue = "\(runningValue * currentValue)"
                case .divide:
                    self.displayValue = "\(runningValue / currentValue)"
                default:
                    break
                }
            }
            
            if button != .equal {
                self.displayValue = "0"
            }
        case .clear:
            self.displayValue = "0"
        case .decimal, .negative, .percent:
            if button == .decimal {
                self.displayValue = "\(self.displayValue)."
            } else if button == .negative {
                var value = Double(self.displayValue) ?? 1
                
                self.displayValue = "\(value * -1)22"
            }
        default:
            let number = button.rawValue
            if self.displayValue == "0" || self.currentOperation == .add || self.currentOperation == .subtract || self.currentOperation == .multiply || self.currentOperation == .divide{
                displayValue = number
            } else {
                self.displayValue = "\(self.displayValue)\(number)"
            }
            
        }
    }
}

#Preview {
    Home()
}
