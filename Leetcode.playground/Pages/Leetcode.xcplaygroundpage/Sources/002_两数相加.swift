/**
 https://leetcode-cn.com/problems/add-two-numbers/
 
 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。

 请你将两个数相加，并以相同形式返回一个表示和的链表。

 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。

  

 示例 1：


 输入：l1 = [2,4,3], l2 = [5,6,4]
 输出：[7,0,8]
 解释：342 + 465 = 807.
 示例 2：

 输入：l1 = [0], l2 = [0]
 输出：[0]
 示例 3：

 输入：l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 输出：[8,9,9,9,0,0,0,1]


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/add-two-numbers
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class _002_两数相加 {
//class Solution {
    public init() {}

    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
        var l1 = l1
        var l2 = l2
        
        let dummyHead: ListNode = ListNode(0)
        var last: ListNode? = dummyHead
        
        /// 进位值
        var carry = 0
        while l1 != nil || l2 != nil {
            var v1 = 0
            if let ll1 = l1 {
                v1 = ll1.val
                l1 = ll1.next
            }
            
            var v2 = 0
            if let ll2 = l2 {
                v2 = ll2.val
                l2 = ll2.next
            }
            
            let sum = v1 + v2 + carry
            
            // 设置进位值
            carry = sum / 10
            // sum的个位数作为数节点的值
            last?.next = ListNode(sum % 10)
            last = last?.next
        }
        
        // 检查最后的进位
        if carry > 0 {
            // carry == 1
            last?.next = ListNode(carry)
        }
        
        return dummyHead.next
    }
}
