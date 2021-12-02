//: [Previous](@previous)

import Foundation

enum Direction {
    case north
    case south
    case east
    case west
}

enum Direction1 {
    case north, south, east, west
}

var dir = Direction.west
dir = Direction.east
dir = .north
print(dir) // north

switch dir {
case .north:
    print("north")
case .south:
    print("south")
case .east:
    print("east")
case .west:
    print("west")
} // north

// MARK: - 关联值(Associated Values)
/// 有时将枚举的成员值跟其它类型的值关联存储在一起,会非常有用
enum Score {
    case points(Int)
    case grade(Character)
}

var score = Score.points(96)
score = .grade("A")
print(score) // grade("A")

switch score {
case let .points(i):
    print(i, "points")
case let .grade(i):
    print("grade", i)
} // grade A

enum Date {
    case digit(year: Int, month: Int, day: Int)
    case string(String)
}

var date = Date.digit(year: 2021, month: 12, day: 03)
date = .string("2021-12-03")
switch date {
case let .digit(year, month, day):
    print(year, month, day)
case .string(let value):
    print(value)
}
// 必要时`let`也可以改为`var`

/// 关联值举例
enum Password {
    case number(Int, Int, Int, Int)
    case gesture(String)
}

var pwd = Password.number(3, 5, 7, 9)
pwd = .gesture("12369")
switch pwd {
case let .number(n1, n2, n3, n4):
    print("number is ", n1, n2, n3, n4)
case let .gesture(str):
    print("gesture is ", str)
}

// MARK: - 原始值
/// 枚举成员可以使用相同类型的默认值预先对应, 这个默认值叫做:原始值

enum PokerSuit: Character {
    case spade = "♠️"
    case heart = "♥️"
    case diamond = "♦️"
    case club = "♣️"
}

var suit = PokerSuit.spade
print(suit)// spade
print(suit.rawValue)//♠️
print(PokerSuit.club.rawValue)//♣️

/// 隐式原始值(Implicitly Assigned Raw Values)
/// 如果枚举的原始值类型是Int、String,Swift会自动分配原始值
enum Direction2: String {
   case north = "north"
   case south = "south"
   case east = "east"
   case west = "west"
}


// MARK: - 枚举递归(Recursive Enumeration)
/// 实例1: 算术表达式
indirect enum ArithExpr {
    case number(Int)
    case sum(ArithExpr, ArithExpr)
    case difference(ArithExpr, ArithExpr)
}

/// 或者这样定义
//enum ArithExpr1 {
//    case number(Int)
//    indirect case sum(ArithExpr1, ArithExpr1)
//    indirect case difference(ArithExpr1, ArithExpr1)
//}

/// 使用如下:
let five = ArithExpr.number(5)
let four = ArithExpr.number(4)
let two = ArithExpr.number(2)
let sum = ArithExpr.sum(five, four)
let difference = ArithExpr.difference(sum, two)

func calculate(_ expr: ArithExpr) -> Int {
    switch expr {
    case let .number(value):
        return value
    case let .sum(left, right):
        return calculate(left) + calculate(right)
    case let .difference(left, right):
        return difference(left) - difference(right)
    }
}
calculate(difference)


//: [Next](@next)
