import Foundation

struct Point: Identifiable, Equatable, Hashable {
    var id = UUID().uuidString
    let x: Int
    let y: Int

    static func == (lhs: Point, rhs: Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == lhs.y
        // return lhs.x == rhs.x
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
        // hasher.combine(y)를 주석처리하면 두번째 사진의 결과 확인 가능
    }
}

func printArray<T: Hashable>(array: [T]) {
    print("Print Array >>")
    for i in array {
        print(i)
    }
}

func removeDuplicate<T: Hashable>(array: inout [T]) {
    printArray(array: array)
    let set = Set(array)
    array = Array(set)
    printArray(array: array)
}

var selectedPoints: [Point] = [Point(x: 100, y: 100), Point(x: 100, y: 100), Point(x: 3, y: 9), Point(x: 3, y: 111), Point(x: 100, y: 300)]

removeDuplicate(array: &selectedPoints)

