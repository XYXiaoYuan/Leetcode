import UIKit



func myMergeSort1<T: Comparable>(_ arr: [T]) -> [T] {
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
    print("递归左右有序后 arr \(arr)")
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

let result1 = myMergeSort1([4,3,2,1,6,8,7,5])
print("归并排序(递归) \(result1)")
print("归并排序(递归)呀哈哈 完美收工")


func myMergeSort2<T: Comparable>(_ arr: [T]) -> [T] {
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

let result2 = myMergeSort2([4,3,2,1,6,8,7,5])
print("归并排序(迭代) \(result2)")
print("归并排序(迭代)呀哈哈 完美收工")


/// 测试冒泡排序
func testBubbleSort() {
    let array: [Int] = [4, 2, 1, 3]

    var temp: [Int] = [Int]()

    temp = bubbleSort(array)
    assert(temp == [1, 2, 3, 4])
    temp = bubbleSort(array, <)
    assert(temp == [1, 2, 3, 4])
    temp =  bubbleSort(array, >)
    assert(temp == [4, 3, 2, 1])
}

func testBubbleSort1() {
    let array: [Int] = [4, 2, 1, 3]

    var temp: [Int] = [Int]()

    temp = bubbleSort1(array)
    assert(temp == [1, 2, 3, 4])
    temp = bubbleSort1(array, <)
    assert(temp == [1, 2, 3, 4])
    temp =  bubbleSort1(array, >)
    assert(temp == [4, 3, 2, 1])
}

//testBubbleSort()

//testBubbleSort1()

//Times.test(title: "冒泡排序") {
//    testBubbleSort()
//}
//
//Times.test(title: "冒泡排序1") {
//    testBubbleSort1()
//}

//extension Int: IntConvertible, Sortable {
//    public func toInt() -> Int {
//        return self
//    }
//}
//
//////////////////////////////////////
// MARK: Playing code
//////////////////////////////////////

//let input = [1, 2, 4, 6, 10, 5]
//var buckets = [Bucket<Int>(capacity: 15), Bucket<Int>(capacity: 15), Bucket<Int>(capacity: 15)]
//
//let sortedElements = bucketSort(input, distributor: RangeDistributor(), sorter: InsertionSorter(), buckets: buckets)
//
//print(sortedElements)
