/**
 https://leetcode-cn.com/problems/reverse-linked-list/submissions/
 
 给你单链表的头节点 head ，请你反转链表，并返回反转后的链表。
  

 示例 1：


 输入：head = [1,2,3,4,5]
 输出：[5,4,3,2,1]
 示例 2：


 输入：head = [1,2]
 输出：[2,1]
 示例 3：

 输入：head = []
 输出：[]
  

 提示：

 链表中节点的数目范围是 [0, 5000]
 -5000 <= Node.val <= 5000
  

 进阶：链表可以选用迭代或递归方式完成反转。你能否用两种方法解决这道题？



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-linked-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _206_反转链表 {
//class Solution {
    public init() {}
    
    /// 递归法
    public func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        let newHead = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return newHead
    }
    
    /// 迭代法
    public func reverseList1(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var curr: ListNode? = head
        
        while curr != nil {
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        
        return prev
    }
}
