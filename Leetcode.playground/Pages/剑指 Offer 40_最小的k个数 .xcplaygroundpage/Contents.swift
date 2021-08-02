/**
 https://leetcode-cn.com/problems/zui-xiao-de-kge-shu-lcof/
 
 输入整数数组 arr ，找出其中最小的 k 个数。例如，输入4、5、1、6、2、7、3、8这8个数字，则最小的4个数字是1、2、3、4。

  

 示例 1：

 输入：arr = [3,2,1], k = 2
 输出：[1,2] 或者 [2,1]
 示例 2：

 输入：arr = [0,1,2,1], k = 1
 输出：[0]
  

 限制：

 0 <= k <= arr.length <= 10000
 0 <= arr[i] <= 10000


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/zui-xiao-de-kge-shu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution {
    func getLeastNumbers(_ arr: [Int], _ k: Int) -> [Int] {
        var heap: MaxHeap<Int> = MaxHeap()
        for i in 0..<arr.count {
            let val = arr[i]
            if heap.size < k {
                heap.add(val)
            }
            else if (val < heap.peek() ?? 0) {
                heap.pull()
                heap.add(val)
            }
        }
        
        var result: [Int] = [Int]()
        for value in heap {
            result.append(value)
        }
        
        return result
    }
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

