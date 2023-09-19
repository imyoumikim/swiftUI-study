//
//  ContentView.swift
//  swiftUI-sec2-json
//
//  Created by 김유미 on 2023/09/19.
//

import SwiftUI

// https://jsonplaceholder.typicode.com/todos

struct ContentView: View {
    
    @State var todos = [Todo]()
    
    var body: some View {
        
        List(todos) { todo in
            VStack(alignment: .leading) {
                Text(todo.title!)
                Text(todo.completed!.description)
                    .foregroundColor(todo.completed == true ? .red : .blue)
            }
        }
        .onAppear {
            WebService().getTodos() { todos in
                self.todos = todos
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
