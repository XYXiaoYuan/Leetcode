/**
 https://leetcode-cn.com/problems/merge-two-sorted-lists/
 
 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

  

 示例 1：


 输入：l1 = [1,2,4], l2 = [1,3,4]
 输出：[1,1,2,3,4,4]
 示例 2：

 输入：l1 = [], l2 = []
 输出：[]
 示例 3：

 输入：l1 = [], l2 = [0]
 输出：[0]
  

 提示：

 两个链表的节点数目范围是 [0, 50]
 -100 <= Node.val <= 100
 l1 和 l2 均按 非递减顺序 排列


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/merge-two-sorted-lists
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _021_合并两个有序链表 {
//class Solution {
    public init() {}
    
    public func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1, l2 = l2
        
        var head: ListNode? = nil
        var tail: ListNode? = nil
        
        while l1 != nil || l2 != nil {
            let smallest: ListNode
            switch (l1, l2) {
            case (let l1?, nil): smallest = l1
            case (nil, let l2?): smallest = l2
            case (let l1?, let l2?): smallest = l1.val <= l2.val ? l1 : l2
            default: fatalError()
            }
            
            if smallest === l1 { l1 = l1!.next }
            if smallest === l2 { l2 = l2!.next }
            
            head = head ?? smallest
            tail?.next = smallest
            tail = tail?.next
            tail = tail ?? head
        }
        
        return head
    }
    
    public func mergeTwoLists1(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil || list2 == nil {
            return list1 == nil ? list2 : list1
        }
        
        let head = (list1?.val ?? 0) <= (list2?.val ?? 0) ? list1 : list2
        var cur1 = head?.next
        var cur2 = head === list1 ? list2 : list1
        var pre = head
        while cur1 != nil, cur2 != nil {
            if (cur1?.val ?? 0) <= (cur2?.val ?? 0) {
                pre?.next = cur1
                cur1 = cur1?.next
            } else {
                pre?.next = cur2
                cur2 = cur2?.next
            }
            pre = pre?.next
        }
        pre?.next = cur1 != nil ? cur1 : cur2
        return head
    }
}

//let s = _021_合并两个有序链表()
//let l1 = ListNode.arrayToNode([1,2,4])
//let l2 = ListNode.arrayToNode([1,3,4])
//var resListNode = s.mergeTwoLists(l1, l2)
//
//var result = [Int]()
//while resListNode != nil {
//    guard let node = resListNode else { break }
//    result.append(node.val)
//    resListNode = node.next
//}
//
//print(result)

//assert(s.maxValue(input1) == 12)

/// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}

