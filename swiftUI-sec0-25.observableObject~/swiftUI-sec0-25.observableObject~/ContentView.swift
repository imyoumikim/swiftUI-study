//
//  ContentView.swift
//  swiftUI-sec0-25.observableObject~
//
//  Created by 김유미 on 2023/09/18.
//

import SwiftUI

//ObservableObject
//class MyInfo: ObservableObject {
//    @Published var myAge = 20
//    var myName = "Lim" {
//        didSet {
//            if oldValue.count == 0 {
//                objectWillChange.send() // "값이 변경되었으니 UI 갱신해라"
//            }
//        }   // 새로운 값이 저장된 직후에 호출. 변경된 값에는 oldValue로 접근
//    }
//}

//EnvironmentObject
//class MyInfo: ObservableObject {
//    @Published var name = "hailey"
//    @Published var photoURL = ""
//    var token = ""
//}

//StateObject
class MyInfo: ObservableObject {
    @Published var myScore = 0
}


struct ContentView: View {
    
    //ObservableObject
    //    @ObservedObject var myInfo = MyInfo()
    
    //    var body: some View {
    //        VStack {
    //            Text(myInfo.myName).padding()
    //
    //            Button("change name") {
    //                myInfo.myName = "Lee"
    //            }
    //        }
    //    }
    
    //EnvironmentObject
    //    @EnvironmentObject var myInfo: MyInfo   // 인스턴스화 X
    //
    //    var body: some View {
    //
    //        NavigationView {
    //            VStack {
    //                NavigationLink(destination: DetailView()) {
    //                    Text("Navigate")
    //
    //                }
    //
    //                Text("name: \(myInfo.name)")
    //                    .font(.largeTitle)
    //                    .padding()
    //                Text("url: \(myInfo.photoURL)")
    //                    .font(.largeTitle)
    //                    .padding()
    //            }
    //        }.onAppear {
    //            myInfo.name = "kim"
    //            myInfo.photoURL = "https://naver.com"
    //        }
    //
    //    }
    
    //StateObject
    @ObservedObject var myInfo = MyInfo()
    
    //AppStorage 연습
    @AppStorage("dark mode") var mode = false
    @AppStorage("notification count") var notiCount = ""
    
    var body: some View {
        ZStack{
            
            mode ? Color.mint : Color.gray
            
            VStack {
                
                Button {
                    mode.toggle()
                } label: {
                    Text("Mode Change")
                }
                
                TextField("Notification Count", text: $notiCount )

                
                Text("\(myInfo.myScore)")
                    .font(.largeTitle)
                
                Button("Plus1") {
                    myInfo.myScore += 1
                    
                }
                
                CustomButton()
            }
        }
        
    }
}


//StateObject
struct CustomButton: View {
    
    @StateObject var myInfo2 = MyInfo()
    // @StateObject는 CustomButton이 호출될 때마다(View를 다시 그림) myInfo2를 생성하지 X
    // @ObservedObject는 View를 다시 그릴 때마다 myInfo2를 다시 생성
    // 단, 갱신하는 뷰 안에 @ObservedObject가 들어있을 때
    
    var body: some View {
        VStack {
            Text("\(myInfo2.myScore)")  // ObservedObject일 때는 Plus1 버튼이 눌릴 때마다 아래 myScore가 0으로 초기화
                .font(.largeTitle)
            
            Button("Plus2") {
                myInfo2.myScore += 1
            }
            
        }
    }
}

//EnvironmentObject 사용
//struct DetailView: View {
//    @EnvironmentObject var myInfo: MyInfo   // 인스턴스화 X
//
//    var body: some View {
//
//        VStack {
//            Text("detail name: \(myInfo.name)")
//                .font(.largeTitle)
//                .padding()
//            Text("detail url: \(myInfo.photoURL)")
//                .font(.largeTitle)
//                .padding()
//            Button("change name") {
//                myInfo.name = "lee"
//            }
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MyInfo())
    }
}
