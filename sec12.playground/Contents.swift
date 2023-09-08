import UIKit

let data = ("<html>", 200, "OK", 12.34)
data

// 튜플 멤버에 접근하는 방법 - 인덱스
data.0
data.1
data.2
data.3

var mutableTuple = data
mutableTuple.1 = 404
mutableTuple.1

// 멤버 이름으로 접근
let named = (body: "<html>", statusCode: 200, statusMessage: "OK", dataSize: 12.34)

named.1
named.statusCode

// Tuple 분해
let (body, code, message, size) = data
body

// Tuple 매칭
let resolution = (1920.0, 1080.0)

if resolution.0 == 3840 && resolution.1 == 2160 {
    print("4K")
}

switch resolution {
case let(w, h) where w / h == 16.0 / 9.0:
    print("16:9")
case (_, 1080):
    print("1080p")
case (3840...4096, 2160):
    print("4K")
default:
    break
}
