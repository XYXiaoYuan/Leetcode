//
//  BitSet.swift
//  DataStruct
//
//  Created by apple on 2020/8/25.
//

import Foundation

/// BitSet 位集合
public struct BitSet {
    /// 索引
    public typealias Index = Int
    /// 实际可以存储的数量 大于等于初始化传入的capacity
    public let count: Int
    /// 索引值
    private var indexes: [Int]
    
    /// 构造一个bitset
    /// - Parameter capacity: 容量
    public init(capacity: Int) {
        let arrayCount = ((capacity + Int.bitWidth - 1) / Int.bitWidth)
        self.count = arrayCount * Int.bitWidth
        self.indexes = Array(repeating: 0, count: arrayCount)
    }
    
    /// 索引取值
    public subscript(i: Index) -> Bool {
        set {
            /// 越界校验
            guard 0..<count ~= i else { fatalError("subscript index beyond the boundary") }
            
            let offset = 1 << (i % Index.bitWidth)
            if newValue {
                indexes[i / Index.bitWidth] |= offset
            } else {
                indexes[i / Index.bitWidth] &= (~offset)
            }
        }
        get {
            /// 越界校验
            guard 0..<count ~= i else { fatalError("subscript index beyond the boundary") }
            
            let value = indexes[i / Index.bitWidth]
            let offset = 1 << (i % Index.bitWidth)
            return (value & offset) != 0
        }
    }
    
    /// 是否为空
    public var isEmpty: Bool {
        for i in indexes where i != 0 {
            return false
        }
        return true
    }
}
