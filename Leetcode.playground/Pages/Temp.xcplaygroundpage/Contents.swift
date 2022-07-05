import Foundation
import Darwin
import XCTest
_876_链表的中间结点.Test.defaultTestSuite.run()

public class _876_链表的中间结点 {
    //class Solution {
    public init() {}
    public func runTestSuite() { _876_链表的中间结点.Test.defaultTestSuite.run() }
    
    /// 快慢指针,快指针走两步,慢指针走一步
    public func middleNode(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        while fast != nil, fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
}

extension _876_链表的中间结点 {
    class Test: XCTestCase {
        var s = _876_链表的中间结点()
        
        func testExample1() {
            let node = ListNode.arrayToNode([1,2,3,4,5])
            let result = s.middleNode(node)
            let answer = ListNode.arrayToNode([3,4,5])
            XCTAssertEqual(result, answer)
        }
                
        func testExample2() {
            let node = ListNode.arrayToNode([1,2,3,4,5,6])
            let result = s.middleNode(node)
            let answer = ListNode.arrayToNode([4,5,6])
            XCTAssertEqual(result, answer)
        }
    }
}

do {
    let s = _876_链表的中间结点()
    let node = ListNode.arrayToNode([1,2,3,4,5])
    let result = s.middleNode(node)
    let answer = ListNode.arrayToNode([3,4,5])
    if let result = result {
        print("\(s) --- \(result)")
    }

    assert(result == answer)
}

//: [Next](@next)
