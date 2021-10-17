//: [Previous](@previous)

import Foundation

do {
    let s = NC4_判断链表中是否有环()
    let result = s.hasCycle(ListNode(3, ListNode(2, ListNode(0, ListNode(-4, nil)))))
    print(result)
    
    assert(s.hasCycle(ListNode(3, ListNode(2, ListNode(0, ListNode(-4, nil))))) == false)
}


/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

//: [Next](@next)
