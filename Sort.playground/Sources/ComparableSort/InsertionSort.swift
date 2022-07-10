import Foundation

/// 插入排序

//: Playground - noun: a place where people can play

/// Performs the Insertion sort algorithm to a given array
///
/// - Parameters:
///   - array: the array of elements to be sorted
///   - isOrderedBefore: returns true if the elements provided are in the corect order
/// - Returns: a sorted array containing the same elements
public func insertionSort<T>(_ array: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
    guard array.count > 1 else { return array }
    
    var sortedArray = array
    for index in 1..<sortedArray.count {
        var currentIndex = index
        let temp = sortedArray[currentIndex]
        while currentIndex > 0 && isOrderedBefore(temp, sortedArray[currentIndex - 1]) {
            sortedArray[currentIndex] = sortedArray[currentIndex - 1]
            currentIndex -= 1
        }
        sortedArray[currentIndex] = temp
    }
    return sortedArray
}

/// Performs the Insertion sort algorithm to a given array
///
/// - Parameter array: the array to be sorted, conatining elements that conform to the Comparable protocol
/// - Returns: a sorted array containing the same elements
public func insertionSort<T: Comparable>(_ array: [T]) -> [T] {
    var sortedArray = array
    for index in 1..<sortedArray.count {
        var currentIndex = index
        let temp = sortedArray[currentIndex]
        while currentIndex > 0 && temp < sortedArray[currentIndex - 1] {
            sortedArray[currentIndex] = sortedArray[currentIndex - 1]
            currentIndex -= 1
        }
        sortedArray[currentIndex] = temp
    }
    return sortedArray
}

//let list = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]
//print(insertionSort(list))
//print(insertionSort(list, <))
//print(insertionSort(list, >))
