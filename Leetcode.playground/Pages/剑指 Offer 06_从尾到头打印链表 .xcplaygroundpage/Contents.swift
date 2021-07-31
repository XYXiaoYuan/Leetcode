/**
 https://leetcode-cn.com/problems/cong-wei-dao-tou-da-yin-lian-biao-lcof/

 输入一个链表的头节点，从尾到头反过来返回每个节点的值（用数组返回）。

  

 示例 1：

 输入：head = [1,3,2]
 输出：[2,3,1]
  

 限制：

 0 <= 链表长度 <= 10000



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/cong-wei-dao-tou-da-yin-lian-biao-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution {
    func reversePrint(_ head: ListNode?) -> [Int] {
        if head == nil {
            return []
        }
        var head = head

        var result: [Int] = [Int]()
        while head != nil {
            if let node = head {
                result.append(node.val)
            }
            head = head?.next
        }

        return result.reversed()
    }
}
