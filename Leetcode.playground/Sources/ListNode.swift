import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/// 数组转链表
public extension ListNode {
    /// 需要先生成最里面的
//    static func arrayToListnode(_ array: [Int]) -> ListNode? {
//        guard let first = array.first else { return nil }
//        var node = ListNode(first, nil)
//
//        while array.isEmpty {
//            let top = array.removeFirst()
//            node.next = ListNode(top, <#T##next: ListNode?##ListNode?#>)
//        }
//
//        return node
//    }
}

/// 打印
public extension ListNode {
    func print(_ valPrefix: String = "❗️") -> String {
        var values = "[0_\(valPrefix)\(val)] -> "
        var index = 1
        while self.next != nil {
            values.append("[\(index)_\(valPrefix)\(self.next?.val ?? 0)] -> ")
            
            self.next = self.next?.next
            index += 1
        }
        return values + "nil"
    }
}
