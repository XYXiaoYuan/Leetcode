import Darwin
/**
 https://leetcode.cn/problems/rotate-list/
 
 给你一个链表的头节点 head ，旋转链表，将链表每个节点向右移动 k 个位置。

  

 示例 1：


 输入：head = [1,2,3,4,5], k = 2
 输出：[4,5,1,2,3]
 示例 2：


 输入：head = [0,1,2], k = 4
 输出：[2,0,1]
  

 提示：

 链表中节点的数目在范围 [0, 500] 内
 -100 <= Node.val <= 100
 0 <= k <= 2 * 109

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/rotate-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _61_旋转链表 {
    public init() {}
    //class Solution class Solution {
    
    public func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if k == 0 || head == nil || head?.next == nil {
            return head
        }

        var n = 1
        var cur: ListNode? = head
        while cur?.next != nil {
            cur = cur?.next
            n += 1
        }
        
        let add = n - k % n

//        print("遍历完 iter = \(cur?.dLog(cur)) k \(k) add \(add)")
        if k == add {
            return head
        }
        cur?.next = head
//        print("cur?.next后 iter = \(cur?.dLog(cur))")
        while n > 0 {
            cur = cur?.next
            n -= 1
        }
//        print("while n > 0后 cur = \(iter?.dLog(cur))")

        let ret = cur?.next
//        print("ret = \(ret?.dLog(ret))")
        cur?.next = nil
        return ret
    }
}

do {
    let s = _61_旋转链表()
    let list = [1,2,3,4,5]
    let head = ListNode.arrayToNode(list)
    let result = s.rotateRight(head, 2)
    if let result = result {
        print("\(s) --- \(result.log())")
    }
}

/// 是否是Debug模式
var isDebug: Bool = true

/// 全局打印,发布时不触发, isDebug == false时不打印
public func dprint<T>(_ msg: T,
                      line: Int = #line) {
    if isDebug {
        let prefix = "🏷_\(line)"
        print(prefix, msg)
    }
}
