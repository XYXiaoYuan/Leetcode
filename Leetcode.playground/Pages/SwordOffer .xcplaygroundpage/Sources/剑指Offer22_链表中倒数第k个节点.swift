/**
 https://leetcode-cn.com/problems/lian-biao-zhong-dao-shu-di-kge-jie-dian-lcof/
 
 输入一个链表，输出该链表中倒数第k个节点。为了符合大多数人的习惯，本题从1开始计数，即链表的尾节点是倒数第1个节点。

 例如，一个链表有 6 个节点，从头节点开始，它们的值依次是 1、2、3、4、5、6。这个链表的倒数第 3 个节点是值为 4 的节点。

  

 示例：

 给定一个链表: 1->2->3->4->5, 和 k = 2.

 返回链表 4->5.


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/lian-biao-zhong-dao-shu-di-kge-jie-dian-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _剑指Offer22_链表中倒数第k个节点 {
//class Solution {
    public init() {}
    
    public func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil || k == 0 {
            return nil
        }

        var headA = head  //声明指针A
        var headB = head  //声明另外一个目标指针B
        
        for _ in 0..<k-1 { //0到k-1开区间
            if headA?.next != nil {
                headA = headA?.next
            } else { //当为nil的时候说明存在输入的k大于整个链表的长度
                return nil
            }
        }

        while headA?.next != nil { //当前headA指针走到尾结点的时候恰巧headB就是目标点
            headA = headA?.next
            headB = headB?.next
        }

        return headB
    }
}
