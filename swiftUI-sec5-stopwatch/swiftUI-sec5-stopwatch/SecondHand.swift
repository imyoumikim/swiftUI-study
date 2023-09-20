//
//  SecondHand.swift
//  swiftUI-sec5-stopwatch
//
//  Created by 김유미 on 2023/09/20.
//

import Foundation
import SwiftUI

struct SecondHand: View {   // 초침
    
    var sec: Double
    private var height: CGFloat = 80
    
    init(sec: Double) {
        self.sec = sec
    }
    
    var body: some View {
        Rectangle()
            .fill(.orange)
            .frame(width: 3, height: height)
            .offset(y: -height / 2)
            .rotationEffect(.degrees( sec / 60 * 360 ))
    }
}

struct MinuteHand: View {   // 분침
    
    var sec: Double
    private var height: CGFloat = 60
    
    init(sec: Double) {
        self.sec = sec
    }
    
    var body: some View {
        Rectangle()
            .fill(.blue)
            .frame(width: 3, height: height)
            .offset(y: -height / 2)
            .rotationEffect(.degrees( sec / 60 / 60 * 360 ))
    }
}

struct HundredMilliSecHand: View {  //100밀리초침
    var sec: Double
    private var height: CGFloat = 30
    
    init(sec: Double) {
        self.sec = sec
    }
    
    var body: some View {
        Rectangle()
            .fill(.gray)
            .frame(width: 3, height: height)
            .offset(y: -height / 2)
            .rotationEffect(.degrees( sec / 60 * 60 * 360 ))
    }
}

struct CenterCircle: View {
    var body: some View {
        Circle()
            .fill(.black)
            .frame(width: 10, height: 10)
            
    }
}
