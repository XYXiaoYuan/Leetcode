import UIKit

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

Times.test(title: "冒泡排序") {
    testBubbleSort()
}

Times.test(title: "冒泡排序1") {
    testBubbleSort1()
}

extension Int: IntConvertible, Sortable {
    public func toInt() -> Int {
        return self
    }
}

//////////////////////////////////////
// MARK: Playing code
//////////////////////////////////////

let input = [1, 2, 4, 6, 10, 5]
var buckets = [Bucket<Int>(capacity: 15), Bucket<Int>(capacity: 15), Bucket<Int>(capacity: 15)]

let sortedElements = bucketSort(input, distributor: RangeDistributor(), sorter: InsertionSorter(), buckets: buckets)

print(sortedElements)
