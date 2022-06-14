import UIKit

var greeting = "Hello, playground"
print(greeting)

// 定义一个属性包装器
@propertyWrapper
struct SmallNumber {
    
    private var number: Int
    
    // 属性包装器作用的值
    private(set) var projectedValue: Bool
    
    var wrappedValue: Int {
        get { return number }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }
    
    init() {
        self.number = 0
        self.projectedValue = false
    }
    
}

struct SomeStructure {
    @SmallNumber var someNumber: Int
}

var someStructure = SomeStructure()

someStructure.someNumber = 4

// 在包装的变量前加$，取some
print(someStructure.$someNumber)

someStructure.someNumber = 13

print(someStructure.$someNumber)
