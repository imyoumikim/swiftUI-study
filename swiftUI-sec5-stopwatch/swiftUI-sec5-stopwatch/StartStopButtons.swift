//
//  StartStopButtons.swift
//  swiftUI-sec5-stopwatch
//
//  Created by 김유미 on 2023/09/20.
//

import Foundation
import SwiftUI

struct StartStopButton: View {
    
    @Binding var time: Double
    @Binding var isStart: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            Button(action: {
                isStart = true

            }, label: {
                Text("Start")
                    .frame(width: UIScreen.main.bounds.size.width / 2, height: 50)
                    .background(.orange)
            })
            Button(action: {
                if isStart {
                    isStart = false
                } else {    // 이미 멈췄는데 stop을 또 누른 경우 시간 초기화
                    time = 0
                }
            }, label: {
                Text("Stop")
                    .frame(width: UIScreen.main.bounds.size.width / 2, height: 50)
                    .background(.orange).opacity(0.7)
            })
        }
    }
}
