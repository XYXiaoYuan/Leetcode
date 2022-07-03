/**
 https://leetcode-cn.com/problems/swap-nodes-in-pairs/
 
 给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。

 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。

  

 示例 1：


 输入：head = [1,2,3,4]
 输出：[2,1,4,3]
 示例 2：

 输入：head = []
 输出：[]
 示例 3：

 输入：head = [1]
 输出：[1]
  

 提示：

 链表中节点的数目在范围 [0, 100] 内
 0 <= Node.val <= 100
  

 进阶：你能在不修改链表节点值的情况下解决这个问题吗?（也就是说，仅修改节点本身。）



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/swap-nodes-in-pairs
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _024_两两交换链表中的节点 {
//class Solution {
    public init() {}
    
    public func swapPairs(_ head: ListNode?) -> ListNode? {
        let dummyHead = ListNode(0)
        dummyHead.next = head
        var temp: ListNode? = dummyHead
        
        while temp?.next != nil, temp?.next?.next != nil {
            let start = temp?.next
            let end = temp?.next?.next
            
            temp?.next = end
            start?.next = end?.next
            end?.next = start
            
            temp = start
        }
        
        return dummyHead.next
    }
}

//let s = _024_两两交换链表中的节点()
//let input1 = ListNode.arrayToNode([1,2,3,4])
//var resListNode = s.swapPairs(input1)
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
