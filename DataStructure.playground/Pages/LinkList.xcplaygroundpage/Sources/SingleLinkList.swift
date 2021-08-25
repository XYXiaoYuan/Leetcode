//
//  SingleLinkList.swift
//  DataStruct
//
//  Created by apple on 2020/7/15.
//

import Foundation

extension SingleLinkList {
    /// 单链表节点
    final class Node<E>: LinkListNode {
        typealias Element = E
        var val: E
        var next: Node<E>?
        init(val: E, next: Node<E>? = nil) {
            self.val = val
            self.next = next
        }
    }
}

// 单链表
public struct SingleLinkList<T: Equatable>: LinkList {
    public typealias Element = T
    // 头结点
    private var header: Node<T>?
    // 节点数量
    public private(set) var count: Int = 0
    
    public init() {}
    
    public var first: T? {
        header?.val
    }
    
    /// 最后一个元素
    public var last: T? {
        lastNode?.val
    }
    
    /// 获取尾结点
    private var lastNode: Node<T>? {
        guard var node = header else { return nil }
        while node.next != nil {
            node = node.next!
        }
        return node
    }
    
    public var isEmpty: Bool {
        count == 0
    }
    
    
    /// O(N)
    public mutating func append(_ element: T) {
        guard let node = lastNode else {
            header = Node(val: element)
            count = 1
            return
        }
        node.next = Node(val: element)
        count += 1
    }
    #if swift(>=5.2)
    public mutating func append<S>(contentsOf newElements: S) where S : Sequence, Self.Element == S.Element {
        let nodes = newElements.map { Node(val: $0) }
        var pre: Node<T>?
        nodes.forEach {
            pre?.next = $0
            pre = $0
        }
        
        guard let node = lastNode else {
            header = nodes.first
            count = nodes.count
            return
        }
        node.next = nodes.first
        count += nodes.count
    }
    #else
    public mutating func append<S>(contentsOf newElements: S) where S : Sequence, SingleLinkList.Element == S.Element {
    
        let nodes = newElements.map { Node(val: $0) }
        var pre: Node<T>?
        nodes.forEach {
            pre?.next = $0
            pre = $0
        }
        
        guard let node = lastNode else {
            header = nodes.first
            count = nodes.count
            return
        }
        node.next = nodes.first
        count += nodes.count
    }
    #endif
    
    public mutating func insert(_ element: T, at index: Int) {
        if index == 0 {
            header = Node(val: element, next: header)
            count += 1
            return
        }
        guard index > 0, index < count else {
            fatalError("insert element index must be < list.count")
        }

        var node = header!
        var v = 1
        while v < index {
            node = node.next!
            v += 1
        }
        node.next = Node(val: element, next: node.next)
        count += 1
    }
    
    public mutating func insert(_ element: T, after pre: T) {
        guard var node = header else { return }
        while true {
            if node.val == pre {
                node.next = Node(val: element, next: node.next)
                count += 1
                return
            }
            if node.next == nil {
                break
            }
            node = node.next!
        }
    }
    
    public mutating func insert(_ element: T, before next: T) {
        guard var node = header else { return }
        var preNode: Node<T>?
        
        while true {
            if node.val == next {
                if let preNode = preNode {
                    preNode.next = Node(val: element, next: preNode.next)
                    count += 1
                } else {
                    /// 变成头结点
                    header = Node(val: element, next: header)
                    count += 1
                }

                return
            }
            if node.next == nil {
                break
            }
            preNode = node
            node = node.next!
        }
    }
    
    /// O(n)
    @discardableResult
    public mutating func remove(at index: Int) -> T? {
        guard let head = header else { return nil }
        if index == 0 {
            header = head.next
            count -= 1
            return head.val
        }

        guard index > 0, index < count else {
            fatalError("remove element index must be < list.count")
        }
        // 获取删除前一个节点
        var preNode = head
        
        if index > 1 {
            for _ in 0..<(index - 1) {
                preNode = preNode.next!
            }
        }
        
        /// 转移next 关系
        let removed = preNode.next!
        preNode.next = removed.next
        count -= 1
        return removed.val
    }
    
    /// O(1)
    @discardableResult
    public mutating func removeFirst() -> T? {
        let val = header?.val
        header = header?.next
        count -= 1
        return val
    }
    
    /// O(n)
    @discardableResult
    public mutating func removeLast() -> T? {
        guard var node = header else { return nil }
        var preNode: Node<T>?
        while node.next != nil {
            preNode = node
            node = node.next!
        }
        if let preNode = preNode {
            let val = preNode.next?.val
            preNode.next = nil
            count -= 1
            return val
        } else {
            let val = header?.val
            header = nil
            count = 0
            return val
        }
    }
    
    /// O(n)
    @discardableResult
    public mutating func remove(_ element: T) -> T? {
        guard var node = header else { return nil }
        var preNode: Node<T>?
        
        while true {
            if node.val == element {
                var removeVal: T?
                if let preNode = preNode {
                    removeVal = preNode.next?.val
                    preNode.next = preNode.next?.next
                    count -= 1
                } else {
                    /// 变成头结点
                    removeVal = header?.val
                    header = header?.next
                    count -= 1
                }
                return removeVal
            }
            if node.next == nil {
                return nil
            }
            preNode = node
            node = node.next!
        }
    }
    
    /// 下标获取元素 替换元素
    public subscript(index: Int) -> T {
        get {
            guard count > 0, 0..<count ~= index else {
                fatalError("beyond index of boundce")
            }
            var node = header!
            var c = 0
            while c < index {
               node = node.next!
               c += 1
            }
            return node.val
        }
        set {
            guard count > 0, 0..<count ~= index else {
                fatalError("beyond index of boundce")
            }
            var node = header!
            var c = 0
            while c < index {
                node = node.next!
                c += 1
            }
             node.val = newValue
        }
    }
    
    /// 移除所有的元素
    public mutating func removeAll() {
        header = nil
        count = 0
    }
    
    /// O(n)
    public func contains(_ element: T) -> Bool {
        guard var node = header else { return false }
        while true {
            if node.val == element { return true }
            if node.next == nil { return false }
            node = node.next!
        }
    }
    
    public mutating func reverse() {
        guard var head = header else { return }
        
        var node = head.next
        head.next = nil
        while node != nil {
            let temp = node?.next
            node?.next = head
            head = node!
            node = temp
        }
        header = head
    }
}

extension SingleLinkList {
    /// 打印元素
    public var debugDescription: String {
        var str = "<head(\(count))>"
        var node = header
        while node != nil {
            str += " -> \(node!.val)"
            node = node?.next
        }
        return "\n" + str + "\n"
    }
}

extension SingleLinkList {
    #if swift(>=5.2)
    /// 快速构造
    /// - Parameter elements: 元素集合
    public init<S>(contentsOf elements: S) where S : Sequence, Self.Element == S.Element {
        self.init()
        self.append(contentsOf: elements)
    }
    #else
    /// 快速构造
    /// - Parameter elements: 元素集合
    public init<S>(contentsOf elements: S) where S : Sequence, SingleLinkList.Element == S.Element {
        self.init()
        self.append(contentsOf: elements)
    }
    #endif

}

public extension SingleLinkList {
    
    /// 转为数组
    /// - Parameter transform: 转换block
    /// - Returns: 转化结果
    func map<T>(_ transform: (Element) throws -> T) rethrows -> [T] {
        try header?.map { return try transform($0) } ?? []
    }
    
    
    /// 转为数组
    /// - Parameter transform: 转换block 返回nil 时不加入数组
    /// - Returns: 转化结果
    func compactMap<ElementOfResult>(_ transform: (Element) throws -> ElementOfResult?) rethrows -> [ElementOfResult] {
        try header?.compactMap { return try transform($0) } ?? []
    }
    
    /// 遍历操作
    /// - Parameter body: 遍历Block
    func forEach(_ body: (Element) throws -> Void) rethrows {
        try header?.forEach(body)
    }
}

// MARK: -  GeneratorType
extension SingleLinkList: IteratorProtocol {
    public mutating func next() -> Element? { removeFirst() }
}


// MARK: - SequenceType
extension SingleLinkList: Sequence {
    
    public typealias Iterator = SingleLinkList
    
    public func makeIterator() -> Iterator { self }
}

// MARK: - Stack
extension SingleLinkList: Stack {
    public var top: T? {
        first
    }
    
    public mutating func push(_ element: T) {
        insert(element, at: 0)
    }
    
    public mutating func pop() -> T? {
        removeFirst()
    }
    
    public mutating func pop(count: Int) -> [T]? {
        if count <= 0 {
            return nil
        }
        guard self.count >= count else {
            return nil
        }
        
        var result = [T]()
        
        for _ in 0..<count {
            result.append(removeFirst()!)
        }
        return result
    }
}
