/**
 https://leetcode.cn/problems/palindrome-linked-list/
 
 给你一个单链表的头节点 head ，请你判断该链表是否为回文链表。如果是，返回 true ；否则，返回 false 。

  

 示例 1：


 输入：head = [1,2,2,1]
 输出：true
 示例 2：


 输入：head = [1,2]
 输出：false
  

 提示：

 链表中节点数目在范围[1, 105] 内
 0 <= Node.val <= 9
  



 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/palindrome-linked-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _234_回文链表 {
    public init() {}
    //class Solution class Solution {
    
    public func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil || head?.next == nil { return true }
        if head?.next?.next == nil {
            return head?.val == head?.next?.val
        }
        
        // 找到中间节点
        let mid = middleNode(head)
        var rHead = reverseList(mid?.next)
        var lHead = head
        let rOldHead = rHead
        
        // 从lHead、rHead出发，判断是否为回文链表
        var result = true
        while rHead != nil {
            if lHead?.val != rHead?.val {
                result = false
                break
            }
            
            rHead = rHead?.next
            lHead = lHead?.next
        }

        // 恢复右半部分（对右半部分再次翻转）
        reverseList(rOldHead);
        return result;
    }
    
    /// 找到中间节点（右半部分链表头结点的前一个节点
    /// 比如 1>2>3>2>1中的3是中间节点
    /// 比如 1>2>2>1中左边第一个2是中间节点
    /// - Parameter head: 头结点
    /// - Returns: 中间结点
    private func middleNode(_ head: ListNode?) -> ListNode? {
        var fast: ListNode? = head
        var slow: ListNode? = head
        while fast?.next != nil, fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
    
    /// 翻转链表
    /// - Parameter head: 原链表的头结点
    /// - Returns: 翻转之后链表的头结点（返回4）
    private func reverseList(_ head: ListNode?) -> ListNode? {
        var head = head
        var newHead: ListNode? = nil
        while head != nil {
            let tmp = head?.next
            head?.next = newHead
            newHead = head
            head = tmp
        }
        return newHead
    }
}

//do {
//    let s = _234_回文链表()
//    let head = ListNode(1, ListNode(2, ListNode(2, ListNode(1))))
//    let result = s.isPalindrome(head)
//    print(result)
//}

