/**
 https://leetcode-cn.com/problems/partition-list/submissions/
 
 给你一个链表的头节点 head 和一个特定值 x ，请你对链表进行分隔，使得所有 小于 x 的节点都出现在 大于或等于 x 的节点之前。

 你应当 保留 两个分区中每个节点的初始相对位置。

  

 示例 1：


 输入：head = [1,4,3,2,5,2], x = 3
 输出：[1,2,2,4,3,5]
 示例 2：

 输入：head = [2,1], x = 2
 输出：[1,2]


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/partition-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        if head == nil { return nil }
        var head = head
        
        let lHead = ListNode(0)
        var lTail: ListNode? = lHead
        let rHead = ListNode(0)
        var rTail: ListNode? = rHead
        while head != nil {
            if (head?.val ?? 0 < x) { // 放在lTail后面
                lTail?.next = head
                lTail = head
            } else { // 放在rTail后面
                rTail?.next = head
                rTail = head
            }
            head = head?.next
        }
        // 这句代码不能少
        /*
         * 因为可能出现这样的情况:
         * 原链表倒数第N个节点A的值是>=x的，A后面所有节点的值都是<x的
         * 然后rTail.next最终其实就是A.next
         */
        rTail?.next = nil
        // 将rHead.next拼接在lTail后面
        lTail?.next = rHead.next
        
        return lHead.next;
    }
}

let s = Solution()
let head1 = ListNode(1, ListNode(4, ListNode(3, ListNode(2, ListNode(5, ListNode(2, nil))))))
let head2 = ListNode(2, ListNode(1, nil))
var resListNode = s.partition(head2, 3)

var result = [Int]()
while resListNode != nil {
    guard let node = resListNode else { break }
    result.append(node.val)
    resListNode = node.next
}

print(result)

//assert(s.maxValue(input1) == 12)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

