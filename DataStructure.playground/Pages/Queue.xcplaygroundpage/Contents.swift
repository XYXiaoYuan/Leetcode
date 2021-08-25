//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
func queueTest() {
    
    var data = [Int]()
    
    for _ in 1...1_000_000 {
        data.append(Int.random(in: 0..<1000000000))
    }
    
    var array = [Int]()
    var queue = PriorityQueue<Int>()
   
    printTime(prefix: "add Array Time = ") {
        data.forEach {
            array.append($0)
        }
        array.sort()
    }
    
    
    printTime(prefix: "add PriorityQueue Time = ") {
        data.forEach {
            queue.push($0)
        }
    }
    
    assert(queue.count == array.count)
    assert(queue.first == array.first)
    
    printTime(prefix: "remove Array Time = ") {
        while !array.isEmpty {
            array.remove(at: 0)
        }
    }
    printTime(prefix: "remove PriorityQueue Time = ") {
        while queue.pop() != nil {}
    }
    
}


func printTime(prefix: String = "", block: () -> Void) {
    let t = CFAbsoluteTimeGetCurrent()
    block()
    print(prefix + "\(CFAbsoluteTimeGetCurrent() - t)")
}


queueTest()
