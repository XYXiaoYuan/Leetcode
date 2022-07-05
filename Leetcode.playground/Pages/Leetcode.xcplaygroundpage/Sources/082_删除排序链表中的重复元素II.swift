import Darwin
/**
 https://leetcode.cn/problems/remove-duplicates-from-sorted-list-ii/
 
 给定一个已排序的链表的头 head ， 删除原始链表中所有重复数字的节点，只留下不同的数字 。返回 已排序的链表 。
 
  
 
 示例 1：
 
 
 输入：head = [1,2,3,3,4,4,5]
 输出：[1,2,5]
 示例 2：
 
 
 输入：head = [1,1,1,2,3]
 输出：[2,3]
  
 
 提示：
 
 链表中节点数目在范围 [0, 300] 内
 -100 <= Node.val <= 100
 题目数据保证链表已经按升序 排列
 通过次数269,487提交次数504,735
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/remove-duplicates-from-sorted-list-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _82_删除排序链表中的重复元素II {
    public init() {}
    //class Solution class Solution {
        
    public func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var fast: ListNode? = head
        var slow: ListNode? = dummy
        slow?.next = fast
        
        while fast != nil {
            while fast?.next != nil && fast?.val == fast?.next?.val {
                fast = fast?.next
            }
            if slow?.next !== fast {
                slow?.next = fast?.next
                fast = slow?.next
            } else {
                slow = slow?.next
                fast = fast?.next
            }
        }
        
        return dummy.next
    }
    
    public func deleteDuplicates_Recursive(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        
        var head = head
        
        if head?.next != nil && head?.val == head?.next?.val {
            while head?.next != nil && head?.val == head?.next?.val {
                head = head?.next
            }
            return deleteDuplicates(head?.next)
        } else {
            head?.next = deleteDuplicates(head?.next)
        }
        
        return head
    }
    
    public func deleteDuplicates_Map(_ head: ListNode?) -> ListNode? {
        var map = [Int: Int]()
        let root: ListNode? = ListNode(Int.min, head)
        var slow = root
        var fast = head
        
        // first pass
        var start = head
        
        while start != nil {
            if let key = start?.val {
                if let count = map[key] {
                    map[key] = count + 1
                } else {
                    map[key] = 1
                }
            }
            start = start?.next
        }
        
        while fast != nil {
            if let key = fast?.val, let count = map[key], count > 1 {
                slow?.next = fast?.next
                fast = fast?.next
            } else {
                slow = slow?.next
                fast = fast?.next
            }
        }
        return root?.next
    }
    
}

//do {
//    let s = _82_删除排序链表中的重复元素II()
//    let list = [1,1,2,3,3,4,4,5]
//    let head = ListNode.arrayToNode(list)
//    let result = s.deleteDuplicates(head)
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
