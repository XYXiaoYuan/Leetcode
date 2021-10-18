/**
 https://leetcode-cn.com/problems/reorder-list/
 
 给定一个单链表 L：L0→L1→…→Ln-1→Ln ，
 将其重新排列后变为： L0→Ln→L1→Ln-1→L2→Ln-2→…

 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。

 示例 1:

 给定链表 1->2->3->4, 重新排列为 1->4->2->3.
 示例 2:

 给定链表 1->2->3->4->5, 重新排列为 1->5->2->4->3.


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reorder-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _143_重排链表 {
//class Solution {
    public init() {}
    
    public func reorderList(_ head: ListNode?) {
        if head == nil || head?.next == nil {
            return
        }
        
        var p1: ListNode? = head
        var p2: ListNode? = head
        while p2?.next != nil && p2?.next?.next != nil {
            p1 = p1?.next
            p2 = p2?.next?.next
        }
        
        let preMiddle: ListNode? = p1
        let preCur: ListNode? = p1?.next
        while preCur?.next != nil {
            let cur = preCur?.next
            preCur?.next = cur?.next
            cur?.next = preMiddle?.next
            preMiddle?.next = cur
        }
        
        p1 = head
        p2 = preMiddle?.next
        while p1 !== preMiddle {
            preMiddle?.next = p2?.next
            p2?.next = p1?.next
            p1?.next = p2
            p1 = p2?.next
            p2 = preMiddle?.next
        }
    }
    
}
