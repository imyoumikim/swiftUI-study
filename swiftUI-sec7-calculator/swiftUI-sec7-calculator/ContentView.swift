//
//  ContentView.swift
//  swiftUI-sec7-calculator
//
//  Created by 김유미 on 2023/09/21.
//

import SwiftUI

struct ContentView: View {

    @State private var display: String = "0"
    @State private var isTypingDigit = false

    var core = CalcLogic()

    private let buttonData: [[ButtonType]] = [
        [.clear, .opposite, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .point, .equal],
    ]

    func calcAction(symbol: String) { // 버튼이 눌릴 때마다 호출됨

        if Int(symbol) != nil { // 숫자일 때
            if isTypingDigit {
                display += symbol
            } else { // 처음 입력
                isTypingDigit = true
                display = symbol
            }

            if core.rememberSymbol == nil { // 숫자가 입력되었는데 연산자는 없는 상태 - 지금 입력되고 있는 값을 첫번째 피연산자로 저장
                core.digit1 = Double(display)
            } else { // 숫자가 입력되었는데 연산자가 있음 - 지금 입력되고 있는 값을 두번째 피연산자로 저장
                core.digit2 = Double(display)
            }

        } else { // 기호일 때
            if symbol != "=" { // =이 아니면 연산자 저장
                core.rememberSymbol = symbol
            } else { // = 선택
                let result = core.operation() ?? 0
                core.digit1 = result // 연산 결과를 첫번째 피연산자로 저장해야 다음에 바로 두번째 피연산자를 받을 수 있음

                if result.truncatingRemainder(dividingBy: 1) == 0 { // 정수
                    display = "\(String(describing: Int(result)))"
                } else { // 실수
                    display = "\(String(describing: result))"
                }
            }

            isTypingDigit = false // 타이핑 중지

            if symbol == "AC" {
                core.digit1 = nil
                core.digit2 = nil
                core.calculateResult = nil
                core.rememberSymbol = nil
                display = "0"
            } else if symbol == "%" {
                display = "\(String(describing: core.operation()!))"
                core.digit1 = Double(display)
            } else if symbol == "." {
                isTypingDigit = true
                display += symbol
            } else if symbol == "+/-" {
                display.insert("-", at: display.startIndex)
            }
        }
    }


    var body: some View {

        ZStack {

            Color.black.edgesIgnoringSafeArea(.all)

            VStack(spacing: 10) {
                Spacer(minLength: 50)

                Text(display)
                    .foregroundColor(.white)
                    .font(.system(size: 70))
                    .padding(.trailing, 20)
                    .frame(width: UIScreen.main.bounds.size.width, alignment: .trailing)

                ForEach(buttonData, id: \.self) { line in
                    HStack() {
                        ForEach(line, id: \.self) { item in
                            Button {
                                calcAction(symbol: item.buttonTitle)
                            } label: {
                                Capsule()
                                    .fill(item.btBackgroundColor)
                                    .frame(width: calculateButtonWidth(button: item), height: calculateButtonHeight(button: item))
                                    .overlay {
                                    Text(item.buttonTitle)
                                        .font(.largeTitle)
                                        .foregroundColor(item.btForegroundColor)
                                        .frame(width: calculateButtonWidth(button: item))
                                }
                            }
                        }
                    }
                }
            }
        }
    }

}

private func calculateButtonWidth(button buttonType: ButtonType) -> CGFloat {
    switch buttonType {
    case .zero:
        return (UIScreen.main.bounds.size.width - 5 * 10) / 4 * 2 + 10
    default:
        return (UIScreen.main.bounds.size.width - 5 * 10) / 4
    }
}

private func calculateButtonHeight(button buttonType: ButtonType) -> CGFloat {
    return (UIScreen.main.bounds.size.width - 5 * 10) / 4
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
