//
//  ContentView.swift
//  swiftUI-sec0button~
//
//  Created by 김유미 on 2023/09/15.
//

import SwiftUI

struct ContentView: View {
    @State private var isSelected: Bool = false
    @State private var isOn: Bool = false
    @State private var locations = [
        LocationInfo(city: "Seoul", weather: "sunny"),
        LocationInfo(city: "Paris", weather: "rainy"),
        LocationInfo(city: "London", weather: "cloudy"),
        LocationInfo(city: "LA", weather: "sunny")]
    
    var buttonImage: String {
        if isSelected {
            return "circle"
        } else {
            return "pencil"
        }
    }
    
    var buttonLineColor: Color {
        return isSelected ? Color.green : Color.red
    }
    
    var body: some View {
        VStack{
            // Button
            Button {
                isSelected.toggle()
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(buttonLineColor, style: StrokeStyle(lineWidth: 5))
                        .frame(width: 200, height: 100)
                    HStack {
                        Image(systemName: buttonImage)
                            .resizable()
                            .frame(width: 30,height: 30)
                        Text("Button")
                            .font(.largeTitle)
                    }
                }
                
            }
            Text("Current status: \(isSelected.description)")
                .font(.title2)
            
            // Toggle
            MyToggle(isOn: $isOn)
            Text(isOn.description)
                .font(.largeTitle)
            
            List {
                ForEach(locations, id: \.self) { location in
                    HStack {
                        Text("\(location.city)")
                        Text("\(location.weather)")
                    }
                }   // Hashable 프로토콜 필요
                
                ForEach(locations) { location in
                    HStack{
                        Text("\(location.city)")
                        Text("\(location.weather)")
                    }
                }   // Identifiable 프로토콜 필요
                
                ForEach(0..<locations.count) {
                    index in
                    HStack{
                        Text("\(index + 1)")
                        Text("\(locations[index].city)")
                        Text("\(locations[index].weather)")
                    }
                }
            }
        }
    }
}

struct LocationInfo: Hashable, Identifiable {
    var id = UUID() // 긴 난수가 자동으로 생성됨. Identifiable 때문에 id가 필요함
    
    var city = ""
    var weather = ""
}

struct MyToggle: View {
    @Binding var isOn: Bool     // 원본 값은 다른 곳에 있어서 직접적으로 =false 불가능
    
    var body: some View {
        Toggle("toggle \(isOn.description)", isOn: $isOn)
            .padding(.horizontal)
        Toggle(isOn: $isOn, label: {
            HStack{
                Spacer()
                VStack{
                    Text("Label")
                    Text("Label")
                    
                }
            }
        }).padding(.horizontal)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
