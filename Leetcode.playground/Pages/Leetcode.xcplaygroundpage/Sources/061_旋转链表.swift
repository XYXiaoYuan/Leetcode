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
        guard head != nil else { return head }
        
        let size = listNodeCount(head)
        let offset = k % size
        guard offset > 0  else { return head }
        
        var slow = head
        var fast = head
        
        var count = 0
        while count < offset{
            count += 1
            fast = fast?.next
        }
        
        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next
        }
        
        let new_head = slow?.next
        slow?.next = nil
        fast?.next = head
        
        return new_head
    }
    
    private func listNodeCount(_ node: ListNode?) -> Int {
        var count = 0, node = node
        while node != nil {
            count += 1
            node = node?.next
        }
        return count
    }
}

//do {
//    let s = _61_旋转链表()
//    let list = [1,2,3,4,5]
//    let head = ListNode.arrayToNode(list)
//    let result = s.rotateRight(head, 2)
//    if let result = result {
//        print("\(s) --- \(result.log())")
//    }
//}

///// 是否是Debug模式
//var isDebug: Bool = true
//
///// 全局打印,发布时不触发, isDebug == false时不打印
//public func dprint<T>(_ msg: T,
//                      line: Int = #line) {
//    if isDebug {
//        let prefix = "🏷_\(line)"
//        print(prefix, msg)
//    }
//}
