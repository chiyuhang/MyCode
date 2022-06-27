import UIKit

//var greeting = "Hello, playground"
//print(greeting)
//
//// 定义一个属性包装器
//@propertyWrapper
//struct SmallNumber {
//
//    private var number: Int
//
//    // 属性包装器作用的值
//    private(set) var projectedValue: Bool
//
//    var wrappedValue: Int {
//        get { return number }
//        set {
//            if newValue > 12 {
//                number = 12
//                projectedValue = true
//            } else {
//                number = newValue
//                projectedValue = false
//            }
//        }
//    }
//
//    init() {
//        self.number = 0
//        self.projectedValue = false
//    }
//
//}
//
//struct SomeStructure {
//    @SmallNumber var someNumber: Int
//}
//
//var someStructure = SomeStructure()
//
//someStructure.someNumber = 4
//
//// 在包装的变量前加$，取some
//print(someStructure.$someNumber)
//
//someStructure.someNumber = 13
//
//print(someStructure.$someNumber)

//enum CompassPoint: CaseIterable {
//    case north
//    case south
//    case west
//    case east
//}
//
//var direction = CompassPoint.north
//print(direction)
//print(type(of: direction))
//
//print(CompassPoint.allCases[0])

//let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//
//var reversedNames1 = names.sorted(by: { s1, s2 in
//    return s1 > s2
//})
//
//var reversedNames2 = names.sorted(by: { s1, s2 in
//    s1 > s2
//})
//
//var reversedNames3 = names.sorted(by: { s1, s2 in return s1 > s2 })
//
//var reversedNames4 = names.sorted(by: { s1, s2 in s1 > s2 })
//
//var reversedNames5 = names.sorted(by: { $0 > $1 })
//
//var reversedNames6 = names.sorted() { $0 > $1 }
//
//var reversedNames7 = names.sorted { $0 > $1 }
//
//var reversedNames8 = names.sorted(by: >)

//let digitNames = [
//    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
//    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
//]
//
//let numbers = [16, 58, 510]
//
//numbers.map {
//    digitNames[$0]
//}
//
//let strings = numbers.map {
//    (number) -> String in
//    var number = number
//    var output = ""
//    repeat {
//        output = digitNames[number % 10]! + output
//        number /= 10
//    } while number > 0
//    return output
//}
//
//print(strings)
//
//var completionHandlers: [() -> Void] = []
//
//func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
//    completionHandlers.append(completionHandler)
//}


//var myClosure: String = { () -> String in
//    let str = "hello"
//    return str
//}()
//
//print(myClosure)

struct Point {
    var x = 0, y = 0
    mutating func test() {
        self.x += 1
        self.y += 1
    }
}

class TestPoint {
    var x = 0, y = 0
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    func test() {
        x += 1
        y += 1
    }
}

let p = Point(x: 1, y: 2)
let p1 = TestPoint(x: 1, y: 1)

