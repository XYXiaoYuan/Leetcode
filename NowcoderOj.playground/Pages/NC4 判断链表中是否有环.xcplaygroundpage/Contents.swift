/**
 https://www.nowcoder.com/practice/650474f313294468a4ded3ce0f7898b9?tpId=196&&tqId=37048&rp=1&ru=/activity/oj&qru=/ta/job-code-total/question-ranking
 
 描述
 判断给定的链表中是否有环。如果有环则返回true，否则返回false。
 你能给出空间复杂度的解法么？
 输入分为2部分，第一部分为链表，第二部分代表是否有环，然后回组成head头结点传入到函数里面。-1代表无环，其他的数字代表有环，这些参数解释仅仅是为了方便读者自测调试
 示例1
 输入：
 {3,2,0,-4},1
 复制
 返回值：
 true
 复制
 说明：
 第一部分{3,2,0,-4}代表一个链表，第二部分的1表示，-4到位置1，即-4->2存在一个链接，组成传入的head为一个带环的链表 ,返回true
 示例2
 输入：
 {1},-1
 复制
 返回值：
 false
 复制
 说明：
 第一部分{1}代表一个链表，-1代表无环，组成传入head为一个无环的单链表，返回false
 示例3
 输入：
 {-1,-7,7,-4,19,6,-9,-5,-2,-5},6
 复制
 返回值：
 true
 复制
 */

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil || head?.next == nil {
            return false
        }
        
        var slow = head
        var fast = head?.next
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            if slow?.val == fast?.val {
                return true
            }
        }
        return false
    }
}

let s = Solution()
let head1 = ListNode(3, ListNode(2, ListNode(0, ListNode(-4, nil))))
let result = s.hasCycle(head1)
print(result)

//assert(s.maxValue(input1) == 12)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}


