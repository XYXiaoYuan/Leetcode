//
//  HashTable.swift
//  DataStructExtension
//
//  Created by apple on 2020/8/21.
//


import Foundation

/**
 *  `HashTable`
 */
open class HashTable<T> {
    
    /// The delegates hash table.
    private let table: NSHashTable<AnyObject>
    
    
    /// count of element
    public var count: Int {
         table.allObjects.count
    }
    
    /**
     *  Use the property to check if no delegates are contained there.
     *
     *  - returns: `true` if there are no delegates at all, `false` if there is at least one.
     */
    public var isEmpty: Bool {
        return table.allObjects.count == 0
    }
    
    /**
     *  Use this method to initialize a new `MulticastDelegate` specifying whether delegate references should be weak or
     *  strong.
     *
     *  - parameter strongReferences: Whether delegates should be strongly referenced, false by default.
     *
     *  - returns: A new `MulticastDelegate` instance
     */
    public init(strongReferences: Bool = false) {
        
        table = strongReferences ? NSHashTable<AnyObject>() : NSHashTable<AnyObject>.weakObjects()
    }
    
    /**
     *  Use this method to initialize a new `MulticastDelegate` specifying the storage options yourself.
     *
     *  - parameter options: The underlying storage options to use
     *
     *  - returns: A new `MulticastDelegate` instance
     */
    public init(options: NSPointerFunctions.Options) {
        
        table = NSHashTable<AnyObject>(options: options, capacity: 0)
    }
    
    /**
     *  Use this method to add a delelgate.
     *
     *  Alternatively, you can use the `+=` operator to add a delegate.
     *
     *  - parameter delegate:  The delegate to be added.
     */
    public func append(_ element: T) {
        
        table.add(element as AnyObject)
    }
    
    /**
     *  Use this method to remove a previously-added delegate.
     *
     *  Alternatively, you can use the `-=` operator to add a delegate.
     *
     *  - parameter delegate:  The delegate to be removed.
     */
    public func remove(_ element: T) {
        
        table.remove(element as AnyObject)
    }
    
    /**
     *  Use this method to invoke a closure on each delegate.
     *
     *  Alternatively, you can use the `|>` operator to invoke a given closure on each delegate.
     *
     *  - parameter invocation: The closure to be invoked on each delegate.
     */
    public func enumerate(_ block: (T) -> ()) {
        
        for delegate in table.allObjects {
            block(delegate as! T)
        }
    }
    
    /**
     *  Use this method to determine if the multicast delegate contains a given delegate.
     *
     *  - parameter delegate:   The given delegate to check if it's contained
     *
     *  - returns: `true` if the delegate is found or `false` otherwise
     */
    public func contains(_ element: T) -> Bool {
        return table.contains(element as AnyObject)
    }
}



/**
 *  Use this operator to add a delegate.
 *
 *  This is a convenience operator for calling `addDelegate`.
 *
 *  - parameter left:   The multicast delegate
 *  - parameter right:  The delegate to be added
 */
public func +=<T>(left: HashTable<T>, right: T) {
    
    left.append(right)
}

/**
 *  Use this operator to remove a delegate.
 *
 *  This is a convenience operator for calling `removeDelegate`.
 *
 *  - parameter left:   The multicast delegate
 *  - parameter right:  The delegate to be removed
 */
public func -=<T>(left: HashTable<T>, right: T) {
    
    left.remove(right)
}

/**
 *  Use this operator invoke a closure on each delegate.
 *
 *  This is a convenience operator for calling `invokeDelegates`.
 *
 *  - parameter left:   The multicast delegate
 *  - parameter right:  The closure to be invoked on each delegate
 *
 *  - returns: The `MulticastDelegate` after all its delegates have been invoked
 */
precedencegroup MulticastPrecedence {
    associativity: left
    higherThan: TernaryPrecedence
}
infix operator |> : MulticastPrecedence
public func |><T>(left: HashTable<T>, right: (T) -> ()) {
    
    left.enumerate(right)
}
