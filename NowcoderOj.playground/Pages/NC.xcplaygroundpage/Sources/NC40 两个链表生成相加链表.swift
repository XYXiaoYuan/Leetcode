/**
 https://www.nowcoder.com/practice/c56f6c70fb3f4849bc56e33ff2a50b6b?tpId=196&&tqId=37147&rp=1&ru=/activity/oj&qru=/ta/job-code-total/question-ranking
 
 描述
 假设链表中每一个节点的值都在 0 - 9 之间，那么链表整体就可以代表一个整数。
 给定两个这种链表，请生成代表两个整数相加值的结果链表。
 例如：链表 1 为 9->3->7，链表 2 为 6->3，最后生成新的结果链表为 1->0->0->0。
 示例1
 输入：
 [9,3,7],[6,3]
 复制
 返回值：
 {1,0,0,0}
 复制
 备注：
 1 \leq n, m \leq 10^61≤n,m≤10
 6
  
 0 \leq a_i, b_i \leq 90≤a
 i
 ​
  ,b
 i
 ​
  ≤9

 */
public class NC40_两个链表生成相加链表 {
//class Solution {
    public init() {}

            
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param head1 ListNode类
     * @param head2 ListNode类
     * @return ListNode类
     */
    func addInList ( _ head1: ListNode?,  _ head2: ListNode?) -> ListNode? {
        var stack1 = [Int]()
        var stack2 = [Int]()
        var l1 = head1
        var l2 = head2
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

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
