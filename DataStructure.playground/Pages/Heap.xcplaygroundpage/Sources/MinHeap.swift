import Foundation

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
