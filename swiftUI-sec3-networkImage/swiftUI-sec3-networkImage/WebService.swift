//
//  WebService.swift
//  swiftUI-sec3-networkImage
//
//  Created by 김유미 on 2023/09/19.
//

import Foundation
import SwiftUI

struct User: Codable, Identifiable {
    var id: String
    var name: String
    var avatar: String
    var createdAt: String
}

class WebService {
    func loadUsers(completion: @escaping ([User]) -> Void ) {
        
        guard let url = URL(string: "https://650952f2f6553137159b3968.mockapi.io/user") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let safeData = data else {
                return
            }
            
            let users = try! JSONDecoder().decode([User].self, from: safeData)
            
            completion(users)
            
        }.resume()
    }
}


