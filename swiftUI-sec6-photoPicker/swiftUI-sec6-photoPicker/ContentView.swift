//
//  ContentView.swift
//  swiftUI-sec6-photoPicker
//
//  Created by 김유미 on 2023/09/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var isPresentPicker = false
    @State var images = [UIImage]()
    
    var body: some View {
        
        VStack {
            Button("Select Images") {
                isPresentPicker = true
            }
            
            List {
                ForEach(images, id: \.self) { image in
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.size.width)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                }
            }
        }
        .sheet(isPresented: $isPresentPicker) {
            ImagePicker(isPresent: $isPresentPicker, images: $images)
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
