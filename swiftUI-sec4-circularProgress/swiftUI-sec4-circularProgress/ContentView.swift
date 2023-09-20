//
//  ContentView.swift
//  swiftUI-sec4-circularProgress
//
//  Created by 김유미 on 2023/09/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var progress: CGFloat = 0
    
    var body: some View {
        VStack {
            Slider(value: $progress)
            
            ZStack {
                
                Circle()
                    .stroke(.gray.opacity(0.4), lineWidth: 20)
                
                Circle()
                    .trim(from: 0, to: progress)
//                    .stroke(.red, lineWidth: 20)
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .fill(progress == 1 ? .green : .red)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut)
                
                Text("\(String(format: "%.1f", (progress * 100)))%")
                    .font(.largeTitle)
                    .foregroundColor(progress)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
