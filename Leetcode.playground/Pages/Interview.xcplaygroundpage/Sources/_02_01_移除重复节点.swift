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

public class _02_01_移除重复节点 {
    //class Solution {
    public init() {}
    public func runTestSuite() { _02_01_移除重复节点.Test.defaultTestSuite.run() }
    
    public func removeDuplicateNodes(_ head: ListNode?) -> ListNode? {
        if head == nil { return head }
        
        var occurred: Set<Int> = Set<Int>()
        occurred.insert(head?.val ?? 0)
        var pos = head
        /// 枚举前驱节点
        while pos?.next != nil {
            /// 当前待删除的节点
            let cur = pos?.next
            let vaule = cur?.val ?? 0
            if !occurred.contains(vaule) {
                occurred.insert(vaule)
                pos = pos?.next
            } else {
                pos?.next = pos?.next?.next
            }
        }
        pos?.next = nil
        return head
    }
}

public extension _02_01_移除重复节点 {
    class Test: XCTestCase {
        var s = _02_01_移除重复节点()
        
        func testExample1() {
            let node = ListNode.arrayToNode([1, 2, 3, 3, 2, 1])
            let result = s.removeDuplicateNodes(node)
            let answer = ListNode.arrayToNode([1, 2, 3])
            XCTAssertEqual(result, answer)
        }
                
        func testExample2() {
            let node = ListNode.arrayToNode([1, 1, 1, 1, 2])
            let result = s.removeDuplicateNodes(node)
            let answer = ListNode.arrayToNode([1, 2])
            XCTAssertEqual(result, answer)
        }
    }
}

//do {
//    let s = _02_01_移除重复节点()
//    let node = ListNode.arrayToNode([1, 2, 3, 3, 2, 1])
//    let result = s.removeDuplicateNodes(node)
//    let answer = ListNode.arrayToNode([1, 2, 3])
//    if let result = result {
//        print("\(s) --- \(result)")
//    }
//
//    assert(result == answer)
//    
//    _02_01_移除重复节点.Test.defaultTestSuite.run()
//}

//: [Next](@next)
