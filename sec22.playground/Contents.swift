import UIKit

// 프로토콜 선언
protocol Something {
    func doSomething()
    
}

// 프로토콜 채용
struct SomeStruct: Something {
    func doSomething() {
        print("Do something")
    }
    
}

// AnyObject를 채용하면 Class-Only 프로토콜
protocol SomethingObject: AnyObject, Something {
    
}

// 에러: Non-class type이라서 프로토콜을 채용할 수 없다.
//struct Value: SomethingObject {
//
//}

class Object: SomethingObject {
    func doSomething() {
        
    }
}

// 속성 요구사항
// 항상 var로 선언 - 가변성과 관련 X 그저 '속성'이라는 의미
protocol Figure {
    static var name: String { get set }    // get, set은 속성의 가변성을 결정 - get만 있으면 읽기 전용
    //var age: Int { get set }    // get set - 읽기, 쓰기 가능
}

struct Rectangle: Figure {
    static var name = "Rect"
}

struct Triangle: Figure {
    static var name = "Triangle"
}

class Circle: Figure {  // 프로토콜을 충족시키면 서브 클래스에서 오버라이딩도 가능
    class var name: String {    // 프로토콜에서 static이라고 선언되어있다 해서 형식에서도 static으로 선언할 필요X
        get {
            return "Circle"
        }
        set {
            
        }
    }
}

// 메소드 요구사항
protocol Resettable {
    //mutating func reset()   // mutating은 값 형식에서만 사용 - 형식에서 mutating으로 선언하지 않아도 됨
    func reset()
}

class Square: Resettable {
    var width = 0.0
    var height = 0.0
    
    func reset() {
        width = 0.0
        height = 0.0
    }
//    static func reset() {    // 인스턴스/타입 메소드로 동시에 구현 가능 - static func는 오버라이딩 불가능
//
//    }
    class func reset() {    // class func는 오버라이딩 가능
        
    }
}

protocol MyFigure {
    var name: String { get }
    init(n: String)
    
}

struct MyShape: MyFigure {
    var name: String
    
    init(n: String) {
        name = n
    }
}

class MyCircle: MyFigure {
    var name: String
    
    required init(n: String) {
        name = n
    }// 위 struct와 같은 코드인데 에러 발생
    
    // class는 상속을 고려해야하고, 모든 자식 클래스들이 프로토콜의 요구사항을 충족시켜야 함
    // -> required 키워드 필요
}

final class MyTriangle: MyFigure {
    var name: String
    
    init(n: String) {
        name = n
    }// final class는 상속을 고려할 필요 X -> required 없어도 됨
}

class MyOval: MyCircle { // 이미 MyCircle이 MyFigure을 채용하고 있으므로 MyFigure는 채용할 수 없음
    var prop: Int
    
    init(){
        prop = 0
        super.init(n: "Oval")
    }
    
    required convenience init(n: String) {
        self.init()
    }
}

protocol Grayscale {
    init?(white: Double)
    
}

struct Color: Grayscale {
    init(white: Double) {
        
    }
}

// Subscript Requirements
protocol List {
    subscript(idx: Int) -> Int { get }  // 읽기 전용
    // 프로토콜에서 get을 생략할 수는 없음
}

struct DataStore: List {
    subscript(idx: Int) -> Int {
        get {
            return 0
        }
        set {// set 블록이 있어도 에러X <- 서브스크립트에서 get으로 선언했다고 해서 실제 get 블록만 선언해야 하는 것은 X.
            
        }
    }
}

// Protocol Types
class Size: Resettable {
    var width = 0.0
    var height = 0.0
    
    func reset() {
        width = 0.0
        height = 0.0
    }
}

let s = Size()

s is Resettable
s is ExpressibleByNilLiteral

let r = Size() as Resettable

r as? Size  // 다시 원래 상태로 캐스팅
// 인스턴스를 프로토콜 타입으로 캐스팅할 때는 컴파일/런타임 캐스트 모두 사용 가능

// 값 형식에서도 업캐스팅, 다운캐스팅을 할 수 있음
protocol Vegetable {
    func grow()
}


struct Eggplant: Vegetable {
    func grow() {
        print("Eggplant grows")
    }
}

class Lettuce: Vegetable {
    func grow() {
        print("Lettuce grows")
    }
}

class Carrot: Vegetable, Printable {
    var month = 3
    
    func grow() {
        print("Carrot grows")
    }
    
    func printValue() {
        print("I'm \(month) month(s) old!")
    }
}

class BabyCarrot: Carrot {
    
}

let e = Eggplant()
let l = Lettuce()
let c = Carrot()

let lst: [Vegetable] = [e, l, c]

for item in lst {
    item.grow()
    if let c = item as? Carrot {
        c.month
    }
}

// protocol composition
protocol Printable {
    func printValue()
}

let carrot1: Vegetable = Carrot()
let carrot2: Printable = Carrot()

var cr: Vegetable & Printable = Carrot()    // cr에는 두 프로토콜 모두를 채용한 인스턴스만 저장 가능

var bcr: Carrot & Vegetable = Carrot()
bcr = BabyCarrot()  // 문제 없음

// 선택적 요구사항 - @objc 필요
@objc protocol Drawable {   // 클래스 전용 -> 구조체와 열거형에서 채용 불가 + 자동으로 AnyObject 프로토콜 채용
    @objc optional var strokeWidth: Double { get set }  // 선택적 멤버는 옵셔널 형식으로 저장됨
    @objc optional var strokeColor: UIColor { get set }
    func draw()
    @objc optional func reset() // 메소드도 마찬가지로 옵셔널 -> 사용할 땐 옵셔널 체이닝 필요
}

class RectangleD: Drawable {
    func draw() {
        
    }
}

let rect: Drawable = RectangleD()
rect.draw()
rect.strokeColor    // UIColor? 타입
rect.strokeWidth    // nil. 의미: 값이 없다 and 형식에 해당 속성이 선언되어있지 않다

rect.reset?()   // nil. 의미: reset 함수가 구현되어있지 않다

// Protocol Extension - 프로토콜 역시 확장 가능
protocol Shape {
    var name: String { get }
    func draw()
}

extension Shape where Self: Equatable { // Self는 이 프로토콜을 채용한 형식
    func draw() {
        print("draw figure")
    }
}

struct Star: Shape, Equatable {
    var name = ""
    
    func draw() {   // 직접 추가된 메소드가 extension을 통해 만들어진 메소드보다 높은 우선순위를 가짐
        print("draw star")  // 이 메소드가 없으면 draw() 호출 시 "draw figure" 출력
    }
}

let st = Star()
st.draw()

