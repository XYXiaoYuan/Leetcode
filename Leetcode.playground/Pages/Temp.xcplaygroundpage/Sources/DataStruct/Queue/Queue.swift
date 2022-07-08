//
//  Queue.swift
//  DataStruct
//
//  Created by apple on 2020/8/20.
//

import Foundation

public protocol Queue {
    /// 元素类型
    associatedtype QE
    
    /// 当前元素个数
    var count: Int { get }
    
    /// 队列首元素
    func peek() -> QE?
    
    /// 压入一个新的元素到队列
    /// - Parameter element: 元素
    mutating func push(_ element: QE)
    
    /// 移除堆顶元素
    mutating func pop() -> QE?
    
    /// 移除一个元素 从队头开始匹配
    /// - Parameter item: 需要移除的元素
    /// - Returns: 返回队列中保存的元素 如果不存在则返回nil
    mutating func removeFromFront(_ item: QE) -> QE?
    
    /// 移除一个元素 从队尾开始匹配
    /// - Parameter item: 需要移除的元素
    /// - Returns: 返回队列中保存的元素 如果不存在则返回nil
    mutating func removeFromTail(_ item: QE) -> QE?
    
    /// 移除所有的该元素
    /// - Parameter item: 需要移除的元素
    /// - Returns: 返回队列中保存的所有元素 如果不存在则返回nil
    mutating func removeAll(_ item: QE) -> [QE]?
    
    /// 清空队列
    mutating func clear()
}
