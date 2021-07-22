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
class Solution {
    /// 虚拟头结点 (dummy head)
    private lazy var head: ListNode = ListNode(0)
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.isEmpty { return nil }
        var lists = lists
        
        var step = 1
        while step < lists.count {
//            let nextStep = step << 1
//            for i in stride(from: 0, through: lists.count - step, by: nextStep) {
//                var k1 = lists[i]
//                var k2 = lists[i + step]
//                lists[i] = mergeTwoLists(&k1, &k2)
//            }
//            step = nextStep
        }
        
        return lists.first ?? nil
    }
    
    private func mergeTwoLists(_ k1: inout ListNode?, _ k2: inout ListNode?) -> ListNode? {
        if k1 == nil { return k2 }
        if k2 == nil { return k1 }
        
        head.next = nil
        var cur: ListNode? = head
        
        while k1 != nil, k2 != nil {
            if k1?.val ?? 0 <= k2?.val ?? 0 {
                cur?.next = k1
                cur = cur?.next
                k1 = k1?.next
            } else {
                cur?.next = k2
                cur = cur?.next
                k2 = k2?.next
            }
        }
        
        if k1 == nil {
            cur?.next = k2
        } else if k2 == nil {
            cur?.next = k1
        }
        
        return head.next
    }
}

let s = Solution()
let lists1: [ListNode?] = [
    ListNode(1, ListNode(4, ListNode(5, nil))),
    ListNode(1, ListNode(3, ListNode(4, nil))),
    ListNode(2, ListNode(6, nil)),
]
let result = s.mergeKLists(lists1)
print(result)

//assert(s.maxValue(input1) == 12)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}



