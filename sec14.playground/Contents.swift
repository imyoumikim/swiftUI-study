import UIKit

// --------------------------------------------------------
// 배열 - 자료형은 요소의 자료형으로 결정되며, 모두 같은 자료형을 가져야 함
let strArray: Array<String>
let strArray2: [String] // 주로 사용

var nums = [1, 2, 3]

let emptyArray: [Int] = []  // 빈 리터럴을 생성할 때는 타입을 명시해주어야 함
let emptyArray2 = Array<Int>()
let emptyArray3 = [Int]()

let zeroArray = [Int](repeating: 0, count: 10)

// 배열 요소의 개수
nums.count
nums.count == 0     // 배열이 비어있는지 확인하는 방법

nums.isEmpty
emptyArray.isEmpty

// 배열 요소에 접근
let fruits = ["Apple", "Banana", "Melon"]
fruits[0]
fruits[2]

fruits[0...1]   // 올바른 인덱스를 전달하는 것이 중요함

fruits[fruits.startIndex]
fruits[fruits.index(before: fruits.endIndex)] // endIndex = 마지막 인덱스의 다음 인덱스

fruits.first
fruits.last

emptyArray.first    // 빈 배열이라 nil - subscript 문법을 사용하는 것보다 안전
emptyArray.last     // 빈 배열이라 nil

// 배열 요소 추가
var alphabet = ["A", "B", "C"]
alphabet.append("E")    // 배열의 끝에 요소 추가
alphabet.append(contentsOf: ["F", "G"]) // 두 개 이상의 요소를 동시에 추가

alphabet.insert("D", at: 3)
alphabet.insert(contentsOf: ["a", "b", "c"], at: 0) // 지정한 위치에 요소 추가

// 배열 요소 교체
alphabet[0...2] = ["x", "y", "z"]
alphabet

alphabet.replaceSubrange(0...2, with: ["a", "b", "c"])

alphabet[0...2] = ["z"]
alphabet

alphabet[0..<1] = []    // 빈 배열을 전달하므로 삭제
alphabet

// 배열 요소 삭제
alphabet = ["A", "B", "C", "D", "E", "F", "G"]
alphabet.remove(at: 2)

alphabet.removeFirst()  // 첫번째 요소 삭제 & 리턴
alphabet.removeFirst(2) // 앞에서부터 2개의 요소 삭제
alphabet.removeLast()

alphabet.removeAll()    // 모두 삭제 - 배열이 비어있는 경우, 에러 발생

alphabet.popLast()  // 비어있어도 nil 리턴할 뿐, 에러 발생 X

alphabet = ["A", "B", "C", "D", "E", "F", "G"]
alphabet.popLast()
alphabet

// 특정 범위 삭제
alphabet.removeSubrange(0...2)
alphabet

alphabet[0...2] = []
alphabet

// 배열 비교
let a = ["A", "B", "C"]
let b = ["a", "b", "c"]

a == b  // 대소문자 구분 때문에 서로 다르다고 판단함
a != b

a.elementsEqual(b) // false
a.elementsEqual(b) { (lhs, rhs) -> Bool in
    return lhs.caseInsensitiveCompare(rhs) == .orderedSame  // 대소문자 무시하고 비교
}

// 배열 요소 찾기
nums = [1, 2, 3, 1, 2, 3, 5, 3, 6, 7, 9, 2]
nums.contains(1)    // true
nums.contains(8)    // false

nums.contains { (n) -> Bool in
    return n % 2 == 0
}

nums.first { n in
    n % 2 == 0
}   // 가장 먼저 검색되는 짝수인 2를 리턴

nums.firstIndex { n in
    n % 2 == 0
}   // 가장 먼저 검색되는 짝수인 2의 인덱스인 1를 리턴

nums.firstIndex(of: 1)  // 가장 먼저 검색되는 1의 인덱스인 0

nums.lastIndex(of: 1)   // 가장 마지막으로 검색되는 1의 인덱스인 3

// 배열 정렬
nums.sorted()
nums.sorted { (a, b) -> Bool in
    return a > b
}

nums.sorted().reversed()    // 배열이 아닌 ReversedCollection<Array<Int>> 타입
[Int](nums.sorted().reversed()) // [Int]() 생성자를 씌워줌으로써 정수 배열 획득

var mutableNums = nums
mutableNums.sort()
mutableNums.reverse()
mutableNums

mutableNums.swapAt(0, 1)    // 0번째, 1번째 요소를 스왑
mutableNums.shuffle()   // 요소 순서를 랜덤으로 바꿈

// --------------------------------------------------------
// 딕셔너리(Dictionary)
var dict = ["A": "Apple", "B": "Banana"]
dict = [:]   // 빈 딕셔너리. []는 빈 배열을 의미

let dict1: Dictionary<String, Int>
let dict2: [String: Int]

var words = ["A": "Apple", "B": "Banana", "C": "City"]
let emptyDict: [String: String] = [:]
let emptyDict2 = [String: String]()
let emptyDict3 = Dictionary<String, String>()

words.count
words.isEmpty

// 요소(key + value)에 접근
words["A"]      // key로 접근
words["Apple"]  // "Apple"이라는 key는 없으므로 nil. 딕셔너리는 key로만 요소에 접근 가능

let e = words["E"]  // nil
let e2 = words["E", default: "Empty"]   // key가 없는 경우, 디폴트값을 줄 수 있음

for k in words.keys.sorted() {   // key에만 접근 <- 오름차순으로 정렬된 채로 출력
    print(k)
}

for v in words.values { // value에만 접근
    print(v)
}

let keys = Array(words.keys)    // key로만 이루어진 배열 생성
let values = Array(words.values)    // value로만 이루어진 배열 생성

// 요소 추가 & 변경
words = [String: String]()
words["A"] = "Apple"    // key-value 쌍을 통해 요소 추가
words["B"] = "Banana"

words.count
words

words["B"] = "Ball"     // "B"는 이미 있으므로 새로 주어진 value로 값을 변경
words

words.updateValue("City", forKey: "C")  // "C"는 없으므로 새로운 요소가 추가됨. 이 때, nil 리턴
words

words.updateValue("Circle", forKey: "C")    // "C"가 존재하므로 "Circle"로 업데이트
words   // ["A": "Apple", "C": "Circle", "B": "Ball"]

// 요소 삭제
words["B"] = nil
words   // ["A": "Apple", "C": "Circle"]

words["Z"] = nil    // 존재하지 않는 key를 삭제 -> 아무 일도 일어나지 X

words.removeValue(forKey: "A")  // "A" key의 요소를 삭제한 다음, 삭제한 value를 리턴
words   // ["C": "Circle"]

words.removeValue(forKey: "A")  // "A" key는 이미 없으므로 nil 리턴

words.removeAll()   // 전체 요소 삭제

// 요소 비교
let ad = ["A": "Apple", "B": "Banana", "C": "City"]
let bd = ["A": "Apple", "C": "City", "B": "banana"]

ad == bd    // true <- 딕셔너리에서 요소의 순서는 중요 X. 같은 key와 value를 가졌는지가 중요. 대소문자 구분 O
ad != bd    // false

//ad.elementsEqual(bd) { (lhs, rhs) -> Bool in
//    return lhs.key.caseInsensitiveCompare(rhs.key) == .orderedSame &&
//    lhs.value.caseInsensitiveCompare(rhs.value) == .orderedSame
//}   // 대소문자 구분을 무시하고자 했으나, 잘못된 코드

let aKeys = ad.keys.sorted()    // 먼저 key를 정렬한 후, 정렬된 key를 기준으로 비교해야 함
let bKeys = bd.keys.sorted()

aKeys.elementsEqual(bKeys) { (lhs, rhs) -> Bool in
    guard lhs.caseInsensitiveCompare(rhs) == .orderedSame else {
        return false
    }   // key 비교
    
    guard let lv = ad[lhs], let rv = bd[rhs],
          lv.caseInsensitiveCompare(rv) == .orderedSame
    else {  // key를 통해 value 비교
        return false
    }
    
    return true
}   // 매번 실행할 때마다 같은 순서로 비교하므로 일정한 결과

// 요소 검색
words = ["A": "Apple", "B": "Banana", "C": "City"]

let c: ((String, String)) -> Bool = {   // key에 "B"가 포함되어 있거나, value에 "i"가 포함되어 있는지
    $0.0 == "B" || $0.1.contains("i")
}

words.contains(where: c)    // 클로저 c가 한번이라도 true라면 true

let r = words.first(where: c)   // 검색된 첫번째 요소(옵셔널 튜플) 리턴 - 딕셔너리는 순서가 없으므로 결과가 매번 다를 수 O
r?.key
r?.value

words.filter(c)     // ["B": "Banana", "C": "City"]

// --------------------------------------------------------
// 집합(Set)
let set: Set<Int> = [1, 2, 2, 3, 3, 3]  // 자료형 생략 가능
set.count
set.isEmpty

set.contains(1)

// 요소 추가 & 삭제
var wordSet = Set<String>()

var insertResult = wordSet.insert("Swift")
insertResult.inserted   // Bool: true
insertResult.memberAfterInsert  // Element: "Swift"

insertResult = wordSet.insert("Swift")
insertResult.inserted   // false <- 이미 "Swift"를 추가했기 때문
insertResult.memberAfterInsert  // "Swift"

wordSet // {"Swift"}
var updateResult = wordSet.update(with: "Swift")
updateResult
wordSet // {"Swift"}

updateResult = wordSet.update(with: "Apple")    // nil 리턴 <- insert
updateResult    // nil
wordSet // {"Swift", "Apple"}

// upsert에서 update 이해하기
var value = "Swift"
value.hashValue

updateResult = wordSet.update(with: value)
updateResult

value = "Hello"
value.hashValue

updateResult = wordSet.update(with: value)
updateResult

struct SampleData: Hashable {
    var hashValue: Int = 123
    var data: String
    
    init(_ data: String) {
        self.data = data
    }
    
    static func ==(lhs: SampleData, rhs: SampleData) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}

var sampleSet = Set<SampleData>()
var data = SampleData("Swift")
data.hashValue      // 123

var r2 = sampleSet.insert(data)
r2.inserted
r2.memberAfterInsert
sampleSet   // {{hashValue 123, data "Swift"}}

data.data = "Hello" //  data 속성을 Hello로 변경
data.hashValue

r2 = sampleSet.insert(data)
r2.inserted
r2.memberAfterInsert
sampleSet   // {{hashValue 123, data "Swift"}} -> 동일한 해쉬값으로 인식되기 때문에 Hello로 변경되지 않았음

sampleSet.update(with: data)
sampleSet

// 요소 삭제
wordSet
wordSet.remove("Swift")
wordSet

wordSet.remove("Ghost") // 없는 요소이므로 nil 리턴
wordSet.removeAll()     // 전체 요소 삭제

// 요소 비교
var setA: Set = [1, 2, 3, 4, 5, 6, 7, 8, 9]
var setB: Set = [1, 3, 5, 7, 9]
var setC: Set = [2, 4, 6, 8, 10]
var setD: Set = [1, 7, 5, 9, 3]

setA == setB
setA != setB

setB == setD    // true: 순서는 달라도 가지고 있는 값이 모두 같으므로

setB.elementsEqual(setD)    // 집합은 순서가 없는데, 이 메소드는 순서대로 비교하므로 때에 따라 결과가 달라짐

// 부분집합, 상위집합
setA.isSubset(of: setA)         // true
setA.isStrictSubset(of: setA)   // false: 진부분집합 X

setB.isSubset(of: setA)         // true
setB.isStrictSubset(of: setA)   // true: 진부분집합 O

setA.isSuperset(of: setA)       // true
setA.isStrictSuperset(of: setA) // false

setA.isSuperset(of: setB)       // true
setA.isStrictSuperset(of: setB) // true

setA.isSuperset(of: setC)       // false
setA.isStrictSuperset(of: setC) // false

// 서로소 집합이면 true, 교집합이 있으면 false
setA.isDisjoint(with: setB)     // false
setA.isDisjoint(with: setC)     // false
setB.isDisjoint(with: setC)     // true

// 합집합 만들기
setA = [1, 2, 3, 4, 5, 6, 7, 8, 9]
setB = [1, 3, 5, 7, 9]
setC = [2, 4, 6, 8, 10]

var result = setB.union(setC)   // 합집합
result = setB.union(setA)

setB.formUnion(setC)    // 합집합 만들기 - 원본을 직접 변경
setB

// 교집합 만들기
setA = [1, 2, 3, 4, 5, 6, 7, 8, 9]
setB = [1, 3, 5, 7, 9]
setC = [2, 4, 6, 8, 10]

result = setA.intersection(setB)
result = setC.intersection(setB)

setA.formIntersection(setB)
setA

setB.formIntersection(setC) // 교집합이 없으므로 빈 집합이 됨

// 여집합 구하기
setA = [1, 2, 3, 4, 5, 6, 7, 8, 9]
setB = [1, 3, 5, 7, 9]
setC = [2, 4, 6, 8, 10]

result = setA.symmetricDifference(setB) // 교집합 제외. [2, 4, 6, 8, 10]
result = setC.symmetricDifference(setB) // setB, setC는 교집합이 없으므로 그들의 합집합

setA.formSymmetricDifference(setB)  // 원본 변경

// 차집합 구하기
result = setA.subtracting(setB)

setA.subtract(setB) // 원본 변경
setA

// 컬렉션 열거하기 --------------------------------------------------------
// 1. for ... in 사용
print("Array", "===========")
let arr = [1, 2, 3]
for num in arr {
    print(num)  // 순서대로 출력
}

print("Set", "===========")
let set2: Set = [1, 2, 3]
for num in set2 {
    print(num)  // 순서는 실행할 때마다 달라짐
}

print("Dictionary", "===========")
let dictionary = ["A": 1, "B": 2, "C": 3]
for (key, value) in dictionary {
    print(key, value)   // 순서는 실행할 때마다 달라짐
}

// 2. forEach 메소드 사용 - 함수형 패러다임 코드를 작성할 때 주로 사용
print("Array", "===========")
arr.forEach { num in
    print(num)
}

print("Set", "===========")
set2.forEach { num in
    print(num)
}

print("Dictionary", "===========")
dictionary.forEach { elem in
    print(elem.key, elem.value)
}

func withForIn() {
    print(#function)
    for num in arr {    // for문 안에서 break, continue 사용 가능
        print(num)
        return  // for문을 종료
    }
}

func withForeach() {
    print(#function)
    arr.forEach { num in
        print(num)
        return  // 현재 실행 중인 클로저만 종료 -> 반복 횟수에는 영향 X
    }
}

withForIn()     // 출력: 1
withForeach()   // 출력: 1 2 3
