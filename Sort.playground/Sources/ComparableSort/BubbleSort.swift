import Foundation

/// 冒泡排序
public func bubbleSort<T> (_ elements: [T]) -> [T] where T: Comparable {
    return bubbleSort(elements, <)
}

public func bubbleSort<T> (_ elements: [T], _ comparison: (T, T) -> Bool) -> [T]  {
    var array = elements
    
    if array.isEmpty || array.count < 2 {
        return elements
    }
    
    for i in 0..<array.count {
        for j in 1..<(array.count - i) where comparison(array[j], array[j - 1]) {
            let tmp = array[j - 1]
            array[j - 1] = array[j]
            array[j] = tmp
        }
    }
    
    return array
}

public func bubbleSort1<T> (_ elements: [T]) -> [T] where T: Comparable {
    return bubbleSort1(elements, <)
}

public func bubbleSort1<T> (_ elements: [T], _ comparison: (T, T) -> Bool) -> [T]  {
    var array = elements
    
    for i in 0..<array.count {
        var isSorted: Bool = true
        for j in 1..<(array.count - i) where comparison(array[j], array[j - 1]) {
            let tmp = array[j - 1]
            array[j - 1] = array[j]
            array[j] = tmp
            isSorted = false
        }
        if isSorted { break }
    }
    
    return array
}
