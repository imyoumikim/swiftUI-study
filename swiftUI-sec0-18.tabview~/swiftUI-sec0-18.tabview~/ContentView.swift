//
//  ContentView.swift
//  swiftUI-sec0-18.tabview~
//
//  Created by 김유미 on 2023/09/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView{
            First()
                .tabItem {
                    Image(systemName: "paperplane")
                    Text("ScrollView")
                }
            
            Second()
                .tabItem {
                    Image(systemName: "togglepower")
                    Text("toggle")
                }
            
            Third()
                .tabItem {
                    Image(systemName: "highlighter")
                    Text("TextEditor")
                }
        }
    }
}

struct First: View {
    
    @State private var proxy: ScrollViewProxy?

    var body: some View {
        
        VStack {
            Button("Scroll To") {
                withAnimation(.easeInOut) {
                    proxy?.scrollTo(20, anchor: .top)
                }
            }
            
            ScrollView {
                
                ScrollViewReader(content: { proxy in
                    
                    ForEach(0..<50) { index in
                        Text("\(index)")
                            .padding()
                            .id(index)  // 지정해줘야 함
                    }
                    .onAppear(perform: {
                        self.proxy = proxy
                    })
                })
                
            }
        }
        
    }
}

// Custom Toggle
struct Second: View {
    @State private var isOn = false
    
    var body: some View {
        Toggle("\(isOn.description)", isOn: $isOn)
            .toggleStyle(CustomToggle())
            .frame(width: 300, height: 50)
    }
}

struct CustomToggle: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        // Design
        RoundedRectangle(cornerRadius : 100)
            .foregroundColor(configuration.isOn ? .red : .blue)
            .overlay(
                GeometryReader(content: { geometry in
                    
                    ZStack {
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: geometry.size.height)
                        Text(configuration.isOn ? "On" : "Off")
                    }
                    .offset(x: configuration.isOn ? geometry.frame(in: .local).minX : geometry.frame(in: .local).maxX - geometry.size.height)
                    .animation(.easeOut(duration: 0.25))
                    .shadow(radius: 10)
                })
            )
            .clipShape(Capsule())
            .onTapGesture(count: 1, perform: {
                configuration.isOn.toggle()
            })
        
    }
    
}

struct Third: View {
    @State private var inputText = ""
    
    var body: some View {
        VStack{
            TextEditor(text: $inputText)
                .lineSpacing(20)
                .font(.title)
                .autocorrectionDisabled(true)
                .onChange(of: inputText, perform: { newValue in
                    if inputText.count > 100 {  // 글자수 제한
                        inputText.removeLast()
                    }
                })
            HStack{
                Spacer()
                Text("\(inputText.count)" + " / 100")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
