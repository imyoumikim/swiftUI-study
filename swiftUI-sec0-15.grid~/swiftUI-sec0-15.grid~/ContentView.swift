//
//  ContentView.swift
//  swiftUI-sec0-15.grid~
//
//  Created by 김유미 on 2023/09/18.
//

import SwiftUI

struct ContentView: View {
    
    var columns: [GridItem] {
        [
            GridItem(.fixed(200)),
        ]
    }
    
    @State private var myString = "Hello World"
    @State private var showPlaceholder = false
    
    var body: some View {
        ScrollView(.horizontal){
            
            LazyHGrid(rows: columns) {
                VStack {
                    VStack {
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                        Text(myString)
                            .foregroundColor(.red)
                            .padding()
                    }
                    .redacted(reason: showPlaceholder ? .placeholder : .init())
                    
                    Button("click me"){
                        showPlaceholder.toggle()
                    }
                    .redacted(reason: showPlaceholder ? .placeholder : .init())
                }
                Image(systemName: "music.note")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .redacted(reason: showPlaceholder ? .placeholder : .init())
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
