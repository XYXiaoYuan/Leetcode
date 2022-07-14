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
//// import XCTest

public class _382_链表随机节点 {
    //class Solution {
    public init() {}

    var head: ListNode?

    public init(_ head: ListNode?) {
        self.head = head
    }
    
    /// 返回链表中一个随机节点的值
    public func getRandom() -> Int {
        var i = 0, res = 0
        var p = head
        /// while 循环遍历链表
        while p != nil {
            i += 1
            // 生成一个 [0, i) 之间的整数
            // 这个整数等于 0 的概率就是 1 / i
            let range: Range<Int> = 0..<i
            if 0 == Int.random(in: range) {
                res = p?.val ?? 0
            }
            p = p?.next
        }
        return res
    }
}

//: [Next](@next)
