/**
 https://leetcode.cn/problems/remove-duplicates-from-sorted-list/
 
 给定一个已排序的链表的头 head ， 删除所有重复的元素，使每个元素只出现一次 。返回 已排序的链表 。

  

 示例 1：


 输入：head = [1,1,2]
 输出：[1,2]
 示例 2：


 输入：head = [1,1,2,3,3]
 输出：[1,2,3]
  

 提示：

 链表中节点数目在范围 [0, 300] 内
 -100 <= Node.val <= 100
 题目数据保证链表已经按升序 排列


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/remove-duplicates-from-sorted-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _83_删除排序链表中的重复元素 {
    public init() {}
    //class Solution class Solution {
    
    public func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil { return head }
        var slow = head, fast = head
        while fast != nil {
            if (fast?.val ?? 0) != (slow?.val ?? 0) {
                // nums[slow] = nums[fast]
                slow?.next = fast
                // slow++
                slow = slow?.next
            }
            // fast++
            fast = fast?.next
        }
        // 断开与后面重复元素的连接
        slow?.next = nil
        return head
    }
}

//do {
//    let s = _83_删除排序链表中的重复元素()
//    let head = ListNode.arrayToNode([1,1,2,3,3])
//    let result = s.deleteDuplicates(head)
//    print("\(s) --- \(String(describing: result))")
//}

