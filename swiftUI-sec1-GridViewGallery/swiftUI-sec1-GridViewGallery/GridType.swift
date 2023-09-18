//
//  GridType.swift
//  swiftUI-sec1-GridViewGallery
//
//  Created by 김유미 on 2023/09/18.
//

import Foundation
import SwiftUI

enum GridType: CaseIterable {   // CaseIterable을 통해 enum을 배열화
    case single
    case double
    case triple
    case adaptive
    
    var columns: [GridItem] {
        switch self {
        case .single:
            return [GridItem(.flexible())]  // 화면에 최대한 꽉차게
        case .double:
            return [GridItem(.flexible()),
                    GridItem(.flexible())]
        case .triple:
            return [GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())]
        case .adaptive :
            return [GridItem(.adaptive(minimum: 80))]
        }
    }
}
