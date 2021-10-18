/**
 https://leetcode-cn.com/problems/add-two-numbers-ii/
 
 给你两个 非空 链表来代表两个非负整数。数字最高位位于链表开始位置。它们的每个节点只存储一位数字。将这两数相加会返回一个新的链表。

 你可以假设除了数字 0 之外，这两个数字都不会以零开头。

  

 示例1：



 输入：l1 = [7,2,4,3], l2 = [5,6,4]
 输出：[7,8,0,7]
 示例2：

 输入：l1 = [2,4,3], l2 = [5,6,4]
 输出：[8,0,7]
 示例3：

 输入：l1 = [0], l2 = [0]
 输出：[0]
  

 提示：

 链表的长度范围为 [1, 100]
 0 <= node.val <= 9
 输入数据保证链表代表的数字无前导 0
  

 进阶：如果输入链表不能修改该如何处理？换句话说，不能对列表中的节点进行翻转。



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/add-two-numbers-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _445_两数相加II {
//class Solution {
    public init() {}
    
    public func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var stack1 = [Int]()
        var stack2 = [Int]()
        var l1 = l1
        var l2 = l2
        var sum = 0
        var cur = ListNode(0)
        
        while l1 != nil {
            stack1.append(l1!.val)
            l1 = l1?.next
        }
        while l2 != nil {
            stack2.append(l2!.val)
            l2 = l2?.next
        }
        while !stack1.isEmpty || !stack2.isEmpty {
            if !stack1.isEmpty {
                sum += stack1.removeLast()
            }
            if !stack2.isEmpty {
                sum += stack2.removeLast()
            }
            cur.val = sum % 10
            let head = ListNode(sum / 10)
            head.next = cur
            cur = head
            sum /= 10
        }
        
        return cur.val == 0 ? cur.next : cur
    }
}
