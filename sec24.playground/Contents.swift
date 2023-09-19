import UIKit

// Equatable 프로토콜(==으로 값을 비교 가능한 타입)을 따르는 형식만
func swapValue<T: Equatable>(lhs: inout T, rhs: inout T){
    print("generic version")
    
    if lhs == rhs { return }
    
    let tmp = lhs
    lhs = rhs
    rhs = tmp
}

var a = 1
var b = 2
swapValue(lhs: &a, rhs: &b)
a
b

var c = 1.2
var d = 3.4
swapValue(lhs: &c, rhs: &d)
c
d

func swapValue(lhs: inout String, rhs: inout String) {  // String 타입 - 제너릭을 오버라이드했다고 판단
    print("specialized version")
    
    if lhs.caseInsensitiveCompare(rhs) == .orderedSame {
        return
    }
    
    let tmp = lhs
    lhs = rhs
    rhs = tmp
}

var e = 1
var f = 2
swapValue(lhs: &e, rhs: &f) // generic version 실행
// 인자로 정수 타입이 주어졌기 때문에 제너릭 타입의 함수가 호출되었음

var g = "Swift"
var h = "Programming"
swapValue(lhs: &g, rhs: &h)
g
h

// Generic type
struct Color<T> {
    var red: T
    var green: T
    var blue: T
}

var color = Color(red: 128, green: 80, blue: 200)
// Color<Int> 타입으로 추론되었음 - 인자가 Int이기 때문

let color2: Color = Color(red: 128.0, green: 80.0, blue: 200.0)
// 알아서 Color<Double> 타입으로 추론되었음

extension Color where T == Int {   // Color 뒤에 <T> 추가하지 않음. Int 타입에만 Color를 확장하고 싶을 때
    func getComponents() -> [T] {
        return [red, green, blue]
    }
}

let intColor = Color(red: 1, green: 2, blue: 3)
intColor.getComponents()

//let dblColor = Color(red: 1.0, green: 2.0, blue: 3.0)
//dblColor.getComponents()

// Associated Type (연관 형식)
protocol QueueCompatible {
    associatedtype Element: Equatable   // Element를 Equatable을 따르는 형식으로 지정
    func enqueue(value: Element)
    func dequeue() -> Element?
}

class IntegerQueue: QueueCompatible {
    typealias Element = Int // 대부분 생략
    
    func enqueue(value: Int) {
        
    }
    
    func dequeue() -> Int? {
        return 0
    }
}

class DoubleQueue: QueueCompatible {
    typealias Element = Double  // 대부분 생략
    
    func enqueue(value: Double) {
        
    }
    
    func dequeue() -> Double? {
        return 0
    }
}
