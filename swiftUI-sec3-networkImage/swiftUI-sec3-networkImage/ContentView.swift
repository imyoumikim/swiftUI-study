//
//  ContentView.swift
//  swiftUI-sec3-networkImage
//
//  Created by 김유미 on 2023/09/19.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible())], content: {
                    
                    ForEach(users) { user in
                        
                        NavigationLink(
                            destination: UserDetailView(user: user),
                            label: {
                                HStack {
                                    URLImage(urlString: user.avatar)
                                        .frame(width: 150, height: 150)
                                    Text("\(user.name)")
                                    Spacer()
                                }
                            })
                    }
                    
                    
                })
                .onAppear{
                    WebService().loadUsers { (users) in
                        self.users = users
                    }
                }
            }.navigationTitle("User List")
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
