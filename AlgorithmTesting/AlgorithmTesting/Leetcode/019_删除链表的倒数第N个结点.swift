/**
 https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/
 
 给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。

 进阶：你能尝试使用一趟扫描实现吗？

  

 示例 1：


 输入：head = [1,2,3,4,5], n = 2
 输出：[1,2,3,5]
 示例 2：

 输入：head = [1], n = 1
 输出：[]
 示例 3：

 输入：head = [1,2], n = 1
 输出：[1]


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _19_删除链表的倒数第N个结点 {
//class Solution {
    public init() {}
    public func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let head = head
        var slowPointer: ListNode? = head
        var fastPointer: ListNode? = head
        
        var count = 0
        while count < n {
            fastPointer = fastPointer?.next
            count += 1
        }
        
        var previousPointer: ListNode? = nil
        while fastPointer != nil {
            fastPointer = fastPointer?.next
            previousPointer = slowPointer
            slowPointer = slowPointer?.next
        }
        
        if slowPointer === head { return slowPointer?.next }
        
        previousPointer?.next = slowPointer?.next
        slowPointer?.next = nil
        return head
        
    }
    
    public func removeNthFromEnd1(_ head: ListNode?, _ n: Int) -> ListNode? {
        if head?.next == nil { return nil }
        var head = head, n = n
        
        var slow: ListNode? = head
        var fast: ListNode? = head
        
        while n > 0 {
            fast = fast?.next
            n -= 1
        }
        
        if fast == nil {
            head = slow?.next
        } else {
            while fast?.next != nil {
                slow = slow?.next
                fast = fast?.next
            }
            slow?.next = slow?.next?.next
        }
        return head
    }
}

