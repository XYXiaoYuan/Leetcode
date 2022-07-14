/**
 https://leetcode-cn.com/problems/sort-list/
 
 给你链表的头结点 head ，请将其按 升序 排列并返回 排序后的链表 。

 进阶：

 你可以在 O(n log n) 时间复杂度和常数级空间复杂度下，对链表进行排序吗？
  

 示例 1：


 输入：head = [4,2,1,3]
 输出：[1,2,3,4]
 示例 2：


 输入：head = [-1,5,3,4,0]
 输出：[-1,0,3,4,5]
 示例 3：

 输入：head = []
 输出：[]
  



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sort-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _148_排序链表 {
//class Solution {
    public init() {}
    
    public func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var pre: ListNode? = nil
        var slow: ListNode? = head
        var fast: ListNode? = head
        
        while fast != nil && fast?.next != nil {
            pre = slow
            slow = slow?.next
            fast = fast?.next?.next
        }
        pre?.next = nil
        let l1 = sortList(head)
        let l2 = sortList(slow)
        
        return merge(l1, l2)
    }
    
    private func merge(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var l1 = l1
        var l2 = l2
        var cur: ListNode? = dummy
        
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                cur?.next = l1
                l1 = l1?.next
            } else {
                cur?.next = l2
                l2 = l2?.next
            }
            cur = cur?.next
        }
        if l1 != nil {
            cur?.next = l1
        }
        if l2 != nil {
            cur?.next = l2
        }
        
        return dummy.next
    }
}
