import UIKit

struct Size {
    var width = 0.0
    var height = 0.0
}

extension Size {
    var area: Double {
        return width * height
    }
}

let s = Size()
s.width
s.height
s.area

// 원본 형식을 수정할 수 있다면 굳이 extension을 사용할 필요 X
extension Size: Equatable {
    public static func == (lhs: Size, rhs: Size) -> Bool {
        return lhs.width == rhs.width && lhs.height == rhs.height
    }
}

// 속성 추가
extension Date {
    var year: Int {
        let cal = Calendar.current
        return cal.component(.year, from: self)
    }
    
    var month: Int {
        let cal = Calendar.current
        return cal.component(.month, from: self)
    }
}

let today = Date()
today.year
today.month

extension Double {
    var radianValue: Double {
        return (Double.pi * self) / 180.0
    }
    
    var radianValueStr: String {
        return "\(self / 180.0)π"
    }
    
    var degreeValue: Double {
        return self * 180.0 / Double.pi
    }
    
}

let dv = 90.0
dv.radianValue
dv.radianValueStr
dv.degreeValue

// 메소드 추가
extension Double {
    func toFarenheit() -> Double {
        return self * 9 / 5 + 32
    }// 인스턴스 메소드
    
    func toCelsius() -> Double {
        return (self - 32) * 5 / 9
    }
    
    static func convertToFahrenheit(from celsius: Double) -> Double {
        return celsius.toFarenheit()
    }// 정적 메소드
    
    static func convertToCelsius(from fahrenheit: Double) -> Double {
        return fahrenheit.toCelsius()
    }
}

let c = 30.0
c.toFarenheit()

Double.convertToFahrenheit(from: 30.0)
Double.convertToCelsius(from: 50)

extension Date {
    func toString(format: String = "yyyyMMdd") -> String {
        let privateFormatter = DateFormatter()
        privateFormatter.dateFormat = format
        return privateFormatter.string(from: self)
    }
}

today.toString()

today.toString(format: "MM/dd/yyyy")

extension String {
    static func random(length: Int, charactersIn chars: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789") -> String {
        var randomString = String()
        randomString.reserveCapacity(length)
         
        for _ in 0..<length {
            guard let char = chars.randomElement() else {
                continue
            }
            
            randomString.append(char)
        }
        
        return randomString
    }
}

String.random(length: 5)

// 생성자 추가 - 간편 생성자여야 함
extension Date {
    init?(year: Int, month: Int, day: Int) {
        let cal = Calendar.current
        var comp = DateComponents()
        comp.year = year
        comp.month = month
        comp.day = day
        
        guard let date = cal.date(from: comp) else {
            return nil
        }
        
        self = date
    }
}

Date(year: 2099, month: 12, day: 31)

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: 1.0)
    }
}

UIColor(red: 0, green: 0, blue: 255)


// memberwise 생성자: 구조체가 자동으로 제공하는 생성자

Size()
Size(width: 20, height: 30) // 자동으로 제공하는 생성자

extension Size {
    init(value: Double) {   // 이 생성자가 extension이 아닌 Size에 있었다면 윗 줄은 실행 불가
        width = value
        height = value
    }
}

Size(width: 3, height: 3) // 사용 가능
Size(value: 5)

// Subscript 추가
extension String {
    subscript(idx: Int) -> String? {
        guard(0..<count).contains(idx) else {
            return nil
        }
        
        let target = index(startIndex, offsetBy: idx)
        return String(self[target])
    }
}

let str = "Swift"
str[1]      // "w"
str[100]    // nil

extension Date {
    subscript(component: Calendar.Component) -> Int? {
        let cal = Calendar.current
        return cal.component(component, from: self)
    }
}

today[.year]
today[.month]
today[.day]
