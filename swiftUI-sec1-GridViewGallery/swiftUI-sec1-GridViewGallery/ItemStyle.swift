//
//  ItemStyle.swift
//  swiftUI-sec1-GridViewGallery
//
//  Created by 김유미 on 2023/09/19.
//

import Foundation
import SwiftUI

struct ItemStyle: View {
    var items: [Item]
    @Binding var gridType: GridType
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: gridType.columns, content: {
                ForEach(items) { item in
                    
                    switch gridType {
                    case .single,
                            .double:
                        SingleRow(item: item)
                        
                    default:
                        Image(item.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
            })
            .animation(.default)
        }
    }
}
