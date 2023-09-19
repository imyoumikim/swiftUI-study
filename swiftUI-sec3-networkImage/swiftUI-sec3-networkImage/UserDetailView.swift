//
//  UserDetailView.swift
//  swiftUI-sec3-networkImage
//
//  Created by 김유미 on 2023/09/19.
//

import Foundation
import SwiftUI

struct UserDetailView: View {
    
    var user: User
    
    var body: some View {
        VStack {
            URLImage(urlString: user.avatar)
                .frame(width: UIScreen.main.bounds.size.width, height: 250)
            Text(user.name)
                .font(.largeTitle)
            Text(user.createdAt)
            Spacer()
        }
    }
}
