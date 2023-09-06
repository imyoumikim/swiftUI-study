import UIKit

for _ in 1...3 {    // wildcard pattern
    print("Hello")
}

for num in stride(from: 0, to: 10, by: 2) { // 일정한 간격 부여
    print(num)
}

let list = ["Apple", "Banana", "Cherry"]
for fruit in list {
    print(fruit)
}

for i in 1...5 {
    for _ in 1...i {
        print("*", terminator: "")
    }
    print()
}

print("-------")

for i in 0..<5 {
    for j in 0..<5 {
        if (i + j) >= 4{
            print("*", terminator: "")
        } else {
            print(" ", terminator: "")
        }
    }
    print()
}

var num = 100
while num < 100 {
    num += 1
}
num

num = 100
repeat {
    num += 1
} while num < 100
num
