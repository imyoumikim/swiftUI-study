//
//  ContentView.swift
//  swiftUI-sec0
//
//  Created by 김유미 on 2023/09/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.gray
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("World")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                    .padding(.bottom, 50)
                HStack{
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
                Text("Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello")
                    .truncationMode(.tail)
                    .lineSpacing(10)
                    .frame(width: 200, height: 100)
                    .background(.cyan)
                    .cornerRadius(20)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
