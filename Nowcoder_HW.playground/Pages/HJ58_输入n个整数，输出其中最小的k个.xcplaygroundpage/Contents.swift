/**
 描述
 输入n个整数，输出其中最小的k个。

 本题有多组输入样例，请使用循环读入，比如while(cin>>)等方式处理
 输入描述：
 第一行输入两个整数n和k
 第二行输入一个整数数组

 输出描述：
 输出一个从小到大排序的整数数组

 示例1
 输入：
 5 2
 1 3 5 7 2
 复制
 输出：
 1 2

 */


import Foundation


func minValueInK(_ line: String, _ n: Int, _ k: Int) -> String {
    let temp = line.components(separatedBy: " ")
    var nums: [Int] = [Int]()
    for i in 0..<n {
        if let num = Int(temp[i]) {
            nums.append(num)
        }
    }
    
    var heap: MaxHeap<Int> = MaxHeap()
    for i in 0..<nums.count {
        let val = nums[i]
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
    
    return result.sorted().map { "\($0)" }.joined(separator: " ")
}

/// 是否是Debug模式
var isDebug: Bool = false

if isDebug {
    let line: String = "1 3 5 7 2"
    let n: Int = 5
    let k: Int = 2
    let result = minValueInK(line, n, k)
    print(result)
} else {
    while let line1 = readLine(), let line2 = readLine() {
        let parts = line1.split(separator: " ")
        if let n = Int(parts[0]), let k = Int(parts[1]) {
            let result = minValueInK(line2, n, k)
            print(result)
        }
    }
}

"""
2 17 19 28 48 50 55 64 89 116 186 195 227 252 254 265 276 277 292 313 316 355 358 387 416 434 451 454 554 562 577 598 612 725 735 742 782 811 812 926 939 980 1002 1024 1035 1106 1193 1210 1263 1281 1281 1288 1350 1371 1454 1462 1476 1496 1511 1518 1521 1549 1645 1649 1672 1733 1773 1790 1831 1833 1859 1866 1873 1876 1886 1899 1920 1927 2075 2132 2150 2168 2185 2237 2241 2256 2323 2329 2338 2356 2421 2422 2431 2434 2496 2517 2522 2528 2536 2577 2584 2587 2606 2764 2771 2811 2824 2840 2871 2893 2900 2909 2916 2928 2937 2946 2982 2985 2989 2990 3020 3029 3069 3159 3176 3183 3193 3193 3218 3227 3241 3243 3280 3293 3296 3310 3331 3367 3388 3397 3437 3444 3472 3486 3491 3497 3520 3540 3571 3606 3611 3631 3647 3663 3691 3717 3743 3758 3762 3768 3801 3817 3864 3916 3951 3969 3973 3974 3976 3994 4003 4012 4014 4055 4062 4086 4095 4124 4134 4177 4241 4260 4299 4305 4315 4324 4326 4340 4343 4350 4374 4396 4411 4412 4421 4430 4443 4457 4467 4467 4498 4503 4597 4600 4737 4762 4782 4788 4808 4831 4849 4873 4874 4886 4907 5031 5080 5102 5106 5115 5128 5147 5162 5163 5213 5218 5259 5276 5277 5297 5302 5312 5319 5325 5337 5359 5367
"""

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

