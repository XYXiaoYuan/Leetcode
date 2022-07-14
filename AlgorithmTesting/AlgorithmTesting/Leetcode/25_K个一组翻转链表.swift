/**
 https://leetcode.cn/problems/reverse-nodes-in-k-group/
 
 给你链表的头节点 head ，每 k 个节点一组进行翻转，请你返回修改后的链表。

 k 是一个正整数，它的值小于或等于链表的长度。如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。

 你不能只是单纯的改变节点内部的值，而是需要实际进行节点交换。

  

 示例 1：


 输入：head = [1,2,3,4,5], k = 2
 输出：[2,1,4,3,5]
 示例 2：



 输入：head = [1,2,3,4,5], k = 3
 输出：[3,2,1,4,5]
  

 提示：
 链表中的节点数目为 n
 1 <= k <= n <= 5000
 0 <= Node.val <= 1000
  

 进阶：你可以设计一个只用 O(1) 额外内存空间的算法解决此问题吗？



 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/reverse-nodes-in-k-group
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _25_K个一组翻转链表 {
    public init() {}
    //class Solution class Solution {
    
    public func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let preHead = ListNode(0, head)
        var tail: ListNode? = preHead
        var start: ListNode?
        var end: ListNode?
        var next = head

        while next != nil {
            // Prepare for the scanning
            start = next
            end = next

            // Scan for k nodes
            for _ in 1..<k where end != nil {
                end = end?.next
            }

            // If num of nodes < k, connect the tail with the start and return
            if end == nil {
                tail?.next = start
                return preHead.next
            }

            // Set next node for the next iteration
            next = end?.next

            // Reverse nodes between start and end
            reverse(start: start, end: end)

            // Connect the previous tail with end (the new head for this chunk)
            tail?.next = end

            // Move tail to the new tail, which is start
            tail = start
        }

        return preHead.next
    }

    private func reverse(start: ListNode?, end: ListNode?) {
        var prev: ListNode?
        var curr = start
        let stop = end?.next

        while curr !== stop {
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
    }
}

//do {
//    let s = _25_K个一组翻转链表()
//    let head = ListNode.arrayToNode([1,2,3,4,5])
//    let result = s.reverseKGroup(head, 2)
//    print("\(s) --- \(result ?? nil)")
//}

