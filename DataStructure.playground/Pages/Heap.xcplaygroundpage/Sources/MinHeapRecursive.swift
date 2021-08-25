import Foundation

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
