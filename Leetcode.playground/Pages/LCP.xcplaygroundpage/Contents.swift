//: [Previous](@previous)

import Foundation

do {
    let s = _LCS01_下载插件()
    let result = s.leastMinutes(1)
    print("\(s) --- \(result)")

    assert(s.leastMinutes(1) == 1)
    assert(s.leastMinutes(2) == 2)
    assert(s.leastMinutes(3) == 3)
    assert(s.leastMinutes(4) == 3)
    assert(s.leastMinutes(5) == 4)
    assert(s.leastMinutes(6) == 4)
    assert(s.leastMinutes(7) == 4)
    assert(s.leastMinutes(8) == 4)
    assert(s.leastMinutes(9) == 5)
}

do {
    let s = _LCP06_拿硬币()
    let result = s.minCount([4,2,1])
    print("\(s) --- \(result)")

    assert(s.minCount([4,2,1]) == 4)
    assert(s.minCount([2,3,10]) == 8)
}

do {
    let s = _LCP17_速算机器人()
    let result = s.calculate("AB")
    print("\(s) --- \(result)")

    assert(s.calculate("AB") == 4)
}

do {
    let s = _LCP_18_早餐组合()

    let result1 = s.breakfastNumber([10,20,5], [5,5,2], 15)
    assert(result1 == 6)
    print(result1)

    let result2 = s.breakfastNumber([2,1,1], [8,9,5,1], 9)
    assert(result2 == 8)
    print(result2)

    s.test()
}

do {
    let s = _LCP22_黑白方格画()
    let result = s.paintingPlan(3, 8)
    print("\(s) --- \(result)")

    //let result1 = s.paintingPlan1(2, 2)
    //print("\(s) --- \(result1)")

    assert(s.paintingPlan(2, 2) == 4)
    assert(s.paintingPlan(2, 1) == 0)
    assert(s.paintingPlan(2, 4) == 1)
    assert(s.paintingPlan(3, 8) == 9)
    assert(s.paintingPlan1(2, 2) == 4)
    assert(s.paintingPlan1(2, 1) == 0)
    assert(s.paintingPlan1(2, 4) == 1)
    assert(s.paintingPlan1(3, 8) == 9)
}

do {
    let s = LCP28_采购方案()

    let result1 = s.purchasePlans([2,5,3,5], 6)
    assert(result1 == 1)
    print(result1)

    let result2 = s.purchasePlans([2,2,1,9], 10)
    assert(result2 == 4)
    print(result2)

    s.test()
}

do {
    let s = _LCP29_乐团站位()
    let result = s.orchestraLayout(3, 0, 2)
    print("\(s) --- \(result)")

    assert(s.orchestraLayout(3, 0, 2) == 3)
    assert(s.orchestraLayout(4, 1, 2) == 5)
}

do {
    let s = LCP33_蓄水()

    let result1 = s.storeWater([1,3], [6,8])
    assert(result1 == 4)
    print(result1)

    let result2 = s.storeWater([9,0,1], [0,2,2])
    assert(result2 == 3)
    print(result2)

    s.test()
}



//: [Next](@next)
