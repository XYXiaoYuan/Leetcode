import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

public extension ListNode {
    /// 数组转链表,通过一个数组转换成链表
    /// - Parameter list: 列表
    /// - Returns: 链表
    static func arrayToNode(_ list: [Int]) -> ListNode? {
        /// 需要先生成最里面的,再生成外面的,所以list传过来,需要逆序一下处理
        let items = list.reversed().map { $0 }
        guard let first = items.first, let last = items.last else { return nil }
        
        /// 初始化最后一个节点
        var lastNode: ListNode? = ListNode(first, nil)
        
        /// 去掉第0和最后一个，遍历区间是[1,items.count - 1)
        for i in 1..<(items.count - 1) {
            lastNode = ListNode(items[i], lastNode)
        }
        
        /// 拼接第一个节点, next为lastNode
        return ListNode(last, lastNode)
    }
}

/// 打印
public extension ListNode {
    func log() -> String {
        let valPrefix: String = "❗️"
        var values = "[0_\(valPrefix)\(val)] -> "
        var index = 1
        while self.next != nil {
            values.append("[\(index)_\(valPrefix)\(self.next?.val ?? 0)] -> ")
            
            self.next = self.next?.next
            index += 1
        }
        return values + "nil"
    }
    
    func dLog(_ listNode: ListNode?) -> String {
        let node = listNode
        let valPrefix: String = "❗️"
        var values = "[0_\(valPrefix)\(val)] -> "
        var index = 1
        while node?.next != nil {
            values.append("[\(index)_\(valPrefix)\(node?.next?.val ?? 0)] -> ")
            
            node?.next = node?.next?.next
            index += 1
        }
        return values + "nil"
    }
}
