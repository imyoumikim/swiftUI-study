//
//  ImagePicker.swift
//  swiftUI-sec6-photoPicker
//
//  Created by 김유미 on 2023/09/20.
//

import SwiftUI
import PhotosUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var isPresent: Bool
    @Binding var images: [UIImage]
    
    func makeCoordinator() -> Coordinator {
        return ImagePicker.Coordinator(picker: self)
    }   // Coordinator 연결
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        var config = PHPickerConfiguration()
        config.selectionLimit = 0   // 0: 여러 개를 띄운다, 1: 1개를 띄운다, 2: 2개...
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        
        picker.delegate = context.coordinator
        
        return picker
        
    }
    
    class Coordinator: PHPickerViewControllerDelegate {
        
        var picker: ImagePicker
        
        init(picker: ImagePicker){
            self.picker = picker
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            self.picker.isPresent = false   // 내리기
            self.picker.images.removeAll()  // 가져올 때마다 새로 고침
            
            for img in results {
                if img.itemProvider.canLoadObject(ofClass: UIImage.self) {
                    img.itemProvider.loadObject(ofClass: UIImage.self) { (loadedImage, error) in
                        guard let safeLoadedImage = loadedImage else {
                            print("empty image")
                            return
                        }
                        
                        self.picker.images.append(safeLoadedImage as! UIImage)
                    }
                } else {
                    print("fail to loaded")
                }
            }
        }
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}
