//
//  ContentView.swift
//  SwiftUI-sec0-10.list~
//
//  Created by 김유미 on 2023/09/16.
//

import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let index: Int
    
}

struct ContentView: View {
    var animalList = [
        Animal(name: "dog", index: 3),
        Animal(name: "cat", index: 2),
        Animal(name: "dog", index: 1),
        Animal(name: "cat", index: 5),
        Animal(name: "bird", index: 4),
        Animal(name: "cat", index: 6),
        Animal(name: "hippo", index: 7),
        Animal(name: "cat", index: 8),
        Animal(name: "panda", index: 9),
        Animal(name: "panda ", index: 10)
    ]
    
    var animalGroup: [String: [Animal]] {
        var groupData = Dictionary(grouping: animalList) { $0.name }
        
        for (key, value) in groupData {
            groupData[key] = value.sorted(by: { // 오름차순 정렬
                $0.index < $1.index
            })
        }
        
        return groupData
    }
    
    var groupKey: [String] {
        animalGroup.map({$0.key})
    }
    
    @State private var alertOn = false
    @State private var selected = "x"

    var body: some View {
        VStack{
            Spacer()
            Button("show alert"){
                alertOn.toggle()
            }
            .alert(isPresented: $alertOn, content: {
                let primaryButton = Alert.Button.default(Text("done")) {
                    selected = "done"
                }
                let secondaryButton = Alert.Button.default(Text("cancel")) {
                    selected = "cancel"
                }
                return Alert(title: Text("show alert"), primaryButton: primaryButton, secondaryButton: secondaryButton)
                
            })
            Spacer()
            Text("\(alertOn.description)")
                .font(.title)
            Spacer()
            Text("\(selected)")
                .font(.title)
            Spacer()
        }
        
        // List section + View modifier 연습
//        List {
//            ForEach(groupKey, id: \.self) { animalKey in
//                Section(header: Text("\(animalKey)"), content: {
//                    ForEach(animalGroup[animalKey]!) { animal in
//                        HStack{
//                            Text("\(animal.name)")
//                                .modifier(MyTextStyle(myWeight: .bold))
//                            Text("\(animal.index)")
//                                .customFont(color: .blue)
//                        }
//
//                    }
//                })
//            }
//        }
    }
}

struct MyTextStyle: ViewModifier {
    var myFont = Font.title2
    var myWeight = Font.Weight.light
    var myColor = Color.black
    
    func body(content: Content) -> some View {
        content
            .font(myFont.weight(myWeight))
            .foregroundColor(myColor)
            .padding(.trailing, 10)
    }
}

extension Text {
    func customFont(color: Color) -> Text {
        self.font(.title3)
            .italic()
            .foregroundColor(color)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
