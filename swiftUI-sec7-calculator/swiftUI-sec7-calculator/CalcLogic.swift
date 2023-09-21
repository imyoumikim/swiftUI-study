//
//  CalcLogic.swift
//  swiftUI-sec7-calculator
//
//  Created by 김유미 on 2023/09/21.
//

import Foundation
class CalcLogic {
    var digit1: Double? = 0
    var digit2: Double? = nil
    
    var calculateResult: Double? = nil
    var rememberSymbol: String? = nil
    
    func operation() -> Double? {
        
        if digit2 == nil, rememberSymbol == nil {   // 피연산자1만 존재할 때
            return digit1
        } else if digit2 == nil {   // 피연산자1, 연산자만 존재할 때
            digit2 = digit1
        }
        
        guard let safeDigit1 = digit1, let safeDigit2 = digit2 else {   // 피연산자 2개 모두 없으면 nil
            return nil
        }
        
        switch rememberSymbol{
        case "+":
            calculateResult = safeDigit1 + safeDigit2
        case "-":
            calculateResult = safeDigit1 - safeDigit2
        case "×":
            calculateResult = safeDigit1 * safeDigit2
        case "÷":
            calculateResult = safeDigit1 / safeDigit2
        case "+/-":
            calculateResult = -safeDigit1
        case "%":
            calculateResult = safeDigit1 * 0.01
        default:
            break
        }
        
        return calculateResult
        
    }
    
}
