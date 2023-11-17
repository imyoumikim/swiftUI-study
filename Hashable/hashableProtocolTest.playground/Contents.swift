import Foundation

struct Point: Identifiable, Equatable, Hashable {
    var id = UUID().uuidString
    let x: Int
    let y: Int

    static func == (lhs: Point, rhs: Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == lhs.y
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
} // combine()은 ==의 조건과 동일하게 사용해야 함

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

