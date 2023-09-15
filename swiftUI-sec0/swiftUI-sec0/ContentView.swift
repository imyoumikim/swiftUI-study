//
//  ContentView.swift
//  swiftUI-sec0
//
//  Created by 김유미 on 2023/09/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//                ZStack {
//                    Color.gray
//                        .edgesIgnoringSafeArea(.all)
//                    VStack{
//                        Text("World")
//                            .font(.largeTitle)
//                            .foregroundColor(.white)
//                            .bold()
//                            .padding(.bottom, 50)
//                        HStack{
//                            Text("Hello, world!")
//                            Text("Hello, world!")
//                        }
//                        Text("Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello")
//                            .truncationMode(.tail)
//                            .lineSpacing(10)
//                            .frame(width: 200, height: 100)
//                            .background(.cyan)
//                            .cornerRadius(20)
//                    }
//                }
        VStack{
            Image(systemName: "sunrise")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.pink)
            Image("푸바오")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .aspectRatio(contentMode: .fit)
                .mask(
                    HStack(spacing: 0){
                        VStack(spacing: 0){
                            Circle()
                            Circle()
                            Circle()
                        }
                        VStack(spacing: 0){
                            Circle()
                            Circle()
                            Circle()
                        }
                        VStack(spacing: 0){
                            Circle()
                            Circle()
                            Circle()
                        }
                    }
                ).frame(width: 300, height: 300)
            HStack{
                Rectangle()
                    .stroke(Color.orange, style: StrokeStyle(lineWidth: 5, lineCap: .round, dash: [10, 20]))
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.yellow, style: StrokeStyle(lineWidth: 5))
                Circle()
                    .stroke(Color.green, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, dash: [10, 10]))
            }
            .frame(width: 300)
            HStack{
                Capsule()
                    .fill(Color.blue)
                Ellipse()
                    .fill(Color.purple)
            }
            .frame(width: 300)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
