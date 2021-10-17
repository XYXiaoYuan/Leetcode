/**
 https://www.nowcoder.com/practice/75e878df47f24fdc9dc3e400ec6058ca?tpId=196&&tqId=37111&rp=1&ru=/activity/oj&qru=/ta/job-code-total/question-ranking
 
 描述
 输入一个链表，反转链表后，输出新链表的表头。
 示例1
 输入：
 {1,2,3}
 复制
 返回值：
 {3,2,1}
 复制

 */

public class NC78_反转链表 {
//class Solution {
    public init() {}

        
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param head ListNode类
     * @return ListNode类
     */
    func ReverseList ( _ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        guard let next = head.next else { return head }
         
        let newHead = ReverseList(next)
        next.next = head
        head.next = nil
                 
        return newHead
    }
}
