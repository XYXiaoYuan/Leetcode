import Foundation

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
