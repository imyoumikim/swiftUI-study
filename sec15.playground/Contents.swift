import UIKit

enum Alignment {
    case left
    case right
    case center
}

Alignment.center

var textAlignment = Alignment.center
textAlignment = .left   // 열거형 이름은 생략해도 되지만, '.'은 생략하지 말 것

switch textAlignment {
case .left:
    print("left")
case .right:
    print("right")
case .center:
    print("center")
}

// ----------------------------------------------
// Raw values = 원시값
enum Alignment2: Int {
    case left
    case right = 100        // 원시값을 직접 저장하면 이전 케이스에서 증가한 값은 저장되지 않음
    case center
}

Alignment2.left.rawValue    // 0
Alignment2.right.rawValue   // 100
Alignment2.center.rawValue  // 101 <- 기준값은 항상 이전값. 즉, 100이 기준이 되어 1 증가한 101이 원시값

// Alignment2.right.rawValue = 200 // 'rawValue' is immutable

Alignment2(rawValue: 0)     // left를 리턴
Alignment2(rawValue: 200)   // nil을 리턴

enum Weekday: String {
    case sunday
    case monday = "MON"
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

Weekday.sunday.rawValue // "sunday" - String 타입으로 지정 후 원시값을 할당하지 않으면 원시값을 케이스명과 동일한 값으로 지정
Weekday.monday.rawValue

enum ControlChar: Character {   // 문자 자료형에는 하나의 문자만 저장 가능 -> 원시값을 직접 저장해야 함
    case tab = "\t"
    case newLine = "\n"
}

// ----------------------------------------------
// Associated values(연관값)
enum VideoInterface {   // 저장할 값의 형식을 개별 케이스마다 따로 선언
    case dvi(width: Int, height: Int)
    case hdmi(Int, Int, Double, Bool)
    case displayPort(CGSize)
}

var input = VideoInterface.dvi(width: 2048, height: 1536)

switch input {
case .dvi(2048, 1536):
    print("dvi 2048 x 1536")
case .dvi(2048, _):
    print("dvi 2048 x Any")
case .dvi:
    print("dvi")
case .hdmi(let width, let height, let version, let audioEnabled):
    print("hdmi \(width) x \(height)")
case let .displayPort(size):
    print("dp")
}

input = .hdmi(3840, 2160, 2.1, true)    // case 세개 중 하나만 저장된다면 아무런 문제 없음.

// ----------------------------------------------
// Enumeration Case Pattern = 연관값을 가진 열거형을 매칭시키는 패턴
enum Transportation {
    case bus(number: Int)
    case taxi(company: String, number: String)
    case subway(lineNumber: Int, express: Bool)
}

var tpt = Transportation.bus(number: 7)

switch tpt {
case .bus(let n):
    print(n)
case .taxi(let c, var n):
    print(c, n)
case let .subway(l, e):
    print(l, e)
}

tpt = Transportation.subway(lineNumber: 2, express: false)
if case let .subway(2, express) = tpt {     // let 키워드 때문에 express도 상수로 바인딩됨
    if express {
        
    } else {
        
    }
}

if case .subway(_, true) = tpt {
    print("express")
}

let list = [
    Transportation.subway(lineNumber: 2, express: false),
    Transportation.bus(number: 4412),
    Transportation.subway(lineNumber: 7, express: true),
    Transportation.taxi(company: "SeoulTaxi", number: "1234")]

for case let .subway(n, _) in list {    // subway 케이스만 열거
    print("subway \(n)")
}

for case let .subway(n, true) in list {     // express=true인 케이스만 열거
    print("subway \(n)")
}

for case let .subway(n, true) in list where n == 2 {    // 부가적인 조건 추가
    print("subway \(n)")
}
