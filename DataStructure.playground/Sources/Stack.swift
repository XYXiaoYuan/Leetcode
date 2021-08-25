//
//  Stack.swift
//  DataStructExtension
//
//  Created by apple on 2020/8/24.
//

import Foundation

/// 栈
public protocol Stack {
    /// 栈元素类型
    associatedtype Element
    
    /// 元素数量
    var count: Int { get }
    
    /// 顶部元素
    var top: Element? { get }
    
    /// 压入一个元素
    /// - Parameter element: 元素
    mutating func push(_ element: Element)
    
    /// 出栈一个元素
    mutating func pop() -> Element?
    
    
    /// 出栈多个元素
    /// - Parameter count: 元素个数
    mutating func pop(count: Int) -> [Element]?
    
    /// 清空栈
    mutating func removeAll()
}

/// 数组 栈
public struct ArrayStack<T>: Stack {

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
    
    public mutating func pop(count: Int) -> [T]? {
        if count <= 0 {
            return nil
        }
        guard array.count >= count else {
            print("pop count must be < total count")
            return nil
        }
        let result = array[(array.count - count)..<array.count]
        array.removeLast(count)
        return Array(result)
    }
    
    /// Returns the item at the top of the stack.
    public var top: T? {
        return array.last
    }
}
