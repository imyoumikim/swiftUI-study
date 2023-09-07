import UIKit

let c = { print("Hello, Swift") }
c()

let c2 = { (str: String) -> String in
    return "Hello, \(str)"
}

typealias SimpleStringClosure = (String) -> String

func perform(closure: SimpleStringClosure) {
    print(closure("iOS"))
}

perform(closure: c2)

perform(closure: { (str: String) -> String in
    return "Hi, \(str)"
})

let products = ["MacBook Air", "MacBook Pro", "iMac", "iMac Pro", "Mac Pro", "Mac mini", "iPad Pro", "iPad", "iPad mini", "iPhone 11", "iPhone 12"]

var proModel = products.filter({ (name: String) -> Bool in
    return name.contains("Pro")
})

products.filter() {
    $0.contains("Pro")
}

print(proModel)
print(proModel.sorted())

//proModel.sort(by: { (lhs: String, rhs: String) -> Bool in
//    return lhs.caseInsensitiveCompare(rhs) == .orderedAscending
//})

proModel.sort {   // 위 코드를 단축시킨 버전
    $0.caseInsensitiveCompare($1) == .orderedAscending
}

print(proModel)

//print("Start")
//
//DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
//    print("End")
//})
//
//DispatchQueue.main.asyncAfter(deadline: .now() + 5) {   // Syntax Optimization
//    print("End")
//}

var num = 0
let mc = {
    num += 1
    print("check point #1: \(num)")
    
}
mc()
print("check point #2: \(num)")

//func performNonEscaping(closure: () -> ()) {
//    print("start")
//    closure()
//    print("end")
//}
//
//performNonEscaping {
//    print("closure")
//}

func performEscaping(closure: @escaping () -> ()) {
    print("start")
        
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        closure()   // @escaping이기 때문에 클로저가 실행될 때까지 제거되지 않음
    }
    
    print("end")
}

performEscaping {
    print("closure")
}
