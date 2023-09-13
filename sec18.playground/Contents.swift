import UIKit

class List {
    var data = [1, 2, 3]
    
    subscript(i index: Int) -> Int {
        get {
            return data[index]
        }
        
        set {
            data[index] = newValue
        }
    }
}

var l = List()
l[i: 0]

l[i: 1] = 123

struct Matrix {
    var data = [[1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]]
    
    subscript(row: Int, col: Int) -> Int {
        return data[row][col]
    }   // 읽기 전용 서브스크립트
}

let m = Matrix()
m[0, 0] // 두 개 이상의 값을 전달할 때는 ,로 나열
// m[0][0]  <- 첫번째 서브스크립트 m[0]이 정상적으로 평가되었다면 Int 리턴
// 정수에서 서브스크립트 사용 불가능 -> 에러
