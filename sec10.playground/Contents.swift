import UIKit

//func sayHello(name: String = "Stranger") {    // 기본값 설정
//    print("Hello, \(name)")
//}

func sayHello(to name: String = "Stranger") {    // 기본값 설정
    print("Hello, \(name)")
}

//sayHello(name: "Swift")
sayHello(to: "Swift")   // 컴파일러는 위 두 함수를 서로 다른 함수로 인식

func sayHello(_ name: String) {     // 인자 레이블을 사용하지 않기 <- Wildcard Pattern
    print("Hello, \(name)")
}

sayHello("Swift")

func printSum(of nums: Int...) {
    var sum = 0
    for n in nums {
        sum += n
    }
    print(sum)
}

printSum(of: 1, 2, 3)
printSum(of: 1, 2, 3, 4, 5)

var num1 = 12
var num2 = 34

//func swapNumber(_ a: Int, with b: Int) {
////    let tmp = a
////    a = b
////    b = tmp
//}
//
//swapNumber(num1, with: num2)    // 함수의 body에는 num1, num2의 복사본이 전달됨 <- Int는 값 형식이라서

func swapNumber(_ a: inout Int, with b: inout Int) {
    let tmp = a
    a = b
    b = tmp
}

num1
num2

swapNumber(&num1, with: &num2)

num1
num2

func sayHi(){
    print("Hi")
}

let f1 = sayHi  // 함수는 First Class Citizen이라 변수나 상수에 전달하기 가능
f1()

func printHi(with name: String) {
    print("Hi, \(name)")
}

let f2: (String) -> () = printHi(with:)
f2("my name is Tom")    // 여기서는 인자 레이블 사용 X

func add(a: Int, b: Int) -> Int {
    return a + b
}

var f3: (Int, Int) -> Int = add(a:b:)
f3(1, 10)

func add(_ a: Int, with b: Int) -> Int {
    return a + b
}

var f4 = add(_:with:)

func swapNumbers(_ a: inout Int, _ b: inout Int) {
    
}

let f5 = swapNumbers(_:_:)
f5

func sum(of numbers: Int...) {
    
}
let f6 = sum(of:)
f6

func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func subtract(_ a: Int, _ b: Int) -> Int {
    return a - b
}

func multiply(_ a: Int, _ b: Int) -> Int {
    return a * b
}

func divide(_ a: Int, _ b: Int) -> Int {
    return a / b
}

typealias ArithmeticFunction = (Int, Int) -> Int

func selectFunction(from op: String) -> ArithmeticFunction? {
    switch op {
    case "+":
        return add(_:_:)
    case "-":
        return subtract(_:_:)
    case "*":
        return multiply(_:_:)
    case "/":
        return divide(_:_:)
    default:
        return nil
    }
}

let af = selectFunction(from: "+")
af?(1, 2)

selectFunction(from: "+")?(1, 2)

// Nested Function
func outer() -> () -> () {
    func inner() {
        print("inner")
    }
    
    print("outer")
    
    return inner
}

let f = outer()
f()
