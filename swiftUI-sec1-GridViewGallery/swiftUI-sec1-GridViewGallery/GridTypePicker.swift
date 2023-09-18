//
//  GridTypePicker.swift
//  swiftUI-sec1-GridViewGallery
//
//  Created by 김유미 on 2023/09/18.
//

import Foundation
import SwiftUI

struct GridTypePicker: View {
    
    @Binding var gridType: GridType
    
    var body: some View {
        Picker("Grid Type", selection: $gridType) {
            ForEach(GridType.allCases, id: \.self) { type in
                switch type {
                case .single:
                    Image(systemName: "rectangle.grid.1x2")
                case .double:
                    Image(systemName: "square.grid.2x2")
                case .triple:
                    Image(systemName: "square.grid.3x2")
                case .adaptive:
                    Image(systemName: "square.grid.4x3.fill")
                }
                
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}
