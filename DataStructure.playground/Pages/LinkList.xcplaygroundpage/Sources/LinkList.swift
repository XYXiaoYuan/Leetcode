//
//  LinkList.swift
//  DataStruct
//
//  Created by apple on 2020/7/15.
//

import Foundation

/// 链表
public protocol LinkList {
    /// 元素类型
    associatedtype Element where Element: Equatable
    
    /// 第一个元素
    var first: Element? { get }
    
    /// 最后一个元素
    var last: Element? { get }
    
    /// 数量
    var count: Int { get }
    
    /// 添加一个元素
    mutating func append(_ element: Element)
    
    /// 添加一串元素
    mutating func append<S>(contentsOf newElements: S) where Element == S.Element, S : Sequence
    
    /// 在某个元素之后插入一个元素
    mutating func insert(_ element: Element, at index: Int)
    
    /// 在某个元素之后插入一个元素
    mutating func insert(_ element: Element, after pre: Element)
    
    /// 在某个元素之前插入一个元素
    mutating func insert(_ element: Element, before next: Element)
    
    /// 移除某个元素
    mutating func remove(_ element: Element) -> Element?
    
    /// 移除某个元素
    mutating func remove(at index: Int) -> Element?
    
    /// 移除首节点
    mutating func removeFirst() -> Element?
    
    /// 移除末尾节点
    mutating func removeLast() -> Element?
    
    /// 移除所有的元素
    mutating func removeAll()
    
    /// 下标获取摸个元素
    subscript(index: Int) -> Element { set get }
    
    /// 是否包含某个元素
    func contains(_ element: Element) -> Bool
    
    /// 反转链表
    mutating func reverse()
}



/// 链表节点
public protocol LinkListNode {
    /// 元素类型
    associatedtype Element
    /// 包裹的元素
    var val: Element { get }
    /// 下一个节点
    var next: Self? { get }
}


public extension LinkListNode {
    
    /// 转为数组
    /// - Parameter transform: 转换block
    /// - Returns: 转化结果
    func map<T>(_ transform: (Element) throws -> T) rethrows -> [T] {
        var node = self
        var array = [T]()
        while true {
            let t = try transform(node.val)
            array.append(t)
            if node.next == nil {
                return array
            }
            node = node.next!
        }
    }
    
    
    /// 转为数组
    /// - Parameter transform: 转换block 返回nil 时不加入数组
    /// - Returns: 转化结果
    func compactMap<ElementOfResult>(_ transform: (Element) throws -> ElementOfResult?) rethrows -> [ElementOfResult] {
        var node = self
        var array = [ElementOfResult]()
        while true {
            if let t = try transform(node.val) {
                array.append(t)
            }
            
            if node.next == nil {
                return array
            }
            node = node.next!
        }
    }
    
    
    /// 遍历操作
    /// - Parameter body: 遍历Block
    func forEach(_ body: (Element) throws -> Void) rethrows {
         var node = self
        while true {
            try body(node.val)
            if node.next == nil {
                return
            }
            node = node.next!
        }
    }
}
