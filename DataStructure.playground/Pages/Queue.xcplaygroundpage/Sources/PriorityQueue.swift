//
//  PriorityQueue.swift
//  DataStruct
//
//  Created by apple on 2020/8/20.
//

import Foundation

/// 优先级队列
public struct PriorityQueue<E> {
    
    fileprivate var heap: [E]
    
    fileprivate let cmp: (E, E) -> ComparisonResult
    
    /// 最终构造方法
    /// - Parameters:
    ///   - values: 初始化值
    ///   - cmp: 比较器
    fileprivate init(starting values: [E], cmp: @escaping (E, E) -> ComparisonResult) {
        self.cmp = cmp
        self.heap = values
        
        var i = heap.count/2 - 1
        while i >= 0 {
            sink(i)
            i -= 1
        }
    }
}

extension PriorityQueue {
    
    /// 常规构造方法
    /// - Parameters:
    ///   - ascending: 是否为小顶堆
    ///   - values: 初始值
    ///   - cmp: 自定义比较器
    public init(ascending: Bool, starting values: [E] = [], cmp: @escaping (E, E) -> ComparisonResult) {
        if ascending {
            self.init(starting: values, cmp: { cmp($0, $1) })
        } else {
            self.init(starting: values, cmp: { cmp($1, $0) })
        }
    }
}

extension PriorityQueue where E: Comparable {
    
    /// 当元素本身具有比较性的时候, 直接构造
    /// - Parameters:
    ///   - ascending: 是否为小顶堆
    ///   - values: 初始化值
    public init(ascending: Bool = false, starting values: [E] = []) {
        if ascending {
            self.init(starting: values, cmp: {
                if $0 == $1 { return .orderedSame }
                return $0 > $1 ? .orderedAscending : .orderedDescending
            })
        } else {
            self.init(starting: values, cmp: {
                if $0 == $1 { return .orderedSame }
                return $0 < $1 ? .orderedAscending : .orderedDescending
            })
        }
    }
}

extension PriorityQueue: Queue {
    /// typealias Queue.Element
    public typealias QE = E

    /// How many elements the Priority Queue stores
    public var count: Int { heap.count }
    
    /// true if and only if the Priority Queue is empty
    public var isEmpty: Bool { heap.isEmpty }
    
    /// Get a look at the current highest priority item, without removing it. O(1)
    ///
    /// - returns: The element with the highest priority in the PriorityQueue, or nil if the PriorityQueue is empty.
    public func peek() -> E? { heap.first }
    
    /// Add a new element onto the Priority Queue. O(lg n)
    ///
    /// - parameter element: The element to be inserted into the Priority Queue.
    public mutating func push(_ element: E) {
        heap.append(element)
        swim(heap.count - 1)
    }

    /// Remove and return the element with the highest priority (or lowest if ascending). O(lg n)
    ///
    /// - returns: The element with the highest priority in the Priority Queue, or nil if the PriorityQueue is empty.
    public mutating func pop() -> E? {
        if heap.isEmpty { return nil }
        let count = heap.count
        if count == 1 { return heap.removeFirst() }  // added for Swift 2 compatibility
        // so as not to call swap() with two instances of the same location
        fastPop(newCount: count - 1)
        
        return heap.removeLast()
    }
    
    /// Removes the first occurence of a particular item. Finds it by value comparison using ==. O(n)
    /// Silently exits if no occurrence found.
    ///
    /// - parameter item: The item to remove the first occurrence of.
    public mutating func removeFromFront(_ item: E) -> E? {
        
        if !heap.isEmpty {
            for i in 0..<heap.count where cmp(heap[i], item) == .orderedSame {
                return remove(at: i)
            }
        }
        return nil
    }
    
    /// Removes the last occurence of a particular item. Finds it by value comparison using ==. O(n)
    /// Silently exits if no occurrence found.
    ///
    /// - parameter item: The item to remove the first occurrence of.
    public mutating func removeFromTail(_ item: E) -> E? {
        if !heap.isEmpty {
            for i in stride(from: heap.count - 1, through: 0, by: -1) where cmp(heap[i], item) == .orderedSame {
                return remove(at: i)
            }
        }
        return nil
    }
    
    /// 删除某个索引
    /// - Parameter index: 索引值
    /// - Returns: 索引对应的值
    private mutating func remove(at index: Index) -> E {
        let result = heap[index]
        heap.swapAt(index, heap.count - 1)
        heap.removeLast()
        if index < heap.count { // if we removed the last item, nothing to swim
            swim(index)
            sink(index)
        }
        return result
    }
    
    /// Removes all occurences of a particular item. Finds it by value comparison using ==. O(n)
    /// Silently exits if no occurrence found.
    ///
    /// - parameter item: The item to remove.
    public mutating func removeAll(_ item: E) -> [E]? {
        var items = [E]()
        while let e = removeFromFront(item) {
            items.append(e)
        }
        return items.isEmpty ? nil : items
    }
    
    /// Eliminate all of the elements from the Priority Queue.
    public mutating func clear() {
        heap.removeAll(keepingCapacity: false)
    }
}



private extension PriorityQueue {
    func firstIndexItem(of item: E) -> Int? {
        if !heap.isEmpty  {
            for i in 0..<heap.count where cmp(heap[i], item) == .orderedSame {
                return i
            }
        }
        return nil
    }
    
    func ordered(_ e1: E, _ e2: E) -> Bool {
        cmp(e1, e2) != .orderedAscending
    }
    
    // Based on example from Sedgewick p 316
    mutating func swim(_ index: Int) {
        var index = index
        while index > 0 && ordered(heap[(index - 1) / 2], heap[index]) {
            heap.swapAt((index - 1) / 2, index)
            index = (index - 1) / 2
        }
    }
    
    // Based on example from Sedgewick p 316
    mutating func sink(_ index: Int) {
        var index = index
        while 2 * index + 1 < heap.count {
            
            var j = 2 * index + 1
            
            if j < (heap.count - 1) && ordered(heap[j], heap[j + 1]) { j += 1 }
            if !ordered(heap[index], heap[j]) { break }
            
            heap.swapAt(index, j)
            index = j
        }
    }
    
    /// Helper function for pop.
    ///
    /// Swaps the first and last elements, then sinks the first element.
    ///
    /// After executing this function, calling `heap.removeLast()` returns the popped element.
    /// - Parameter newCount: The number of elements in heap after the `pop()` operation is complete.
    private mutating func fastPop(newCount: Int) {
        var index = 0
        func ordered(_ e1: E, _ e2: E) -> Bool {
            cmp(e1, e2) != .orderedAscending
        }
        heap.withUnsafeMutableBufferPointer { bufferPointer in
            let _heap = bufferPointer.baseAddress! // guaranteed non-nil because count > 0
            swap(&_heap[0], &_heap[newCount])
            while 2 * index + 1 < newCount {
                var j = 2 * index + 1
                if j < (newCount - 1) && ordered(_heap[j], _heap[j+1]) { j += 1 }
                if !ordered(_heap[index], _heap[j]) { return }
                swap(&_heap[index], &_heap[j])
                index = j
            }
        }
    }
}

// MARK: -  GeneratorType
extension PriorityQueue: IteratorProtocol {
    public typealias Element = E
    public mutating func next() -> Element? { pop() }
}


// MARK: - SequenceType
extension PriorityQueue: Sequence {
    
    public typealias Iterator = PriorityQueue
    
    public func makeIterator() -> Iterator { self }
}


// MARK: - CollectionType
extension PriorityQueue: Collection {

    public typealias Index = Int

    public var startIndex: Int { heap.startIndex }
    public var endIndex: Int { heap.endIndex }

    public subscript(i: Int) -> E { heap[i] }

    public func index(after i: PriorityQueue.Index) -> PriorityQueue.Index {
        heap.index(after: i)
    }
}


// MARK: - CustomStringConvertible, CustomDebugStringConvertible
extension PriorityQueue: CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description: String { return heap.description }
    public var debugDescription: String { return heap.debugDescription }
}
