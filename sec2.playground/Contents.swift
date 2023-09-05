import UIKit

let g1 = 123

func doSomething() {
    let l1 = 123
    let g1 = 345    // 전역변수 g1이 있지만 선언 가능(범위가 다르다면 같은 이름을 사용 가능)
    print(g1)   // 345 - 가까운 지역변수
    
    if true {
        let g1 = 999
        print(g1)   // 999 - 가까운 지역변수
    }
    
}

print(g1)   // 123 - 전역변수 g1
doSomething()
