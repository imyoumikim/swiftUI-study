//
//  ClockNumber.swift
//  swiftUI-sec5-stopwatch
//
//  Created by 김유미 on 2023/09/20.
//

import Foundation
import SwiftUI

struct ClockNumber: View {
    var body: some View{
        let tickCount = 60
        
        ZStack {
            ForEach(0..<tickCount) { tick in
                if tick % 5 == 0 {
                    ZStack{
                        Text("\(tick)")
                            .rotationEffect(.degrees(Double(tick) / Double(tickCount) * -360))
                    }
                    .offset(y: -130)
                    .rotationEffect(.degrees(Double(tick) / Double(tickCount) * 360))
                }
            }
        }
    }
}
