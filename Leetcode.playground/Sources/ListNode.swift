import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

public extension ListNode {
    func printListNode(_ valPrefix: String = "❗️") -> String {
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
