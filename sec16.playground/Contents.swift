import UIKit

struct Person {
    var name: String
    var age: Int
    
    func speak() {
        print("Hello")
    }
}

let p = Person(name: "Steve", age: 50)
p.name
p.age

p.speak()

class Person2 {
    var name = "John Doe"
    var age = 0
    
    func speak(){
        print("Hello")
    }
}

let p2 = Person2()
p2.name
p2.age

p2.speak()

// -----------------------------------------------------
// 생성자(Initializer)

class Position {
    var x: Double
    var y: Double
    
    init() {
        x = 0.0
        y = 0.0
    }   // 속성 초기화가 제 1 목적
    
    init(value: Double) {
        x = value
        y = value
    }
}

let aPos = Position()  // x, y 모두 0으로 초기확
let bPos = Position(value: 100)    // x, y 모두 100으로 초기화

// -----------------------------------------------------
// 항등 연산자(Identity Operator)

class A {
    
}

let a = A()
let b = a
let c = A()

a === b // true
a !== b // false

a === c // false
a !== c // true

// -----------------------------------------------------
// Nested Type

class One {
    struct Two {
        enum Three {
            case a
            
            class Four {
                
            }
        }
    }
    var a = Two()   // 여기서는 One을 생략해도 됨
}

let two: One.Two = One.Two()
let four: One.Two.Three.Four = One.Two.Three.Four()
let enumA: One.Two.Three = One.Two.Three.a
