import UIKit

//func name(parameters) throws -> ReturnType {  // throwing function/method
//    statements
//}
//
//init(parameters) throws { // throwing initializer
//    statement
//}
//
//{ (parameters) throws -> ReturnType in    // throwing closure
//    statement
//}

enum DataParsingError: Error {
    case invalidType
    case invalidField
    case missingRequiredField(String)
}

func parsing(data: [String: Any]) throws {  // throws가 있다고 해서 throw문이 있어야 하는 것은 아님
    guard let _ = data["name"] else {
        throw DataParsingError.missingRequiredField("name") // 같은 블록의 나머지 코드는 실행되지 X
    }
    guard let _ = data["age"] as? Int else {
        throw DataParsingError.invalidType
    }
    // Parsing
}   // name키가 존재하고, age키의 값을 Int로 변환할 수 있다면 throw문은 실행되지 않음

if let _ = try? parsing(data: [:]) {
    print("success")
} else {
    print("fail")
}

do {
    try parsing(data: [:])
    print("success")
} catch {
    print("fail")
}

try? parsing(data: [:]) // nil

//try! parsing(data: [:])
try! parsing(data: ["name": "steve", "age": 33])
// forced try: 발생한 에러를 다른 곳으로 전달 불가. 에러가 발생하는 즉시 강제 종료, do catch 사용 불가. 가능한 사용 자제.

func handleError() throws {
    do {
        try parsing(data: [:])  // throwing function이므로 try 필요
    } catch {
        if let error = error as? DataParsingError {
            switch error {
            case .invalidType:
                print("invalid type")
            default:
                print("handle error")
            }
        }
    }
}

func processFile(path: String) {
    print("1")
    let file = FileHandle(forReadingAtPath: path)
    
    // Process
    
    defer { // defer문의 실행은 함수가 종료될 때까지 연기됨 -> 함수가 종료되는 시점에 실행
        print("2")
        file?.closeFile()
    }
    
    if path.hasSuffix(".jpg") {
        print("3")
        return
    }
    print("4")
}

processFile(path: "file.swift") // 1 4 2 출력
print("------------")
func testDefer() {
    defer {
        print(1)
    }
    defer {
        print(2)
    }
    defer {
        print(3)
    }   // 가장 마지막에 예약된 블록이 먼저 실행
}

testDefer() // 3 2 1의 순서로 출력

// Result Type

enum NumberError: Error {
    case negativeNumber
    case evenNumber
}

enum AnotherNumberError: Error {
    case tooLarge
}

func process(oddNumber: Int) throws -> Int {
    guard oddNumber >= 0 else {
        throw NumberError.negativeNumber
    }
    guard !oddNumber.isMultiple(of: 2) else {
        throw NumberError.evenNumber
    }
    guard oddNumber < 1000 else {
        throw AnotherNumberError.tooLarge
    }
    return oddNumber * 2
}

let result = Result { try process(oddNumber: 10001) }
switch result {
case .success(let data):
    print(data)
case .failure(let error):
    print(error.localizedDescription)
}

//func processResult(oddNumber: Int) -> Result<Int, NumberError> {
//    guard oddNumber >= 0 else {
//        throw Result.failure(NumberError.negativeNumber)
//    }
//    guard !oddNumber.isMultiple(of: 2) else {
//        throw NumberError.evenNumber
//    }
//    guard oddNumber < 1000 else {
//        throw AnotherNumberError.tooLarge
//    }
//    return oddNumber * 2
//}

//do {
//    let result = try process(oddNumber: 1)
//    print(result)
//} catch let myErr as NumberError {
//    switch myErr{
//    case .negativeNumber:
//        print("negative number")
//    case .evenNumber:
//        print("even number")
//    }
//
//} catch {
//    print(error.localizedDescription)
//}

let res = Result { try process(oddNumber: 1) }
switch res {
case .success(let data):
    print(data)
case .failure(let error):
    print(error.localizedDescription)
}

func processResult(oddNumber: Int) -> Result<Int, NumberError> {
    guard oddNumber >= 0 else {
        return .failure(.negativeNumber)
    }
    guard !oddNumber.isMultiple(of: 2) else {
        return .failure(.evenNumber)
    }

    return .success(oddNumber * 2)
}   // 에러를 직접 던지지 않고 연관값으로 리턴. 성공과 실패가 열거형으로 리턴됨

let result2 = processResult(oddNumber: 1)
switch result2 {
case .success(let data):
    print(data)
case .failure(let error):
    print(error.localizedDescription)
}

if let result = try? result2.get() {    // 에러 처리 코드
    print(result)
}

// throwing function이 정확히 어떤 형식 에러를 던지는지 알 수 없음
// Result 형식 사용하면 에러 형식이 명시적으로 선언됨
// 컴파일 타임에 에러 형식을 알 수 있다 - 형식 안전성
print("------------")

guard let url = URL(string: "http://kxcoding-study.azurewebsites.net/api/books") else {
    fatalError("invalid url")
}

struct BookListData: Codable {
    let code: Int
    let totalCount: Int
    let list: [Book]
}

struct Book: Codable {
    let title: String
}

enum ApiError: Error {
    case general
    case invalidFormat
}

typealias CompletionHandler = (Result<BookListData, ApiError>) -> ()

func parseBookList(completion: @escaping CompletionHandler) {
    let task = URLSession.shared.dataTask(with: url) {
        (data, response, error) in
        if let error = error {
            completion(.failure(.general))
            return
        }
        
        guard let data = data else {
            completion(.failure(.general))
            return
        }
        
        do {
            let list = try JSONDecoder().decode(BookListData.self, from: data)
            completion(.success(list))
        } catch {
            completion(.failure(.general))
        }
    }
    task.resume()
}

parseBookList{ (result) in
    switch result {
    case .success(let data):
        data.list.forEach { print($0.title) }
    case .failure(let error):
        print(error.localizedDescription)
        
        switch error {
        case .general:
            break
        case .invalidFormat:
            break
        }
    }
}

// Result type in Async code
print("------------")

enum MyError: Error {
    case error
}

enum ValueError: Error {
    case evenNumber
}

func doSomethingWithResult(data: Int) -> Result<Int, MyError> {
    guard data.isMultiple(of: 2) else {
        return .failure(MyError.error)
    }
    
    return .success(data)
}

let a = doSomethingWithResult(data: 0)
let b = a.map { $0.isMultiple(of: 2) ? "even number" : "odd number" }
let c = a.flatMap { $0.isMultiple(of: 2) ? .success("even number") : .success("odd number") }
// 현재 success 값을 받아서 새로운 result 인스턴스 반환
// 실패값은 변환 x

//a.mapError(<#T##transform: (MyError) -> Error##(MyError) -> Error#>)
//a.flatMapError(<#T##transform: (MyError) -> Result<Int, Error>##(MyError) -> Result<Int, Error>#>)
