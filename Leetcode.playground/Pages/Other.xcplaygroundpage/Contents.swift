//: [Previous](@previous)

import Foundation

do {
    let s = 数羊()
    let res = s.sheepCount(1234567890)
    print(res)
    var set: Set<Int> = Set<Int>()
    for i in 1...100 {
        let s = 数羊()
        let result = s.sheepCount(i)
        print("N为\(i) 时, k的值为 \(result.k) --- 遍历个数 count = \(result.numbers.count) --- numbers = \(result.numbers)")
        set.insert(result.k)
    }

    print("set = \(set.sorted())")
    print("set个数 = \(set.count)")
    print("set中的最大值 = \(set.max() ?? 45)")
    print("set中的最小值 = \(set.min() ?? 5)")
}

do {
    let s = 星商面试题()
    s.solution(x: 10, y: 5, z: 2, money: 90)
    
}

//: [Next](@next)
