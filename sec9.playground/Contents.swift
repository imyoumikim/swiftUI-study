import UIKit

let optionalNum: Int? = nil
let optionalStr: String? = nil

let op: Int? = 100
let op2 = op

// Forced unwrapping
 print(op!)    // op가 nil이면 에러 발생

// Optional Binding
var num: Int? = nil

if num != nil {
    print(num!)     // Forced unwrapping 필요
} else {
    print("empty")
}

if let num = num {  // 같은 이름을 사용해도 됨
    print(num)
} else {
    print("empty")
}

var str: String? = "my string"
guard let str = str else {
    str
    fatalError()
}
str

num = 123
if var num = num {
    num = 456
    print(num)
}

let a: Int? = 12
let b: String? = "str"

if let num = a, let str = b, str.count > 5 {
    print("num 성공, str 성공, str 길이가 5 초과일 때 이 문장 출력")
}

// Implicitly unwrapped optionals - 자주 사용 X
let iuo: Int! = 12

let i = iuo
i

let j: Int = iuo    // Non 옵셔널이기 때문에 자동으로 추출됨
j

// Nil-Coalescing Operator
var msg = ""
var input: String? = "Swift"
var mystr = "Hello, " + (input ?? "Stranger")
print(mystr)

// Optional Chaining
struct Contacts {
    var email: [String: String]?
    var address: String?
    
    func printAddress() {
        return print(address ?? "no address")
    }
}

struct Person {
    var name: String
    var contacts: Contacts?
    
    init(name: String, email: String) {
        self.name = name
        contacts = Contacts(email: ["home": email], address: "Seoul")
    }
    
    func getContacts() -> Contacts? {
        return contacts
    }
}
var p = Person(name: "James", email: "swift@example.com")
let a_addr = p.contacts?.address

var optionalP: Person? = Person(name: "James", email: "swift@example.com")
let b_addr = optionalP?.contacts?.address

optionalP = nil
let c_addr = optionalP?.contacts?.address

p.contacts?.address?.count

p.getContacts()?.address

if let _ = p.getContacts()?.printAddress() {
    
}

let d_addr = p.contacts?.email?["home"]

p.contacts?.email?["home"]?.count

p.contacts?.address = "Daegu"
p.contacts?.address

// optionalP가 옵셔널이기 때문에 contacts, address에도 접근하지 X
optionalP?.contacts?.address = "Daegu"
optionalP?.contacts?.address

// Optional Pattern
let a: Int? = 0
let b: Optional<Int> = 0

if let x = a {
    print(x)
}

if case .some(let x) = a {
    print(x)
}

if case let x? = a {   // Optional Pattern
    print(x)
}   // a에 값이 있다면 x 상수가 값을 갖게 되고 print() 실행. 없다면 { } 실행 X.

let list: [Int?] = [0, nil, nil, 3, nil, 5]

for item in list {  // Optional Binding
    guard let x = item else { continue }
    print(x)
}

for case let x? in list {   // Optional Pattern
    print(x)
}


