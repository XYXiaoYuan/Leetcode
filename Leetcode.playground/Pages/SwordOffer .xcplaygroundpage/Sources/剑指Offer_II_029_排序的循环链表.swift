/**
 https://leetcode.cn/problems/remove-duplicate-node-lcci/
 
 编写代码，移除未排序链表中的重复节点。保留最开始出现的节点。

 示例1:

  输入：[1, 2, 3, 3, 2, 1]
  输出：[1, 2, 3]
 示例2:

  输入：[1, 1, 1, 1, 2]
  输出：[1, 2]
 提示：

 链表长度在[0, 20000]范围内。
 链表元素在[0, 20000]范围内。
 进阶：

 如果不得使用临时缓冲区，该怎么解决？



 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/remove-duplicate-node-lcci
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
import XCTest

public class _剑指Offer_II_029_排序的循环链表 {
    //class Solution {
    public init() {}
    
    public func insert(_ head: ListNode?, _ insertVal: Int) -> ListNode? {
        let t = ListNode(insertVal)
        t.next = t
        if head == nil {
            return t
        }
        
        var ans = head, head = head
        var minVal = head?.val ?? 0, maxVal = head?.val ?? 0
        while head?.next !== ans {
            head = head?.next
            minVal = min(minVal, head?.val ?? 0)
            maxVal = max(maxVal, head?.val ?? 0)
        }
        
        if minVal == maxVal {
            t.next = ans?.next
            ans?.next = t
        } else {
            while !((head?.val ?? 0) == maxVal) && (head?.next?.val ?? 0) == minVal {
                head = head?.next
            }
            
            while !(insertVal <= minVal || insertVal >= maxVal) && !((head?.val ?? 0) <= insertVal && insertVal <= (head?.next?.val ?? 0)) {
                head = head?.next
            }
            
            t.next = head?.next
            head?.next = t
        }
        return ans
    }
}

public extension _剑指Offer_II_029_排序的循环链表 {
    class Test: XCTestCase {
        var s = _剑指Offer_II_029_排序的循环链表()
        
        func testExample1() {
            let node = ListNode.arrayToNode([3, 4, 1])
            let result = s.insert(node,2)
            let answer = ListNode.arrayToNode([3, 4, 1, 2])
            XCTAssertEqual(result, answer)
        }
                
        func testExample2() {
            let node = ListNode.arrayToNode([])
            let result = s.insert(node,1)
            let answer = ListNode.arrayToNode([1])
            XCTAssertEqual(result, answer)
        }
        
        func testExample3() {
            let node = ListNode.arrayToNode([1])
            let result = s.insert(node,0)
            let answer = ListNode.arrayToNode([1,0])
            XCTAssertEqual(result, answer)
        }
    }
}

//do {
//    let s = _剑指Offer_II_029_排序的循环链表()
//    let node = ListNode.arrayToNode([3, 4, 1])
//    let result = s.insert(node,2)
//    let answer = ListNode.arrayToNode([3, 4, 1, 2])
//    if let result = result {
//        print("\(s) --- \(result)")
//    }
//
//    assert(result == answer)
//    
//    _剑指Offer_II_029_排序的循环链表.Test.defaultTestSuite.run()
//}

//: [Next](@next)
