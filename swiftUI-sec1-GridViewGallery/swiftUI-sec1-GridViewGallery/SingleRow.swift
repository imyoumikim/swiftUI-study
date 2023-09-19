//
//  SingleRow.swift
//  swiftUI-sec1-GridViewGallery
//
//  Created by 김유미 on 2023/09/19.
//

import Foundation
import SwiftUI

struct SingleRow: View {
    
    let item: Item

    var body: some View {
        
        ZStack {
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack{
                Spacer()
                HStack{
                    VStack(alignment: .leading){
                        Text(item.mainTitle)
                            .font(.headline)
                        Text(item.subTitle)
                            .font(.subheadline)
                    }
                    Spacer()
                }
                .padding(10)
                .background(Color.white.opacity(0.5))
            }
            
        }
    }
}

struct SingleRow_Previews: PreviewProvider {
    static var previews: some View {
        SingleRow(item: Item(mainTitle: "main", subTitle: "sub", imageName: "freeBG1"))
    }
}
