//: [Previous](@previous)

import Foundation

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
    let s = _LCP29_乐团站位()
    let result = s.orchestraLayout(3, 0, 2)
    print("\(s) --- \(result)")

    assert(s.orchestraLayout(3, 0, 2) == 3)
    assert(s.orchestraLayout(4, 1, 2) == 5)
}

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


//: [Next](@next)
