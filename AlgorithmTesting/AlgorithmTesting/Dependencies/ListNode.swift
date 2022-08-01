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
        return lhs.toArray() == rhs.toArray()
    }
}

/// 链表的个数
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
    /// 数组转链表,通过一个数组生成成链表
    /// - Parameter list: 列表
    /// - Returns: 链表
    static func arrayToNode<T: Collection>(_ list: T) -> ListNode? where T.Element == Int {
        var head: ListNode?
        var p: ListNode?
        for element in list {
            if head == nil {
                head = ListNode(element)
                p = head
            } else {
                p?.next = ListNode(element)
                p = p?.next
            }
        }

        return head
    }
    
    /// 把链表转换成数组
    func toArray() -> [Int] {
        var array = [Int]()
        var node: ListNode? = self
        while node != nil {
            array.append(node?.val ?? 0)
            node = node?.next
        }
        return array
    }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        let valPrefix: String = "❗️"
        var res = ""
        for (i, num) in self.toArray().enumerated() {
            res.append("[\(i)_\(valPrefix)\(num)] → ")
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
