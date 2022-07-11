//
//  BloomFilter.swift
//  DataStruct
//
//  Created by apple on 2020/8/25.
//

import Foundation

/// 布隆过滤器
public protocol BloomFilter {
    /// value 类型
    associatedtype Value
    
    /// 位集合 存储bool值 决定容量大小
    var bitSet: BitSet { set  get }
    
    /// hash计算函数
    var hashFunctions: [(Value) -> Int] { get }
}

extension BloomFilter {
    
    /// 插入一个元素 (标记为已处理)
    /// - Parameter value: 元素
    public mutating func insert(_ value: Value) {
        hashFunctions.forEach {
            bitSet[(abs($0(value)) % bitSet.count)] = true
        }
    }
    
    /// 插入一组元素
    public mutating func insert<S>(contentsOf values: S) where S.Element == Self.Value, S: Sequence  {
        values.forEach { insert($0) }
    }
    
    /// 查询该元素是否存在 (是否已处理)
    /// - Parameter value: 元素值
    /// - Returns: 返回true说明可能已存在(被处理了), 返回false说明一定不存在(未被处理)
    public func query(_ value: Value) -> Bool {
        /// Map hashes to indices in the Bloom Filter
        for hashfn in hashFunctions where !bitSet[abs(hashfn(value)) % bitSet.count] {
            return false
        }
        return true
    }
    
    /// As soon as the reduction hits a 'true' value, the && condition will fail.
    public var isEmpty: Bool { bitSet.isEmpty }
}


/// 布隆过滤器
public struct BFStruct<T: Hashable>: BloomFilter {
    /// Value类型
    public typealias Value = T
    /// bool存储集合
    public var bitSet: BitSet
    /// 哈希函数集合
    public var hashFunctions: [(T) -> Int]
    
    
    /// 构造一个布隆过滤器
    /// - Parameters:
    ///   - dataSize: 数据规模
    ///   - fp: false positive 失误率
    public init(dataSize: Int, fp: Float) {
        guard fp > 0, fp < 1 else {
            fatalError("false positive must be in 0<fp<1")
        }
        /*
         Bloom filter  https://en.wikipedia.org/wiki/Bloom_filter
         ε: 错误率
         k: hash 函数数量
         n: 数据规模
         m: bool数据容量
         
         k = - (lnε / ln2) = -log2(ε)
         
         m = - ( n * lnε) / (ln2 * ln2)
         */
        
        /// 计算存储计算规模
        let m = Int(-(Float(dataSize) * log(fp) / (log(2) * log(2))))
        bitSet = BitSet(capacity: m)
        
        /// 添加hash函数
        let k = Int( ceil(-log2(fp)) )
        
        hashFunctions = (0..<k).map { (i) -> ((_: T) -> Int) in
            func a(_ v: Value) -> Int {
                (v.hashValue + i * Int.bitWidth).hashValue
            }
            return a
        }
    }
}
