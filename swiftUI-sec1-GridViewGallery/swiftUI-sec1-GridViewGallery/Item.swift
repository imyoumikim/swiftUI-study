//
//  Item.swift
//  swiftUI-sec1-GridViewGallery
//
//  Created by 김유미 on 2023/09/18.
//

import Foundation

struct Item: Identifiable {
    let id = UUID()
    let mainTitle: String
    let subTitle: String
    let imageName: String
    
    static var dummyData: [Item] {
        
        // 비효율적인 방법
//        var temp = [Item]()
//
//        for index in 0...30 {
//            temp.append(Item(mainTitle: "Main title \(index)",
//                             subTitle: "Sub title \(index)",
//                             imageName: "freeBG\(index % 3 + 1)"))
//        }
//        return temp
        
        (0...30).map {
            Item(mainTitle: "Main title \($0)",
                 subTitle: "Sub title \($0)",
                 imageName: "freeBG\($0 % 3 + 1)")
        }
        
    }
}
