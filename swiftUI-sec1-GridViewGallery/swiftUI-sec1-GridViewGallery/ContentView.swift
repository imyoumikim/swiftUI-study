//
//  ContentView.swift
//  swiftUI-sec1-GridViewGallery
//
//  Created by 김유미 on 2023/09/18.
//

import SwiftUI

struct ContentView: View {
    
    var items = Item.dummyData
    
    @State private var selectedGridType: GridType = .single
    
    var body: some View {
        VStack {
            GridTypePicker(gridType: $selectedGridType)
            
            ScrollView {
                LazyVGrid(columns: selectedGridType.columns, content: {
                    ForEach(items){ item in
                        Image(item.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                })
                .animation(.default)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
