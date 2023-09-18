//
//  ContentView.swift
//  swiftUI-sec0-17.navigationview~
//
//  Created by 김유미 on 2023/09/18.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        //        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor.red]
        let myAppearance = UINavigationBarAppearance()
        
        myAppearance.titleTextAttributes = [
            .foregroundColor : UIColor.red,
            .font : UIFont.italicSystemFont(ofSize: 20)
        ]
        
        myAppearance.largeTitleTextAttributes = [
            .foregroundColor : UIColor.blue,
        ]    // large title은 따로 설정해줘야 함
        
        myAppearance.backgroundColor = .yellow
        
        UINavigationBar.appearance()
            .standardAppearance = myAppearance
        UINavigationBar.appearance()
            .scrollEdgeAppearance = myAppearance
        UINavigationBar.appearance()
            .compactAppearance = myAppearance
        
        UINavigationBar.appearance().tintColor = .red
        
    }
    
    var body: some View {
        
        NavigationView {
            
            List{
                NavigationLink(
                    destination: Text("Destination"),
                    label: {
                        HStack {
                            Image(systemName: "person")
                            Text("Navigate")
                        }
                    })
            }
            .navigationTitle("Hello")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
