//
//  ClockTick.swift
//  swiftUI-sec5-stopwatch
//
//  Created by 김유미 on 2023/09/20.
//

import Foundation
import SwiftUI

// 눈금
struct ClockTick: View {
    var tickCount = 60
    
    var body: some View{
        ZStack {
            ForEach(0..<tickCount) { tick in
                Rectangle()
                    .fill(.black)
                    .frame(width: 1, height: tick % 5 == 0 ? 30 : 20)   // 5마다 길게
                    .offset(y: 100)
                    .rotationEffect(.degrees(Double(tick) / Double(tickCount) * 360))
            }
        }
    }
}

struct MilliClockTick: View {
    var tickCount = 10
    
    var body: some View{
        ZStack {
            ForEach(0..<tickCount) { tick in
                Rectangle()
                    .fill(.black)
                    .frame(width: 1, height: 10)
                    .offset(y: 25)
                    .rotationEffect(.degrees(Double(tick) / Double(tickCount) * 360))
            }
        }
    }
}
