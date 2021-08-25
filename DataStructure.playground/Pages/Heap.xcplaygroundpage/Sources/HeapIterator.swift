import Foundation

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
