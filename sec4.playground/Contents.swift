import UIKit

print(Int8.min, Int8.max)   // -128 ~ 127
print(UInt8.min, UInt8.max) // 0 ~ 255

MemoryLayout<Int8>.size // Int8에 저장 가능한 byte 수 = 1
 
MemoryLayout<Int>.size  // 8 byte
Int.max                 // 9,223,372,036,854,775,807
Int.min                 // -9,223,372,036,854,775,808

let num = 123
print(type(of: num))

let ch: Character = "a"
print(type(of: ch))     // Character

let ch2 = "a"
print(type(of: ch2))    // String - 한 글자는 Character 또는 String

let st = "abc"
print(type(of: st))

let emptyCh = ""
print(type(of: emptyCh))    // 빈 문자도 String

let a = 123
let b = 3.45

Double(a) + b   // 126.45 -> 같은 자료형끼리 연산 가능
a + Int(b)      // 12
