/**
 https://leetcode-cn.com/problems/odd-even-linked-list/
 
 给定一个单链表，把所有的奇数节点和偶数节点分别排在一起。请注意，这里的奇数节点和偶数节点指的是节点编号的奇偶性，而不是节点的值的奇偶性。

 请尝试使用原地算法完成。你的算法的空间复杂度应为 O(1)，时间复杂度应为 O(nodes)，nodes 为节点总数。

 示例 1:

 输入: 1->2->3->4->5->NULL
 输出: 1->3->5->2->4->NULL
 示例 2:

 输入: 2->1->3->5->6->4->7->NULL
 输出: 2->3->6->7->1->5->4->NULL
 说明:

 应当保持奇数节点和偶数节点的相对顺序。
 链表的第一个节点视为奇数节点，第二个节点视为偶数节点，以此类推。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/odd-even-linked-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _328_奇偶链表 {
//class Solution {
    public init() {}
    
    public func oddEvenList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return head
        }
        
        let evenHead = head?.next
        var odd = head
        var even = evenHead
        
        while even != nil, even?.next != nil {
            odd?.next = even?.next
            odd = odd?.next
            even?.next = odd?.next
            even = even?.next
        }
        odd?.next = evenHead
        
        return head
    }
}

//let s = _328_奇偶链表()
//let head = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, nil)))))
//var resListNode = s.oddEvenList(head)
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

