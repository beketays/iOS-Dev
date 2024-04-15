//
//  CalculatorButtons.swift
//  Calculator
//
//  Created by Beketay Symbat on 27.03.2024.
//

import SwiftUI

enum CalculatorButtons: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    case equal = "="
    case decimal = "."
    case clear = "AC"
    case percent = "%"
    case negative = "-/+"

    var buttonColor: Color{
        switch self {
        case .add, .subtract, .multiply, .divide, .equal:
            return .orange
        case .clear, .percent, .negative:
            return Color(.lightGray)
        default:
            return Color(.darkGray)
        }
    }
}

enum Operation{
    case add, subtract, multiply, divide, none
}
