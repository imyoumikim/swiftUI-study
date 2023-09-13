import UIKit

struct SizeValue {
    var width = 0.0
    var height = 0.0
}

var value = SizeValue()

var value2 = value
value2.width = 1.0
value2.height = 2.0

value
value2

class SizeObject {
    var width = 0.0
    var height = 0.0
}

var object = SizeObject()// Heap에 데이터가 저장되고, Stack에 heap 메모리 주소가 저장
// 값형식과 달리 인스턴스에 바로 접근할 수 없음. 항상 stack을 거쳐서 접근
var object2 = object
object2.width = 1.0
object2.height = 2.0

object
object2

let v = SizeValue()
//v.width = 1.0 // 불가능. 속성을 바꿀 수 없음. let은 속성을 가리키는 stack을 바꾸지 못하는 공간으로 설

let o = SizeObject()
//o.width = 1.0
//o.height  2.0
// stack에 저장된 메모리 주소를 바꿀 수 없음. 상수가 가리키는 인스턴스를 바꿀 수 없음.
// 인스턴스가 저장된 heap은 아무런 제약X 값 형식과 달리 인스턴스 속성을 바꿀 수 있음

// -------------------------------------------------------
class Person {
    var name = "Jone Doe"
    var car: Car?
    deinit {
        print("person deinit")
    }
}

var person1: Person?
var person2: Person?
var person3: Person?

person1 = Person()
person2 = person1
person3 = person1

person1 = nil // 소유권 포기 - 즉시 강한 참조 해제, 참조 카운트 -1
person2 = nil
person3 = nil // 마지막 소유자가 소유권 포기 - 참조카운트 0, 메모리 해제, 소멸자 호출

// 강한 참조 사이클
class Car {
    var model: String
//    var lessee: Person?
//    weak var lessee: Person? // 약한 참조 Person을 참조 O 소유 X
    unowned var lessee: Person
    
//    init(model: String) {
//        self.model = model
//    }
    
    // unowned 예시
    init(model: String, lessee: Person) {
        self.model = model
        self.lessee = lessee
    }
    
    deinit {
        print("car deinit")
    }
}

//var person: Person? = Person()
//var rentedCar: Car? = Car(model: "Porsche")
//
//person?.car = rentedCar
//rentedCar?.lessee = person // person 인스턴스의 참조 카운트 = 2
//
//person = nil
//rentedCar = nil // 참조 카운트가 1 이상이어서 메모리에서 해제되지는 X - 두 인스턴스가 속성을 통해 서로를 소유하고 있기 때문
// 더이상 접근할 수단 X 두 인스턴스를 정상적으로 해제할 방법X
// 강한 참조 사이클

// 비소유 참조
var person: Person? = Person()
var rentedCar: Car? = Car(model: "Porsche", lessee: person!)

person?.car = rentedCar

person = nil
rentedCar = nil // 인스턴스 정상적으로 해제

// -------------------------------------------------------
// Closure Capture List

class Car2 {
    var totalDrivingDistance = 0.0
    var totalUsedGas = 0.0
    
    lazy var gasMileage: () -> Double = {
        return self.totalDrivingDistance / self.totalUsedGas
    }
    
    func drive() {
        self.totalDrivingDistance = 1200.0
        self.totalUsedGas = 73.0
    }
    
    deinit {
        print("car deinit")
    }
}

var myCar: Car2? = Car2()
myCar?.drive()

myCar?.gasMileage()

myCar = nil

// 값 형식을 캡처
var a = 0
var b = 0
let c = { [a] in print(a, b)}

a = 1
b = 2
c() // 0 2 출력. 참조 대신 복사본을 캡처

// 참조 형식을 캡처 - weak, unowned 키워드 필요
//lazy var gasMileage: () -> Double = { [weak self] in
//    guard let strongSelf = self else { return 0.0 }
//    return strongSelf.totalDrivingDistance / strongSelf.totalUsedGas
//}

//lazy var gasMileage: () -> Double = { [unowned self] in
//    return self.totalDrivingDistance / self.totalUsedGas
//} // 옵셔널이 아니므로 옵셔널 체이닝, 바인딩은 필요 X
