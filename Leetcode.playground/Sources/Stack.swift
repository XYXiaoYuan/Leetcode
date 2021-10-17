import Foundation

/// 栈
public struct Stack<T> {
    public init() {}

    /// Datastructure consisting of a generic item.
    fileprivate var array = [T]()
    
    /// The number of items in the stack.
    public var count: Int {
        return array.count
    }
    
    /// Verifies if the stack is empty.
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    /// Remove all elements
    public mutating func removeAll() {
        array.removeAll()
    }
    
    /**
     Pushes an item to the top of the stack.
     
     - Parameter element: The item being pushed.
     */
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    /**
     Removes and returns the item at the top of the stack.
     
     - Returns: The item at the top of the stack.
     */
    @discardableResult
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    /// Returns the item at the top of the stack.
    public var top: T? {
        return array.last
    }
}

