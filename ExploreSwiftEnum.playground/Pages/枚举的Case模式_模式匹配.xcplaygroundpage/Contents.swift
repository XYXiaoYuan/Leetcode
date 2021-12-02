//: [Previous](@previous)

import Foundation

let age = 2
// 原来的写法
if age >= 0 && age <= 9 {
    print("原来的写法 - [0, 9]")
}

// 枚举`Case`模式 - if case
if case 0...9 = age {
    print("枚举`Case`模式 if case - [0, 9]")
}

// OR 枚举`Case`模式 - guard case
func guardCase() -> Int? {
    guard case 0...9 = age else { return nil }
    print("枚举`Case`模式 - guard case - [0, 9]")
    return 0
}
guardCase()

// switch case
switch age {
case 0...9: print("switch case - [0, 9]")
default: break
}

// 遍历 for case
let ages: [Int?] = [2, 3, nil, 5]
for case nil in ages {
    print("for case - 有nil值")
}

// 遍历 for case let
let points = [(1, 0), (2, 1), (3, 0)]
for case let (x, 0) in points {
    print("for case let - \(x)")
}

//: [Next](@next)
