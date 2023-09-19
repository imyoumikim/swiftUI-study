//
//  URLImage.swift
//  swiftUI-sec3-networkImage
//
//  Created by 김유미 on 2023/09/19.
//

import Foundation
import SwiftUI

struct URLImage: View {
    @ObservedObject var loader: ImageLoader
    
    init(urlString: String) {    // view가 만들어질 때 ImageLoader가 실행되어야 함
        self.loader = ImageLoader(urlString: urlString)
    }
    
    var body: some View {
        Image(uiImage: loader.image ?? UIImage(named: "placeholder-image")!)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
