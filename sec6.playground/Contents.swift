import UIKit

let num = 10
if num < 0 {
    print("negative number")
} else if num == 0 {
    print("zero")
} else if num > 0 {
    print("positive number")
}

switch num {
case 1:
    print("one")
case 2...9:
    print("two to nine")
case 10:
    print("ten")
default:
    print("just a number")
}

switch num {
case let n where n <= 10:   // case에 패턴이 적용되었을 때 where 조건을 한번 더 확인
    print(n)
default:
    print("others")
}

// Interval Matching
let temperature = -8
switch temperature {
case ...10:
    print("Cold")
case 11...20:
    print("Cool")
case 21...27:
    print("Warm")
case 28...:
    print("Hot")
default:
    break
}

let n = 2
switch n {
case 1:
    print("one")
case 2:
    print("two")
    fallthrough // 현재 케이스에서 종료되지 않고 다음 블록으로 이어짐. But 이어지는 블록에서 매치되는 값은 확인하지 않고 실행.
case 3:
    print("three")
default:
    break
}

func validate(id: String?) -> Bool {
    guard let id = id else {
        return false
    }
    
    guard id.count >= 6 else {
        return false
    }
    
    return true
}

validate(id: nil)
validate(id: "abc")
validate(id: "swiftlang")

func validateUsingIf() {
    var id: String? = nil
    
    if let str = id {
        if str.count >= 6 {     // 조건이 늘어나는 만큼 if문 중첩
            print(str)
        }
    }
}

func validateUsingGuard() {
    var id: String? = nil
    
    guard let str = id else { return }  // str은 else문 이후에 사용 가능
    guard str.count >= 6 else { return }
    
    print(str)
}

let a = 100

switch a {
case var x where x > 100:
    x = 200
    print(x)
default:
    break
}

let pt = (1, 2)
switch pt {
case let(x, y):         // 튜플로 바인딩할 때
    print(x, y)
case (let x, let y):    // 둘다 상수로 바인딩할 때
    print(x, y)
case (let x, var y):    // 상수, 변수 섞어서 바인딩할 때
    print(x, y)
}


// ~= Pattern matching operator
struct Size {
    var width = 0.0
    var height = 0.0
    
    static func ~=(left: Range<Int>, right: Size) -> Bool {
        return left.contains(Int(right.width))
    }
    // 연산자 오버로딩 시, 파라미터의 자료형과 순서가 중요
}

let s = Size(width: 10, height: 20)

switch s {
case 1..<9: // Expression pattern of type 'Range<Int>'
    print("1~9")
case 10..<99:
    print("10~99")
default:
    break
}
