//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
func bloomFilterTest() {
    
    var bf = BFStruct<String>(dataSize: 1_000_000, fp: 0.05)
    
    for i in 0..<1_000_000 {
        bf.insert("www.baidu.com/u/\(100 + i)")
    }
    
    for i in 0..<100 {
       assert(bf.query("www.baidu.com/u/\(1000 + i * 10)"))
    }

    var falsePositive = 0
    
    for i in 0..<10000 where bf.query("www.baidu.com/u/\(10_000_000 + i)") {
        falsePositive += 1
    }
    
    for i in 0..<10000 where bf.query("www.sougou.com/s/\(10_000 + i)") {
        falsePositive += 1
    }
    // 误判率
    print("falsePositive = \(Float(falsePositive) / 20000)")
}

bloomFilterTest()
