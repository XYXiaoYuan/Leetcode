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
    
    var heap: Heap<Int> = Heap() { e1, e2 in
        return e1 < e2
    }
    
    print(heap)
    
    for i in 0..<n {
        if heap.count < k {
            heap.insert(nums[i])
        } else if (nums[i] < heap.peek() ?? 0) {
            heap.replace(index: i, value: nums[i])
        }
    }
            
    var result: [Int] = [Int]()
    for i in 0..<k {
        let val = heap.nodes[i]
        result.append(val)
    }
    print(result)
    
    return result.map { "\($0)" }.joined(separator: " ")
}

/// 是否是Debug模式
var isDebug: Bool = true

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

public struct Heap<T> {
    
    /** The array that stores the heap's nodes. */
    var nodes = [T]()
    
    /**
     * Determines how to compare two nodes in the heap.
     * Use '>' for a max-heap or '<' for a min-heap,
     * or provide a comparing method if the heap is made
     * of custom elements, for example tuples.
     */
    private var orderCriteria: (T, T) -> Bool
    
    /**
     * Creates an empty heap.
     * The sort function determines whether this is a min-heap or max-heap.
     * For comparable data types, > makes a max-heap, < makes a min-heap.
     */
    public init(sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
    }
    
    /**
     * Creates a heap from an array. The order of the array does not matter;
     * the elements are inserted into the heap in the order determined by the
     * sort function. For comparable data types, '>' makes a max-heap,
     * '<' makes a min-heap.
     */
    public init(array: [T], sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
        configureHeap(from: array)
    }
    
    /**
     * Configures the max-heap or min-heap from an array, in a bottom-up manner.
     * Performance: This runs pretty much in O(n).
     */
    private mutating func configureHeap(from array: [T]) {
        nodes = array
        for i in stride(from: (nodes.count/2-1), through: 0, by: -1) {
            shiftDown(i)
        }
    }
    
    public var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    public var count: Int {
        return nodes.count
    }
    
    /**
     * Returns the index of the parent of the element at index i.
     * The element at index 0 is the root of the tree and has no parent.
     */
    @inline(__always) internal func parentIndex(ofIndex i: Int) -> Int {
        return (i - 1) / 2
    }
    
    /**
     * Returns the index of the left child of the element at index i.
     * Note that this index can be greater than the heap size, in which case
     * there is no left child.
     */
    @inline(__always) internal func leftChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 1
    }
    
    /**
     * Returns the index of the right child of the element at index i.
     * Note that this index can be greater than the heap size, in which case
     * there is no right child.
     */
    @inline(__always) internal func rightChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 2
    }
    
    /**
     * Returns the maximum value in the heap (for a max-heap) or the minimum
     * value (for a min-heap).
     */
    public func peek() -> T? {
        return nodes.first
    }
    
    /**
     * Adds a new value to the heap. This reorders the heap so that the max-heap
     * or min-heap property still holds. Performance: O(log n).
     */
    public mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }
    
    /**
     * Adds a sequence of values to the heap. This reorders the heap so that
     * the max-heap or min-heap property still holds. Performance: O(log n).
     */
    public mutating func insert<S: Sequence>(_ sequence: S) where S.Iterator.Element == T {
        for value in sequence {
            insert(value)
        }
    }
    
    /**
     * Allows you to change an element. This reorders the heap so that
     * the max-heap or min-heap property still holds.
     */
    public mutating func replace(index i: Int, value: T) {
        guard i < nodes.count else { return }
        
        remove(at: i)
        insert(value)
    }
    
    /**
     * Removes the root node from the heap. For a max-heap, this is the maximum
     * value; for a min-heap it is the minimum value. Performance: O(log n).
     */
    @discardableResult public mutating func remove() -> T? {
        guard !nodes.isEmpty else { return nil }
        
        if nodes.count == 1 {
            return nodes.removeLast()
        } else {
            // Use the last node to replace the first one, then fix the heap by
            // shifting this new first node into its proper position.
            let value = nodes[0]
            nodes[0] = nodes.removeLast()
            shiftDown(0)
            return value
        }
    }
    
    /**
     * Removes an arbitrary node from the heap. Performance: O(log n).
     * Note that you need to know the node's index.
     */
    @discardableResult public mutating func remove(at index: Int) -> T? {
        guard index < nodes.count else { return nil }
        
        let size = nodes.count - 1
        if index != size {
            nodes.swapAt(index, size)
            shiftDown(from: index, until: size)
            shiftUp(index)
        }
        return nodes.removeLast()
    }
    
    /**
     * Takes a child node and looks at its parents; if a parent is not larger
     * (max-heap) or not smaller (min-heap) than the child, we exchange them.
     */
    internal mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = nodes[childIndex]
        var parentIndex = self.parentIndex(ofIndex: childIndex)
        
        while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }
        
        nodes[childIndex] = child
    }
    
    /**
     * Looks at a parent node and makes sure it is still larger (max-heap) or
     * smaller (min-heap) than its childeren.
     */
    internal mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(ofIndex: index)
        let rightChildIndex = leftChildIndex + 1
        
        // Figure out which comes first if we order them by the sort function:
        // the parent, the left child, or the right child. If the parent comes
        // first, we're done. If not, that element is out-of-place and we make
        // it "float down" the tree until the heap property is restored.
        var first = index
        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
            first = leftChildIndex
        }
        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
            first = rightChildIndex
        }
        if first == index { return }
        
        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }
    
    internal mutating func shiftDown(_ index: Int) {
        shiftDown(from: index, until: nodes.count)
    }
    
}

// MARK: - Searching

extension Heap where T: Equatable {
    
    /** Get the index of a node in the heap. Performance: O(n). */
    public func index(of node: T) -> Int? {
        return nodes.firstIndex(where: { $0 == node })
    }
    
    /** Removes the first occurrence of a node from the heap. Performance: O(n). */
    @discardableResult public mutating func remove(node: T) -> T? {
        if let index = index(of: node) {
            return remove(at: index)
        }
        return nil
    }
    
}
