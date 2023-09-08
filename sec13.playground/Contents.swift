import UIKit

var nsstr: NSString = "str"
let swiftStr: String = nsstr as String  // Swift 문자열을 Foundation 문자열에 저장할 때 타입캐스팅 필요
nsstr = swiftStr as NSString    // bridging이 가능한 타입

let immmutableStr = "str"
var mutableStr = "str"
mutableStr = "new str"

var str = "Swift String"

str.utf8
str.utf16

var thumbUp = "👍"
thumbUp = "\u{1F44D}"   // 유니코드 스칼라 사용
//👍
//올린 엄지
//유니코드: U+1F44D, UTF-8: F0 9F 91 8D

// ------------------------------------------------------------------------------------

let lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."

let multiline = """
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
    """

print(multiline)

print("===기본===")
var quotationMark = "\"Lorem\"\nIpsum"
print(quotationMark)

print("===Raw String===")
var rawStr = #"Lorem\#nIpsum"#   // Raw String
print(rawStr)

print("===Raw String with ###===")
rawStr = ###"Lorem\###nIpsum"###
print(rawStr)

let value = 123
str = "The value is \(value)"
rawStr = #"The value is \#(value)"#

var zipCodeRegex = "^\\d{3}-?\\d{3}$"
zipCodeRegex = #"^\d{3}-?\d{3}$"#

let zipCode = "123-456"
if let _ = zipCode.range(of: zipCodeRegex, options: [.regularExpression]) {
    print("\nvalid")
}

var size = 12.34
var memorySize = "\(size)KB"

memorySize = String(format: "%.1fKB", size) // f는 실수
String(format: "Hello, %@", "Swift")    // @은 문자열
String(format: "%d", 12)  // d, D 상관 없음

String(format: "%.3f", 12.34183)
String(format: "%8.3f", 12.34183)
String(format: "%010.3f", 12.34183) // % 다음에 오는 0은 0으로 채운다는 뜻, 그 다음에 오는 정수는 전체 자릿수

String(format: "[%d]", 123)
String(format: "[%10d]", 123)   // 오른쪽 정렬
String(format: "[%-10d]", 123)  // 왼쪽 정렬

let firstName = "Yoon-ah"
let lastName = "Lim"

let korFormat = "당신의 이름은 %2$@ %1$@ 입니다."    // 2$, 1$는 순서를 의미
let engFormat = "Your name is %@ %@."

String(format: korFormat, firstName, lastName)
String(format: engFormat, firstName, lastName)

var escStr = "\\"   // \(Backslash) 하나를 의미
print(escStr)

print("A\tB")
print("C\nD")

print("\"Hello\" He said.")  // "(큰 따옴표) 추가
print("\'Hello\' He thought.")  // '(작은 따옴표) 추가

// ------------------------------------------------------------------------------------

struct Size {
    var width = 0.0
    var height = 0.0
}

let s = Size(width: 1.2, height: 3.4)

//extension Size: CustomStringConvertible {
//    var description: String {
//        return "\(width) x \(height)"
//    }
//}

extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: Size) {
        appendInterpolation("\(value.width) x \(value.height)")
    }
    
    mutating func appendInterpolation(_ value: Size, style: NumberFormatter.Style) {
        let formatter = NumberFormatter()
        formatter.numberStyle = style
        
        if let width = formatter.string(for: value.width), let height = formatter.string(for: value.height) {
            appendInterpolation("\(width) x \(height)")
        } else {
            appendInterpolation("\(value.width) x \(value.height)")
        }
        
    }
}

print("\(s)")
print("\(s, style: .spellOut)")

// ------------------------------------------------------------------------------------

let wordIdx = "Swift"
let firstCh = wordIdx[wordIdx.startIndex]
print("first Character:", firstCh)

let secondCharIndex = wordIdx.index(after: wordIdx.startIndex)
let secondCh = wordIdx[secondCharIndex]
print("Second Character:", secondCh)

let lastCharIndex = wordIdx.index(before: wordIdx.endIndex)
let lastCh = wordIdx[lastCharIndex]
print("Last Character:", lastCh)

var thirdCharIndex = wordIdx.index(wordIdx.startIndex, offsetBy: 2) // start index로부터 2칸 떨어진 인덱스
var thirdCh = wordIdx[thirdCharIndex]
print("Third Character with positive offset:", thirdCh)

thirdCharIndex = wordIdx.index(wordIdx.endIndex, offsetBy: -3)
thirdCh = wordIdx[thirdCharIndex]
print("Third Character with negative offset:", thirdCh)

if thirdCharIndex < wordIdx.endIndex && thirdCharIndex >= wordIdx.startIndex {
    
}   // 인덱싱할 때는 유효한 범위 내에 있는지부터 확인하는 습관을 기르자

// ------------------------------------------------------------------------------------

var emptyStr = String() // 생성자에 인자를 전달하지 않으면 길이가 0인 빈 문자열 생성
let a = String(true)    // true를 문자열로
let b = String(123)     // 123을 문자열로
let c = String(12.34)   // 12.34를 문자열로
let d = String(str)

let hex = String(123, radix: 16)    // 123을 16진수로, 7b
let octal = String(123, radix: 8)   // 123을 8진수로, 173
let binary = String(123, radix: 2)  // 123을 2진수로, 1111011

// 특정 문자를 원하는 만큼 반복
let repeatStr = String(repeating: "😪", count: 5)
let unicode = "\u{1F62A}"

let e = "\(a) \(b)"
let f = a + " " + b
str += "!!"

str.count
str.isEmpty     // 문자열이 비어있는지 확인

"apple" < "Apple"   // false. 아스키코드에서 소문자가 대문자보다 큰 값을 갖기 때문.

str.lowercased()    // 원본을 그대로 두고 소문자로 변환한 값을 리턴
str.uppercased()
str


"apple ipad".capitalized   // upper camel case로 변환

for char in "Hello" {   // 문자열은 문자들의 집합 = Character Sequence
    print(char)
}

let num = "12345"
num.randomElement()

num.shuffled()  // 랜덤으로 섞어서 문자 배열로 출력

// ------------------------------------------------------------------------------------

let substr = "Hello, Swift"
var first = substr.prefix(1)

first.insert("!", at: first.endIndex)
let newStr = String(substr.prefix(1))

// Substring 방법
let s2 = substr[..<substr.index(substr.startIndex, offsetBy: 2)]    // substr[0]부터 [1]까지

substr[substr.index(substr.startIndex, offsetBy: 2)...]     // substr[2]부터 끝까지

let lower = substr.index(substr.startIndex, offsetBy: 2)    // [2]
let upper = substr.index(substr.startIndex, offsetBy: 5)    // [5]
substr[lower ... upper]     // [2]~[5]

// ------------------------------------------------------------------------------------

// 문자열 편집
var str2 = "Hello"
str2.append("!!")   // 대상 문자열을 직접 변경
str2

let str3 = str2.appending(" Swift")     // 원본 변경 X
str2
str3

"File size is".appendingFormat("%.1f", 123.456)

var ex = "Hello Swift"
ex.insert(",", at: ex.index(substr.startIndex, offsetBy: 5))   // 5번째 위치에 "," 추가

if let sIndex = ex.firstIndex(of: "S") {
    ex.insert(contentsOf: "Awesome ", at: sIndex)
}

var ex2 = "Hello, Objective-C"

if let range = ex2.range(of: "Objective-C") {
    ex2.replaceSubrange(range, with: "Swift")   // Hello, Swift
}

if let range = ex2.range(of: "Hello") {
    let s = ex2.replacingCharacters(in: range, with: "Hi")  // Hi, Swift
}

ex2

var s3 = ex2.replacingOccurrences(of: "Swift", with: "Awesome Swift")
var s4 = ex2.replacingOccurrences(of: "swift", with: "Awesome Swift")   // swift를 못 찾아서 아무 일도 일어나지 않음
var s5 = ex2.replacingOccurrences(of: "swift", with: "Awesome Swift", options: [.caseInsensitive])  // 대소문자 구분이 없으므로 Awesome Swift로 변경]

var s6 = "Hello, Awesome Swift🙄🐶"
let lastCharIndex2 = s6.index(before: s6.endIndex)

var removed = s6.remove(at: lastCharIndex2) // 마지막 글자인 이모지 삭제
s6

removed = s6.removeFirst()
s6

s6.removeFirst(2)   // 처음에 있는 2개의 문자 삭제 -> 삭제된 문자를 리턴하지는 X

s6.removeLast()
s6.removeLast(3)    // 뒤에 있는 3개의 문자 삭제

if let range = s6.range(of: "Awesome") {
    s6.removeSubrange(range)    // 범위 삭제
    s6
}

s6.removeAll()  // 메모리 공간도 삭제
s6.removeAll(keepingCapacity: true) // 만약 문자열을 초기화하고 비슷한 길이의 문자열을 다시 저장한다면 메모리 공간을 유지하는 것이 좋음 -> 오버헤드 방지

// drop 메소드들은 Substring을 리턴
str = "Hello, Awesome Swift!!!"
var mysubstr = str.dropLast() // 원본 문자열에서 마지막 문자 빼기. 원본 문자열을 공유함
mysubstr = str.dropLast(3)
mysubstr = str.drop(while: { (ch) -> Bool in
    return ch != ","
})  // 클로저 내부를 보면 각 문자가 전달되고, true가 리턴되는 동안 문자 삭제
mysubstr

// ------------------------------------------------------------------------------------
// 문자열 비교
let largeA = "Apple"
let smallA = "apple"
let largeB = "Banana"

largeA == smallA
largeA != smallA

largeA < smallA // 아스키코드 상 소문자가 더 큼
largeA < largeB
smallA < largeB

largeA.compare(smallA) == .orderedSame                  // 문자열이 같은지
largeA.caseInsensitiveCompare(smallA) == .orderedSame   // 대소문자 구분 없이 문자열이 같은지 비교
largeA.compare(smallA, options: [.caseInsensitive]) == .orderedSame    // 위 코드와 동일

str = "Hello, Swift Programming!"
let prefix = "Hello"
let suffix = "Programming"

str.hasPrefix(prefix)
str.lowercased().hasPrefix(prefix.lowercased())         // 대소문자 구분이 필요 없다면
str.hasSuffix(suffix)

// ------------------------------------------------------------------------------------

str = "Hello, Swift"
str.contains("swift")   // 대소문자 구분때문에 false
str.lowercased().contains("swift")  // 대소문자 구분 없음

str.range(of: "Swift")
str.range(of: "swift", options: [.caseInsensitive])

str2 = "Hello, Programming"
let str4 = str2.lowercased()
var common = str.commonPrefix(with: str2)   // 공통된 부분을 새로운 문자열로 리턴

common = str.commonPrefix(with: str4)   // 대소문자 구분으로 인해 common = ""
str.commonPrefix(with: str4, options: [.caseInsensitive])

// ------------------------------------------------------------------------------------

"A" == "a"
"A".caseInsensitiveCompare("a") == .orderedSame
"A".compare("a", options: [.caseInsensitive]) == .orderedSame

NSString.CompareOptions.caseInsensitive

let han = "\u{D55C}"
let hanSet = "\u{1112}\u{1161}\u{11AB}"

han == hanSet
a.compare(b) == .orderedSame

a.compare(b, options: [.literal]) == .orderedSame   // .literal 옵션을 주면 더 빠름

// Backwards Option
let korean = "행복하세요"
let english = "Be happy"
let arabic = "كن سعيدا"

if let range = english.range(of: "p") { // 앞에서 뒤로 검색. 앞에서 처음으로 나오는 p는 5번째 인덱스
    english.distance(from: english.startIndex, to: range.lowerBound)
}

if let range = english.range(of: "p", options: [.backwards]) {  // 뒤에서 앞으로 검색. 뒤에서 처음으로 나오는 p는 6번째 인덱스
    english.distance(from: english.startIndex, to: range.lowerBound)
}

// Anchored Option
str = "Swift Programming"

if let result = str.range(of: "Swift") {        // 0
    print(str.distance(from: str.startIndex, to: result.lowerBound))
} else {
    print("not found")
}

if let result = str.range(of: "Swift", options: [.anchored]) {      // 0
    print(str.distance(from: str.startIndex, to: result.lowerBound))
} else {
    print("not found")
}

if let result = str.range(of: "Swift", options: [.backwards]) {     // 0
    print(str.distance(from: str.startIndex, to: result.lowerBound))
} else {
    print("not found")
}

if let result = str.range(of: "Swift", options: [.anchored, .backwards]) {  // not found
    print(str.distance(from: str.startIndex, to: result.lowerBound))
} else {
    print("not found")
}

str.lowercased().hasPrefix("swift")

if let _ = str.range(of: "swift", options: [.anchored, .caseInsensitive]) {
    print("same prefix")
}

// Numeric Option
let file9 = "file9.txt"
let file10 = "file10.txt"

file9 < file10  // 문자 하나씩 비교하는데 9 > 1이므로 false를 리턴함 -> .numeric 옵션 필요

file9.compare(file10) == .orderedAscending  // false
file9.compare(file10, options: [.numeric]) == .orderedAscending // true

let cafe1 = "Cafe"
let cafe2 = "Cafè"

cafe1.compare(cafe2) == .orderedSame    // false
cafe1.compare(cafe2, options: [.diacriticInsensitive]) == .orderedSame  //true

// 전각 문자와 반각 문자
"\u{30A1}".compare("\u{ff67}") == .orderedSame    // false
"\u{30A1}".compare("\u{ff67}", options: [.widthInsensitive]) == .orderedSame    // true

// 정규식
let emailPattern = "([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\\.[0-9a-zA-Z_-]+){1,2}"
let emailAddress = "user@example.com"

if let _ = emailAddress.range(of: emailPattern) {
    print("found")
} else {
    print("not found")
}

if let range = emailAddress.range(of: emailPattern, options: [.regularExpression]), (range.lowerBound, range.upperBound) == (emailAddress.startIndex, emailAddress.endIndex) {
    print("found")
} else {
    print("not found")
}

// ------------------------------------------------------------------------------------

let upperCs = CharacterSet.uppercaseLetters
let lowerCs = upperCs.inverted

str = "loRem Ipsum"
var charSet = CharacterSet.uppercaseLetters

if let range = str.rangeOfCharacter(from: charSet) {    // 2
    print(str.distance(from: str.startIndex, to: range.lowerBound))
}

if let range = str.rangeOfCharacter(from: charSet, options: [.backwards]) { // 6
    print(str.distance(from: str.startIndex, to: range.lowerBound))
}

str = " A p p l e "
charSet = .whitespaces

let trimmed = str.trimmingCharacters(in: charSet)  // CharacterSet에 포함되어있는 문자를 문자열에서 삭제해서 리턴
print(trimmed)

var editTarget = CharacterSet.uppercaseLetters
editTarget.insert("#")
editTarget.insert(charactersIn: "~!@")

editTarget.remove("A")
editTarget.remove(charactersIn: "BCD")

let customCharSet = CharacterSet(charactersIn: "@.")    // 문자 2개로 이루어진 CharacterSet
let emailAddr = "userId@example.com"

let components = emailAddr.components(separatedBy: customCharSet)   // CharacterSet에 포함된 문자를 기준으로 문자열을 자름
