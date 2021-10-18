/**
 https://leetcode-cn.com/problems/merge-k-sorted-lists/
 
 给你一个链表数组，每个链表都已经按升序排列。

 请你将所有链表合并到一个升序链表中，返回合并后的链表。

  

 示例 1：

 输入：lists = [[1,4,5],[1,3,4],[2,6]]
 输出：[1,1,2,3,4,4,5,6]
 解释：链表数组如下：
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 将它们合并到一个有序链表中得到。
 1->1->2->3->4->4->5->6
 示例 2：

 输入：lists = []
 输出：[]
 示例 3：

 输入：lists = [[]]
 输出：[]
  

 提示：

 k == lists.length
 0 <= k <= 10^4
 0 <= lists[i].length <= 500
 -10^4 <= lists[i][j] <= 10^4
 lists[i] 按 升序 排列
 lists[i].length 的总和不超过 10^4


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/merge-k-sorted-lists
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _023_合并K个升序链表 {
//class Solution {
    public init() {}
    
    /// 虚拟头结点 (dummy head)
    private lazy var head: ListNode = ListNode(0)
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.isEmpty { return nil }
        guard let _ = lists.first else { return lists[0] }
        
        return partition(lists, 0, lists.count - 1)
    }
    
    func partition(_ list: [ListNode?], _ start: Int, _ end: Int) -> ListNode? {
        if start == end {
            return list[start]
        }
        if start < end {
            let middle = (start + end) / 2
            let l1 = partition(list, start, middle)
            let l2 = partition(list, middle + 1, end)
            return mergeTwoList(l1, l2)
        }
        return nil
    }
    
    private func mergeTwoList(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else { return l2 }
        guard let l2 = l2 else { return l1 }
        
        var result: ListNode?
        if l1.val <= l2.val {
            result = l1
            result?.next = mergeTwoList(l1.next, l2)
        } else {
            result = l2
            result?.next = mergeTwoList(l1, l2.next)
        }
        
        return result
    }
}

//let s = _023_合并K个升序链表()
//let lists1: [ListNode?] = [
//    ListNode(1, ListNode(4, ListNode(5, nil))),
//    ListNode(1, ListNode(3, ListNode(4, nil))),
//    ListNode(2, ListNode(6, nil)),
//]
//var resListNode = s.mergeKLists(lists1)
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



