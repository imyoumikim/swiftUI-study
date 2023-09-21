//
//  ButtonType.swift
//  swiftUI-sec7-calculator
//
//  Created by 김유미 on 2023/09/21.
//

import Foundation
import SwiftUI

enum ButtonType: String {
    
    case one, two, three, four, five, six, seven, eight, nine, zero
    case point, equal, plus, minus, multiply, divide
    case percent, opposite, clear
        
    var buttonTitle: String {
        switch self {
        case .zero:
            return "0"
        case .one:
            return "1"
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6"
        case .seven:
            return "7"
        case .eight:
            return "8"
        case .nine:
            return "9"
        case .point:
            return "."
        case .equal:
            return "="
        case .percent:
            return "%"
        case .plus:
            return "+"
        case .minus:
            return "-"
        case .multiply:
            return "×"
        case .divide:
            return "÷"
        case .clear:
            return "AC"
        case .opposite:
            return "+/-"
        }
    }
    
    var btBackgroundColor: Color {
        switch self {
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero, .point:
            return Color(red: 0.2, green: 0.2, blue: 0.2)
        case .equal, .plus, .minus, .multiply, .divide:
            return .orange
        case .percent, .opposite, .clear:
            return .gray
        }
    }
    
    var btForegroundColor: Color {
        switch self {
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero, .point, .equal, .plus, .minus, .multiply, .divide:
            return .white
        case .percent, .opposite, .clear:
            return .black
        }
    }
}
