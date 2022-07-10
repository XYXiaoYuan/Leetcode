import UIKit
import Darwin

enum Sort: String, CaseIterable {
    case bubble0 = "冒泡0"
    case bubble1 = "冒泡1"
    case selection = "选择"
    case insertion = "插入"
    case shell = "希尔"
    case merge = "归并"
    case quick = "快速"
    case heap = "堆"
    case counting = "计数"
    case radix = "基数"
}

extension Sort {
    func sortArr(_ arr: [Int]) -> [Int] {
        switch self {
        case .bubble0:
            return bubbleSort(arr)
        case .bubble1:
            return bubbleSort1(arr)
        case .selection:
            return selectionSort(arr)
        case .insertion:
            return insertionSort(arr)
        case .shell:
            return shellSort(arr)
        case .merge:
            return mergeSort(arr)
        case .quick:
            return quickSort(arr)
        case .heap:
            return heapSort(arr, <)
        case .counting:
            return countingSort(arr)
        case .radix:
            return radixSort(arr)
//        default:
//            return arr.sorted()
        }
    }
}

class Task {
    private let tasks1: [Sort] = [
//        .bubble0,
//        .bubble1,
//        .selection,
//        .insertion,
//        .shell,
//        .merge,
        .quick,
//        .heap,
//        .counting,
//        .radix,
    ]

    private let tasks: [Sort] = Sort.allCases
    
    func doTasks() {
        for sort in tasks1 {
            Times.test(title: "\(sort.rawValue)排序") { [weak self] in
                guard let `self` = self else { return }
                self.testSort(sort: sort)
            }
        }
        print("All Sorts Done!!! ✨✨✨")
    }

    /// 对数器
    private func testSort(sort: Sort) {
        let testTime = 10
        let minValue = 0
        let maxValue = 100
        var isSucceed = true
        for _ in 0..<testTime {
            let count = Int.random(in: 5...50)
            let randomArr = Int.random(count: count, min: minValue, max: maxValue)
            let sortedArr = randomArr.sorted()
            print("count = \(count) --- randomArr = \(randomArr) --- sortedArr = \(sortedArr)")
            let copyArr = sortedArr.compactMap { $0 }
            let bubbleSortedArr = bubbleSort(copyArr)
            if !sortedArr.isEqual(bubbleSortedArr) {
                isSucceed = false
                sortedArr.printArray()
                bubbleSortedArr.printArray()
                break
            }
        }
        
        print("process [\(sort.rawValue)] \(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}

let s = Task()
s.doTasks()
