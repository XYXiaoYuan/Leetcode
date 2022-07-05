/**
 https://leetcode.cn/problems/middle-of-the-linked-list/
 
 给定一个头结点为 head 的非空单链表，返回链表的中间结点。

 如果有两个中间结点，则返回第二个中间结点。

  

 示例 1：

 输入：[1,2,3,4,5]
 输出：此列表中的结点 3 (序列化形式：[3,4,5])
 返回的结点值为 3 。 (测评系统对该结点序列化表述是 [3,4,5])。
 注意，我们返回了一个 ListNode 类型的对象 ans，这样：
 ans.val = 3, ans.next.val = 4, ans.next.next.val = 5, 以及 ans.next.next.next = NULL.
 示例 2：

 输入：[1,2,3,4,5,6]
 输出：此列表中的结点 4 (序列化形式：[4,5,6])
 由于该列表有两个中间结点，值分别为 3 和 4，我们返回第二个结点。
  

 提示：

 给定链表的结点数介于 1 和 100 之间。


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/middle-of-the-linked-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
import XCTest
//_876_链表的中间结点.Test.defaultTestSuite.run()

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

//do {
//    let s = _876_链表的中间结点()
//    let node = ListNode.arrayToNode([1,2,3,4,5])
//    let result = s.middleNode(node)
//    let answer = ListNode.arrayToNode([3,4,5])
//    if let result = result {
//        print("\(s) --- \(result)")
//    }
//
//    assert(result == answer)
//}

//: [Next](@next)
