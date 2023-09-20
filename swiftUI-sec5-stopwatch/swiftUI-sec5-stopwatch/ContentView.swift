//
//  ContentView.swift
//  swiftUI-sec5-stopwatch
//
//  Created by 김유미 on 2023/09/20.
//

import SwiftUI

struct ContentView: View {
    @State private var time: Double = 0   // 초 단위
    
    var humanReadableTime: String {
        let sec = String(format: "%02d", Int(time) % 60)
        let min = String(format: "%02d", Int(time) / 60)
        
        let milliSec = String(format: "%.2f", time.truncatingRemainder(dividingBy: 1)).split(separator: ".").last ?? "0"
        
        return "\(min) : \(sec) : \(milliSec)"
    }
    
    @State private var isStart = false
    
    var timer = Timer.publish(every: 0.01, on: .current, in: .default).autoconnect()
    // autoconnect() : 구독하는 곳이 없어지면 자동으로 현 객체도 없어지는 기능
    
    var body: some View {
        VStack {
            ZStack {
                ClockTick()
                ClockNumber()
                
                SecondHand(sec: time)
                MinuteHand(sec: time)
                
                CenterCircle()
                
                MilliClockTick()
                    .offset(y: 50)
                HundredMilliSecHand(sec: time)
                    .offset(y: 50)
                CenterCircle()
                    .offset(y: 50)
            }
            .padding(.bottom, 120)
            
            StartStopButton(time: $time, isStart: $isStart)
                .padding(.bottom, 20)
            
            Text(humanReadableTime)
                .font(.largeTitle)
        }
        .onReceive(timer, perform: { _ in
            withAnimation { // 100밀리초침이 부드럽게 돌아가도록
                if isStart {
                    self.time += 0.01
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
