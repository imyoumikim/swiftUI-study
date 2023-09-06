import UIKit

let i: Int8 = Int8.max
let j: Int8 = i &+ 1    // -128

var a = 10
var b = 100

func updateLeft() -> Bool {
    a += 1
    return false
}

func updateRight() -> Bool {
    b += 1
    return true
}

if updateLeft() && updateRight() {
    
}

a   // 11
b   // 100

// 혹시 모를 Side effect에 대비하여 다음과 같이 코드를 작성하는 것이 좋음

a = 10
b = 100

let resultA = updateLeft()
let resultB = updateRight()

if resultA && resultB {
    
}

a   // 11
b   // 101

1...10
// 10...1 // upperBound < lowerBound 불가능 -> 내림차순은 다음과 같이 작성
(1...10).reversed()
 
let list = ["A", "B", "C", "D", "E"]
list[2...]
list[...2]
list[..<2]

//for i in range ..<2 {}    // for문의 범위로는 ..<를 단항 연산자로 사용 불가

let range = ...5
range.contains(7)
range.contains(-111)    // lower bound 없는 경우는 -inf라고 생각하면 됨


// Operator Method
struct Point {
    var x = 0.0
    var y = 0.0
}

extension Point: Equatable {    // 비교할 때는 Equatable 프로토콜 채용
//    static func ==(lhs: Point, rhs: Point) -> Bool {
//        return (lhs.x == rhs.x) && (lhs.y == rhs.y)
//    } // 이 부분은 굳이 작성하지 않아도 자동 추가됨
}

let p1 = Point(x: 12, y: 34)
let p2 = Point(x: 67, y: 89)

p1 == p2
p1 != p2

extension Point {
    static prefix func -(pt: Point) -> Point {  // prefix 키워드 사용
        return Point(x: -pt.x, y: -pt.y)
    }
}

let p3 = -p1
p3.x
p3.y

extension Point {
    static postfix func ++(pt: inout Point) -> Point {
        let ret = pt
        pt.x += 1
        pt.y += 1
        return ret
    }
}

var p4 = Point(x: 1.0, y: 2.0)
let p5 = p4++

p5.x
p5.y

p4.x
p4.y

// Custom Operator

prefix operator +++

extension Int {
    static prefix func +++(num: inout Int) {
        num += 2
    }
}

var a1 = 1
+++a1
a1

// 우선순위 그룹 지정 방법
precedencegroup MyPrecedence {
    higherThan: AdditionPrecedence
}

infix operator *+*: MyPrecedence
// 1 *+* 2 + 3
// 우선순위 지정이 없으면 "adjacent operators are in unordered precedence groups 'DefaultPrecedence' and 'AdditionPrecedence'" 에러 발생

extension Int {
    static func *+*(left: Int, right: Int) -> Int {
        return (left * right) + (left * right)
    }
}

1 *+* 2 + 3
