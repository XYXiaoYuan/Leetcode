import Foundation

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
