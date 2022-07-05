import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/// 遵守`Equatable`协议，方便写测试用例时判等
extension ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val
//        return lhs.toArray() == rhs.toArray()
    }
}

public extension ListNode {
    var count: Int {
        var count = 0
        var node: ListNode? = self
        while node != nil {
            count += 1
            node = node!.next
        }
        return count
    }
}

public extension ListNode {
    /// 数组转链表,通过一个数组转换成链表
    /// - Parameter list: 列表
    /// - Returns: 链表
    static func arrayToNode(_ list: [Int]) -> ListNode? {
        if list.isEmpty { return nil }
        if list.count == 1 { return ListNode(list.first ?? 0, nil) }

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
    
//    static func makeLinkedList<T: Collection>(from collection: T) -> ListNode?
//        where T.Element == Int {
//        var head: ListNode?
//        var p: ListNode?
//        for element in collection {
//            if head == nil {
//                head = ListNode(element)
//                p = head
//            } else {
//                p!.next = ListNode(element)
//                p = p!.next
//            }
//        }
//
//        return head
//    }
    
    /// 把链表转换成数组
    func toArray() -> [Int] {
        var array = [Int]()
        var node: ListNode? = self
        while node != nil {
            array.append(node!.val)
            node = node!.next
        }
        return array
    }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        let valPrefix: String = "❗️"
        var res = ""
        for (i, num) in self.toArray().enumerated() {
            res.append("[\(i)_\(valPrefix)\(num)] -> ")
        }
        return "LinkedList: " + res + "nil"
//        return "LinkedList: " + String(describing: self.toArray())
    }
}

extension ListNode: CustomPlaygroundDisplayConvertible {
    public var playgroundDescription: Any {
        return self.description
    }
}
