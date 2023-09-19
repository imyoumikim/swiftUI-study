//
//  ImageLoader.swift
//  swiftUI-sec3-networkImage
//
//  Created by 김유미 on 2023/09/19.
//

import Foundation
import SwiftUI

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    var urlString: String
    
    init(urlString: String){
        self.urlString = urlString
        self.loadImageFromURL()
    }
    
    func loadImageFromURL() {
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let safeData = data else {
                return
            }
            
            guard let loadedImage = UIImage(data: safeData) else {
                return
            }
            DispatchQueue.main.async {  // 메인 스레드에서 UI 변경이 일어나야 함
                self.image = loadedImage
            }
        }.resume()
    }
}


