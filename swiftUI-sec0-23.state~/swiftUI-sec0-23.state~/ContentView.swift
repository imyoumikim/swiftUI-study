//
//  ContentView.swift
//  swiftUI-sec0-23.state~
//
//  Created by 김유미 on 2023/09/18.
//

import SwiftUI

struct ContentView: View {
//    @State private var myName = "kim"
//    var body: some View {
//        VStack {
//            Text(myName)
//                .padding()
//            Button("change name") {
//                myName = "lee"
//            }
//            TextField("TF Title", text: $myName)
//        }
//    }
    
    @State private var myBool = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                NavigationLink(destination: DetailView(mainToggleValue: $myBool)
                ) {
                    Text("Navigate")
                }
                Toggle(myBool.description, isOn: $myBool)

            }// 현재 View와 DetailView가 같은 값을 사용
        }
        
    }
}

struct DetailView: View {
    @Binding var mainToggleValue: Bool
    
    var body: some View {
        Toggle("detail toggle", isOn: $mainToggleValue)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
