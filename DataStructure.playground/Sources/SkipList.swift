//
//  SkipLisk.swift
//  DataStruct
//
//  Created by Shangen Zhang on 2020/7/25.
//

import Foundation

/// 跳表最大层数
fileprivate let MAX_LEVEL: Int = 32


fileprivate class DummyNode<K, V>: CustomDebugStringConvertible {
    /// 索引列表
    var nexts: [Node<K, V>?]
    /// 下一个节点
    var next: Node<K, V>? {
        nexts.first ?? nil
    }
    
    init(nexts: [Node<K, V>?]) {
        self.nexts = nexts
    }
    
    var debugDescription: String {
        "DummyNode Level:\(nexts.count)"
    }
}

/// 跳表节点
fileprivate final class Node<K, V>: DummyNode<K, V> {

    /// 元素关联的KEY
    var key: K
    
    /// data
    var val: V
    
    /// 构造方法
    init(key: K, val: V, level: Int) {
        self.key = key
        self.val = val
        super.init(nexts: Array(repeating: nil, count: level))
    }
    
    ///自定义打印
    override var debugDescription: String {
        "key: \(key) value: \(val), level: \(nexts.count)"
    }
}


/// 跳表
public struct SkipList<K, V> {

    /// 节点个数
    public private(set) var count: Int = 0
    /// 是否为空
    public var isEmpty: Bool {
        count == 0
    }
    
    /// 层数
    private var level: Int = 0
    /// 虚拟头结点
    private var dummyNode: DummyNode<K, V> = DummyNode(nexts: Array(repeating: nil, count: MAX_LEVEL))
    
    /// 比较器
    private let compare: (K, K) -> ComparisonResult
    
    /// 构造方法
    /// - Parameter compare: 比较器
    public init(compare: @escaping (K, K) -> ComparisonResult) {
        self.compare = compare
    }
    
    /// 自定义打印
    public var debugDescription: String {
        var str = "<head(count: \(count), level: \(level)>"
        var node = dummyNode.nexts.first ?? nil
        
        while node != nil {
            str += "\n" + node!.debugDescription
            node = node?.next
        }
        return str
    }
}

extension SkipList where K: Comparable {
    /// KEY 值具备可比性
    public init() {
        self.compare = { (k1, k2) -> ComparisonResult in
            if k1 == k2 {
                return .orderedSame
            }
            return k1 < k2 ? .orderedAscending : .orderedDescending
        }
    }
}

public extension SkipList {
    
    /// 获取数据
    /// - Parameter key: 关联的key
    func valueFor(_ key: K) -> V? {
        
        guard level > 0 else { return nil }
        var varNode = dummyNode
        var l = level - 1
        while l >= 0 {
            guard let node = varNode.nexts[l] else {
                l -= 1
                continue
            }
            switch compare(key, node.key) {
            case .orderedSame:
                return node.val
            case .orderedDescending:
                varNode = node
            default:
                l -= 1
            }
        }
        return nil
    }
    
    /// 设置Value Data
    /// - Parameters:
    ///   - val: data value
    ///   - key: 关联的Key
    @discardableResult
    mutating func setValue(_ val: V, for key: K) -> V? {
        guard level > 0 else {
            /// 没有元素存在 插入第一个元素
            let currentLevel = randomLevel()
            let newNode = Node(key: key, val: val, level: currentLevel)
            for i in 0..<currentLevel {
                dummyNode.nexts[i] = newNode
            }
            level = currentLevel
            count = 1
            return nil
        }
        
        /// 当前遍历的节点
        var varNode = dummyNode
        ///记录前驱
        var prevsNexts: [DummyNode<K, V>?] = Array(repeating: nil, count: level)
        /// 层级遍历
        var l = level - 1
        while l >= 0 {
            guard let node = varNode.nexts[l] else {
                prevsNexts[l] = varNode
                l -= 1
                continue
            }
            switch compare(key, node.key) {
            case .orderedSame:
                let orgin = node.val
                node.val = val
                return orgin
            case .orderedDescending:
                // key > node.key 穿过该节点进入下个节点
                varNode = node
            default:
                /// key < node.key 回调j降低索引
                prevsNexts[l] = varNode
                l -= 1
            }
        }
        
        /// 随机产生一个层数  创建新的节点
        let currentLevel = randomLevel()
        let newNode = Node(key: key, val: val, level: currentLevel)
        /// 越界判定
        if currentLevel > level {
            for i in 0..<level {
                /// 连接下一个线
                newNode.nexts[i] = prevsNexts[i]?.nexts[i]
                /// 连接上一个线
                prevsNexts[i]?.nexts[i] = newNode
            }
            for i in level..<currentLevel {
                /// 连接上一个线
                dummyNode.nexts[i] = newNode
            }
            level = currentLevel
        } else {
            for i in 0..<currentLevel {
                /// 连接下一个线
                newNode.nexts[i] = prevsNexts[i]?.nexts[i]
                /// 连接上一个线
                prevsNexts[i]?.nexts[i] = newNode
            }
        }
        count += 1
        return nil
    }

    
    /// 移除元素
    /// - Parameter key: 关联的key
    @discardableResult
    mutating func removeValue(for key: K) -> V? {
        guard level > 0 else {
            /// 没有元素存在
            return nil
        }
        
        var prevsNexts: [DummyNode<K, V>?] = Array(repeating: nil, count: MAX_LEVEL)
        var l = level - 1
        var varNode = dummyNode
        while l >= 0 {
            guard let node = varNode.nexts[l] else {
                l -= 1
                continue
            }
            switch compare(key, node.key) {
            case .orderedDescending:
                // key > node.key 穿过该节点进入下个节点
                varNode = node
            default:
                /// key < node.key 回调j降低索引
                prevsNexts[l] = varNode
                l -= 1
            }
        }
        /// 找到前驱 并且当前Key值一致
        guard let node = prevsNexts[0]?.next, compare(key, node.key) == .orderedSame else { return nil }
        
        let orgin = node.val
        //这里进行删除
        let currentLevel = node.nexts.count
        for index in 0..<currentLevel {
            if let preNode = prevsNexts[index] {
                preNode.nexts[index] = node.nexts[index]
            } else {
                dummyNode.nexts[index] = node.nexts[index]
            }
            
        }
        count -= 1
        
        updateLevel(currentLevel)
        return orgin
    }
    
    @discardableResult
    mutating func removeFirst() -> (key: K, value: V)? {
        guard let node = dummyNode.next else { return nil }
        for i in 0..<node.nexts.count {
            dummyNode.nexts[i] = node.nexts[i]
        }
        count -= 1
        updateLevel(node.nexts.count)
        return (key: node.key, value: node.val)
    }
}



public extension SkipList {
    
    /// 转为数组
    /// - Parameter transform: 转换block
    /// - Returns: 转化结果
    func map<T>(_ transform: (_ key: K, _ value: V) throws -> T) rethrows -> [T] {
        var results = [T]()
        var node = dummyNode.next
        while node != nil {
            results.append(try transform(node!.key, node!.val))
            node = node?.next
        }
        
        return results
    }
    
    
    /// 转为数组
    /// - Parameter transform: 转换block 返回nil 时不加入数组
    /// - Returns: 转化结果
    func compactMap<ElementOfResult>(_ transform: (_ key: K, _ value: V) throws -> ElementOfResult?) rethrows -> [ElementOfResult] {
        var results = [ElementOfResult]()
        var node = dummyNode.next
        while node != nil {
            if let e = try transform(node!.key, node!.val) {
                results.append(e)
            }
            
            node = node?.next
        }
        
        return results
    }
    
    /// 遍历操作
    /// - Parameter body: 遍历Block
    func forEach(_ body: (_ key: K, _ value: V) throws -> Void) rethrows {
        var node = dummyNode.next
        while node != nil {
            try body(node!.key, node!.val)
            node = node?.next
        }
    }
}

public extension SkipList {
    func printSkipNodes() -> String {
        var str = ""
        
        var node = dummyNode.next
        while node != nil {
            let height = String(repeating: "===|", count: node!.nexts.count)
            str += "\n|\(height)\(node!.nexts.count)>"
            node = node?.next
        }
        
        return str
    }
}

private let randomRange = 0...3
private extension SkipList {
    
    /// 随机层
    func randomLevel() -> Int {
        var level = 1
        while Int.random(in: randomRange) == 1 {
            level += 1
            if level == MAX_LEVEL { break }
        }
        return level
    }
    
    /// 更新层级
    mutating func updateLevel(_ removedLevel: Int) {

        /// 更新层数
        if removedLevel == level {
            if count == 0 {
                level = 0
                return
            }
            
            for i in 1..<MAX_LEVEL where dummyNode.nexts[i] == nil {
                level = i
                return
            }
            level = MAX_LEVEL
        }

    }
}

// MARK: -  GeneratorType
extension SkipList: IteratorProtocol {
    public typealias Element = (key: K, value: V)
    public mutating func next() -> Element? { removeFirst() }
}


// MARK: - SequenceType
extension SkipList: Sequence {
    
    public typealias Iterator = SkipList
    
    public func makeIterator() -> Iterator { self }
}
