/**
 https://www.nowcoder.com/practice/e016ad9b7f0b45048c58a9f27ba618bf?tpId=194&&tqId=35797&rp=1&ru=/activity/oj&qru=/ta/job-code-high-client/question-ranking
 
 描述
 有一个整数数组，请你根据快速排序的思路，找出数组中第K大的数。

 给定一个整数数组a,同时给定它的大小n和要找的K(1<=K<=n)，请返回第K大的数(包括重复的元素，不用去重)，保证答案存在。

 示例1
 输入：
 [1,3,5,2,2],5,3
 复制
 返回值：
 2
 复制
 示例2
 输入：
 [10,10,9,9,8,7,5,6,4,3,4,2],12,3
 复制
 返回值：
 9
 复制
 说明：
 去重后的第3大是8，但本题要求包含重复的元素，不用去重，所以输出9

 */

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param a int整型一维数组
     * @param n int整型
     * @param K int整型
     * @return int整型
     */
    func findKth ( _ input: [Int],  _ n: Int,  _ k: Int) -> Int {
        var heap: MinHeap<Int> = MinHeap()
        for i in 0..<n {
            let val = input[i]
            if heap.size < k {
                heap.add(val)
            }
            else if let top = heap.peek(), val > top {
                heap.pull()
                heap.add(val)
            }
        }
                
        var result: [Int] = [Int]()
        for value in heap {
            result.append(value)
        }
        
        print(result)
        
        return heap.peek() ?? 0
    }
}

let s = Solution()
let result = s.findKth([1332802,1177178,1514891,871248,753214,123866,1615405,328656,1540395,968891,1884022,252932,1034406,1455178,821713,486232,860175,1896237,852300,566715,1285209,1845742,883142,259266,520911,1844960,218188,1528217,332380,261485,1111670,16920,1249664,1199799,1959818,1546744,1904944,51047,1176397,190970,48715,349690,673887,1648782,1010556,1165786,937247,986578,798663],49,24)
print(result)

//assert(s.maxValue(input1) == 12)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}



/// The `Heap` protocol
/// - note: `Heap` conforms to `Sequence`.
public protocol Heap: Sequence {
    /// The type to store in the `Heap`
    associatedtype ElementType
    /// The storage array of the `Heap`
    var storage: [ElementType] { get set }
    /// The size of the `Heap`
    var size: Int { get }
    /// True if the `Heap` is empty it is true and otherwise is false.
    var isEmpty: Bool { get }
    /// A function implementing the `heapifyUp` algorithm
    mutating func heapifyUp()
    /// A function implementing the `heapifyDown` algorithm
    mutating func heapifyDown()
}
/// `Heap` extension to provides all the shared code between `MaxHeap`, `MinHeap`,
/// `MaxHeapRecursive`, and `MinHeapRecursive`.
extension Heap {
    /// The internal storage's `Array`.`size` property
    public var size: Int {
        return self.storage.count
    }
    /// The internal storage's `Array`.`isEmpty` property
    public var isEmpty: Bool {
        return self.storage.isEmpty
    }
    /// Read the next item off the `Heap` without removing it.
    ///
    /// - returns: The next item of type `ElementType` from the `Heap` or, if the `Heap`.`isEmpty` return's `nil`.
    public func peek() -> ElementType? {
        guard !self.isEmpty else {
            return nil
        }
        return self.storage[0]
    }
    /// Read and remove the next item off `Heap`.
    ///
    /// - returns: The next item of type `ElementType` from the `Heap` or, if the `Heap`.`isEmpty` return's `nil`.
    public mutating func pull() -> ElementType? {
        let item = peek()
        guard !self.isEmpty else {
            return nil
        }
        guard self.size > 1 else {
            return self.storage.popLast()!
        }
        storage[0] = self.storage.popLast()!
        heapifyDown()
        return item
    }
    /// Add an item to the `Heap`.
    ///
    /// - parameters:
    ///     - elem: Item to add to the `Heap`.
    public mutating func add(_ elem: ElementType) {
        self.storage.append(elem)
        self.heapifyUp()
    }
    /// `Sequence`.`makeIterator()` to conform to `Sequence`
    ///
    /// - returns: A `HeapIterator<Self>` to conform to `Sequence`
    public func makeIterator() -> HeapIterator<Self> {
        return HeapIterator(self)
    }
    /// Calculates the left child index for any given index
    ///
    /// - parameters:
    ///     - parent: the parent index
    /// - returns: left child index
    internal static func getLeftChildIndex(_ parent: Int) -> Int {
        return (2 * parent) + 1
    }
    /// Calculates the right child index for any given index
    ///
    /// - parameters:
    ///     - parent: the parent index
    /// - returns: right child index
    internal static func getRightChildIndex(_ parent: Int) -> Int {
        return (2 * parent) + 2
    }
    /// Calculates the parent index for any given index
    ///
    /// - parameters:
    ///     - child: the parent index
    /// - returns: right child index
    internal static func getParentIndex(_ child: Int) -> Int {
        return (child - 1) / 2
    }
    /// Checks to see if there is a left child
    ///
    /// - parameters:
    ///     - parent: the parent index
    /// - returns: true if there is a left child otherwise it returns false.
    internal func hasLeftChild(_ parent: Int) -> Bool {
        return Self.getLeftChildIndex(parent) < self.size
    }
    /// Checks to see if there is a right child
    ///
    /// - parameters:
    ///     - parent: the parent index
    /// - returns: true if there is a right child otherwise it returns false.
    internal func hasRightChild(_ parentIndex: Int) -> Bool {
        return Self.getRightChildIndex(parentIndex) < self.size
    }
    /// Checks to see if there is a parent
    ///
    /// - parameters:
    ///     - child: The child index.
    /// - returns: True if there is a parent otherwise it returns false.
    internal func hasParent(_ child: Int) -> Bool {
        return child != 0 && Self.getParentIndex(child) >= 0
    }
    /// Retrieve the left child
    ///
    /// - parameters:
    ///     - parent: The parent index.
    /// - returns: The left child
    internal func getLeftChild(_ parent: Int) -> ElementType {
        return self.storage[Self.getLeftChildIndex(parent)]
    }
    /// Retrieve the right child
    ///
    /// - parameters:
    ///     - parent: the parent index
    /// - returns: The right child.
    internal func getRightChild(_ parent: Int) -> ElementType {
        return self.storage[Self.getRightChildIndex(parent)]
    }
    /// Retrieve the parent
    ///
    /// - parameters:
    ///     - child: the child index
    /// - returns: the parent
    internal func getParent(_ child: Int) -> ElementType {
        return self.storage[Self.getParentIndex(child)]
    }
    /// Swap element's indecies
    ///
    /// - parameters:
    ///     - first: The first element's index.
    ///     - second: The second element's index.
    mutating internal func swap(_ first: Int, _ second: Int) {
        let tmp = self.storage[first]
        self.storage[first] = self.storage[second]
        self.storage[second] = tmp
    }
}
/// The `HeapIterator` used to conform to `Sequence`
/// - note: `HeapIterator` conforms to `IteratorProtocol`
/// - note: It's generic `H` conforms to `Heap`
public struct HeapIterator<H: Heap>: IteratorProtocol {
    /// Internal heap used by the iterator
    var heap: H
    /// Init method for the iterator
    init(_ heap: H) {
        self.heap = heap
    }
    /// The next item in the iteration.
    ///
    /// - returns: The result of `Heap`.`pull()` -> `T?`
    public mutating func next() -> H.ElementType? {
        if heap.isEmpty {
            return nil
        } else {
            return  heap.pull()
        }
    }
}
/// A `MaxHeap` using iterative heapify methods.
/// - note: `MaxHeap` conforms to `Heap`
/// - note: The datatype in the `Heap` must conform to `Comparable`.
public struct MaxHeap<ElementType: Comparable>: Heap {
    /// Public init
    public init() {}
    /// The storage array of the `Heap`
    public var storage: [ElementType] = []
    /// The `MaxHeap` iterative `heapifyUp` algorithm.
    mutating public func heapifyUp() {
        var index = self.size - 1
        while hasParent(index) && self.storage[index] > getParent(index) {
            let parentIndex = Self.getParentIndex(index)
            swap(parentIndex, index)
            index = parentIndex
        }
    }
    /// The `MaxHeap` iterative `heapifyDown` algorithm.
    mutating public func heapifyDown() {
        var index = 0
        while hasLeftChild(index) {
            var largest = Self.getLeftChildIndex(index)
            if hasRightChild(index) && getRightChild(index) > getLeftChild(index) {
                largest = Self.getRightChildIndex(index)
            }
            
            if self.storage[index] > self.storage[largest] {
                break
            } else {
                swap(index, largest)
                index = largest
            }
        }
    }
}
/// A `MinHeap` using iterative heapify methods.
/// - note: `MinHeap` conforms to `Heap`
/// - note: The datatype in the `Heap` must conform to `Comparable`.
public struct MinHeap<ElementType: Comparable>: Heap {
    /// Public init
    public init() {}
    /// The storage array of the `Heap`
    public var storage: [ElementType] = []
    /// The `MinHeap` iterative `heapifyUp` algorithm.
    mutating public func heapifyUp() {
        var index = self.size - 1
        while hasParent(index) && self.storage[index] < getParent(index) {
            let parentIndex = Self.getParentIndex(index)
            swap(parentIndex, index)
            index = parentIndex
        }
    }
    /// The `MinHeap` iterative `heapifyDown` algorithm.
    mutating public func heapifyDown() {
        var index = 0
        while hasLeftChild(index) {
            var smallest = Self.getLeftChildIndex(index)
            if hasRightChild(index) && getRightChild(index) < getLeftChild(index) {
                smallest = Self.getRightChildIndex(index)
            }
            
            if self.storage[index] < self.storage[smallest] {
                break
            } else {
                swap(index, smallest)
                index = smallest
            }
        }
    }
}
/// A `MaxHeapRecursive` using recursive heapify methods.
/// - note: `MaxHeapRecursive` conforms to `Heap`
/// - note: The datatype in the `Heap` must conform to `Comparable`.
public struct MaxHeapRecursive<ElementType: Comparable>: Heap {
    /// Public init
    public init() {}
    /// The storage array of the `Heap`
    public var storage: [ElementType] = []
    /// The `MaxHeapRecursive` recursive `heapifyUp` starter method.
    mutating public func heapifyUp() {
        heapifyUp(at: self.size - 1)
    }
    /// The `MaxHeapRecursive` recursive `heapifyUp` algorithm.
    /// - parameters:
    ///     - at: The index to `heapifyUp` from.
    mutating internal func heapifyUp(at index: Int) {
        if hasParent(index) && self.storage[index] > getParent(index) {
            let parentIndex = Self.getParentIndex(index)
            swap(index, parentIndex)
            heapifyUp(at: parentIndex)
        }
    }
    /// The `MaxHeapRecursive` recursive `heapifyDown` starter method.
    mutating public func heapifyDown() {
        heapifyDown(at: 0)
    }
    /// The `MaxHeapRecursive` recursive `heapifyDown` algorithm.
    /// - parameters:
    ///     - at: The index to `heapifyDown` from.
    mutating internal func heapifyDown(at index: Int) {
        var largest = index
        
        if hasLeftChild(index) && getLeftChild(index) > self.storage[index] {
            largest = Self.getLeftChildIndex(index)
        }
        
        if hasRightChild(index) && getRightChild(index) > self.storage[largest] {
            largest = Self.getRightChildIndex(index)
        }
        
        if largest != index {
            swap(index, largest)
            heapifyDown(at: largest)
        }
    }
}
/// A `MinHeapRecursive` using recursive heapify methods.
/// - note: `MinHeapRecursive` conforms to `Heap`
/// - note: The datatype in the `Heap` must conform to `Comparable`.
public struct MinHeapRecursive<ElementType: Comparable>: Heap {
    /// Public init
    public init() {}
    /// The storage array of the `Heap`
    public var storage: [ElementType] = []
    /// The `MinHeapRecursive` recursive `heapifyUp` starter method.
    mutating public func heapifyUp() {
        heapifyUp(at: self.size - 1)
    }
    /// The `MinHeapRecursive` recursive `heapifyUp` algorithm.
    /// - parameters:
    ///     - at: The index to `heapifyUp` from.
    mutating internal func heapifyUp(at index: Int) {
        if hasParent(index) && storage[index] < getParent(index) {
            let parentIndex = Self.getParentIndex(index)
            swap(index, parentIndex)
            heapifyUp(at: parentIndex)
        }
    }
    /// The `MinHeapRecursive` recursive `heapifyDown` starter method.
    mutating public func heapifyDown() {
        self.heapifyDown(at: 0)
    }
    /// The `MinHeapRecursive` recursive `heapifyDown` algorithm.
    /// - parameters:
    ///     - at: The index to `heapifyDown` from.
    mutating internal func heapifyDown(at index: Int) {
        var smallest = index
        
        if hasLeftChild(index) && getLeftChild(index) < storage[index] {
            smallest = Self.getLeftChildIndex(index)
        }
        
        if hasRightChild(index) && getRightChild(index) < storage[smallest] {
            smallest = Self.getRightChildIndex(index)
        }
        
        if smallest != index {
            swap(index, smallest)
            heapifyDown(at: smallest)
        }
    }
}

