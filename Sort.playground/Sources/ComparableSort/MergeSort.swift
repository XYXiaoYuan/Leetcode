import Foundation

/// 归并排序
public func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
    guard array.count > 1 else { return array }
    let middleIndex = array.count / 2
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    return merge(leftPile: leftArray, rightPile: rightArray)
}

func merge<T: Comparable>(leftPile: [T], rightPile: [T]) -> [T] {
    var leftIndex = 0
    var rightIndex = 0
    var orderedPile = [T]()
    if orderedPile.capacity < leftPile.count + rightPile.count {
        orderedPile.reserveCapacity(leftPile.count + rightPile.count)
    }
    
    while true {
        guard leftIndex < leftPile.endIndex else {
            orderedPile.append(contentsOf: rightPile[rightIndex..<rightPile.endIndex])
            break
        }
        guard rightIndex < rightPile.endIndex else {
            orderedPile.append(contentsOf: leftPile[leftIndex..<leftPile.endIndex])
            break
        }
        
        if leftPile[leftIndex] < rightPile[rightIndex] {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        } else {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
    }
    return orderedPile
}

/// 左神递归写法
public func myMergeSort<T: Comparable>(_ arr: [T]) -> [T] {
    if arr.isEmpty || arr.count < 2 {
        return arr
    }
    var arr = arr
    process(&arr, 0, arr.count - 1)
    return arr
}

private func process<T: Comparable>(_ arr: inout [T], _ L: Int, _ R: Int) {
    if L == R {
        return
    }
    let mid = L + ((R - L) >> 1)
    process(&arr, L, mid)
    process(&arr, mid + 1, R)
    merge(&arr, L, mid, R)
}

private func merge<T: Comparable>(_ arr: inout [T], _ L: Int, _ M: Int, _ R: Int) {
    var help = [T].init(repeating: 0 as! T, count: R - L + 1)
    var index = 0
    var p1 = L
    var p2 = M + 1
    
    while p1 <= M && p2 <= R {
        if arr[p1] <= arr[p2] {
            help[index] = arr[p1]
            p1 += 1
        } else {
            help[index] = arr[p2]
            p2 += 1
        }
        index += 1
    }
    /// 要么p1越界,要么p2越界;不可能出现:共同越界
    while p1 <= M {
        help[index] = arr[p1]
        index += 1
        p1 += 1
    }
    while p2 <= R {
        help[index] = arr[p2]
        index += 1
        p2 += 1
    }
    
    for i in 0..<help.count {
        arr[L + i] = help[i]
    }
}

/// 左神迭代写法
public func myMergeSort2<T: Comparable>(_ arr: [T]) -> [T] {
    if arr.isEmpty || arr.count < 2 { return arr }
    var arr = arr
    var step = 1
    let N = arr.count
    while step < N {
        var L = 0
        while L < N {
            if step >= N - L {
                break
            }
            let M = L + step - 1
            let R = M + min(step, N - M - 1)
            merge(&arr, L, M, R)
            L = R + 1
        }
        
        if step > (N / 2) {
            break
        }
        step <<= 1
    }
    
    return arr
}

let array = [2, 1, 5, 4, 9]
let sortedArray = mergeSort(array)
let array2 = ["Tom", "Harry", "Ron", "Chandler", "Monica"]
let sortedArray2 = mergeSort(array2)

/* Bottom-up iterative version */

func mergeSortBottomUp<T>(_ a: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
    let n = a.count
    var z = [a, a]   // the two working arrays
    var d = 0        // z[d] is used for reading, z[1 - d] for writing
    
    var width = 1
    while width < n {
        
        var i = 0
        while i < n {
            
            var j = i
            var l = i
            var r = i + width
            
            let lmax = min(l + width, n)
            let rmax = min(r + width, n)
            
            while l < lmax && r < rmax {
                if isOrderedBefore(z[d][l], z[d][r]) {
                    z[1 - d][j] = z[d][l]
                    l += 1
                } else {
                    z[1 - d][j] = z[d][r]
                    r += 1
                }
                j += 1
            }
            while l < lmax {
                z[1 - d][j] = z[d][l]
                j += 1
                l += 1
            }
            while r < rmax {
                z[1 - d][j] = z[d][r]
                j += 1
                r += 1
            }
            
            i += width*2
        }
        
        width *= 2   // in each step, the subarray to merge becomes larger
        d = 1 - d    // swap active array
    }
    return z[d]
}

//mergeSortBottomUp(array, <)
