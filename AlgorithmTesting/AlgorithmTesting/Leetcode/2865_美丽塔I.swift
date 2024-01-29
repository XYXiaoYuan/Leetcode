/**
 
 https://leetcode.cn/problems/beautiful-towers-i/?envType=daily-question&envId=2024-01-24
 
 给你一个长度为 n 下标从 0 开始的整数数组 maxHeights 。

 你的任务是在坐标轴上建 n 座塔。第 i 座塔的下标为 i ，高度为 heights[i] 。

 如果以下条件满足，我们称这些塔是 美丽 的：

 1 <= heights[i] <= maxHeights[i]
 heights 是一个 山脉 数组。
 如果存在下标 i 满足以下条件，那么我们称数组 heights 是一个 山脉 数组：

 对于所有 0 < j <= i ，都有 heights[j - 1] <= heights[j]
 对于所有 i <= k < n - 1 ，都有 heights[k + 1] <= heights[k]
 请你返回满足 美丽塔 要求的方案中，高度和的最大值 。

  

 示例 1：

 输入：maxHeights = [5,3,4,1,1]
 输出：13
 解释：和最大的美丽塔方案为 heights = [5,3,3,1,1] ，这是一个美丽塔方案，因为：
 - 1 <= heights[i] <= maxHeights[i]
 - heights 是个山脉数组，峰值在 i = 0 处。
 13 是所有美丽塔方案中的最大高度和。
 示例 2：

 输入：maxHeights = [6,5,3,9,2,7]
 输出：22
 解释： 和最大的美丽塔方案为 heights = [3,3,3,9,2,2] ，这是一个美丽塔方案，因为：
 - 1 <= heights[i] <= maxHeights[i]
 - heights 是个山脉数组，峰值在 i = 3 处。
 22 是所有美丽塔方案中的最大高度和。
 示例 3：

 输入：maxHeights = [3,2,5,5,2,3]
 输出：18
 解释：和最大的美丽塔方案为 heights = [2,2,5,5,2,2] ，这是一个美丽塔方案，因为：
 - 1 <= heights[i] <= maxHeights[i]
 - heights 是个山脉数组，最大值在 i = 2 处。
 注意，在这个方案中，i = 3 也是一个峰值。
 18 是所有美丽塔方案中的最大高度和。
  

 提示：

 1 <= n == maxHeights <= 103
 1 <= maxHeights[i] <= 109

 */

import Foundation
import Darwin
// import XCTest
//[100, 18, 18, ]
public class _2865_美丽塔I {
    //class Solution {
    public init() {}
    
    public func maximumSumOfHeights1(_ maxHeights: [Int]) -> Int {
        let N = maxHeights.count
        var res = 0
        for i in 0..<N {
            var pre = maxHeights[i]
            var sum = pre
            for j in stride(from: i - 1, through: 0, by: -1) {
                print("遍历的值为\(maxHeights[i]), 左边 下标 = \(i) 要添加的数为 \(pre), res = \(sum + Swift.min(pre, maxHeights[j]))")
                pre = Swift.min(pre, maxHeights[j])
                sum += pre
            }
            
            var suf = maxHeights[i]
            for j in (i + 1)..<N {
                print("遍历的值为\(maxHeights[i]), 右边 下标 = \(i) 要添加的数为 \(suf), res = \(sum + Swift.min(suf, maxHeights[j]))")
                suf = Swift.min(suf, maxHeights[j])
                sum += suf
            }
            
            res = Swift.max(res, sum)
        }
        
        return res
    }

    
    public func maximumSumOfHeights(_ maxHeights: [Int]) -> Int {
        var maxPair = (index: 0, value: maxHeights[0])
        var pairList = [maxPair]
        let N = maxHeights.count
        for i in 1..<N {
            let v = maxHeights[i]
            if (maxPair.value <= v) {
                maxPair = (index: i, value: v)
                pairList.append(maxPair)
            }
        }
        
        var res = 0;
        for pair in pairList {
            let maxValue = getResWithPair(maxPair: pair, maxHeights)
            res = Swift.max(res, maxValue)
        }
        
        return res
    }
    
    private func getResWithPair(maxPair: (index: Int, value: Int), _ maxHeights: [Int]) -> Int {
        print("入参maxHeights \(maxHeights), maxPair index = \(maxPair.index), value = \(maxPair.value)")
        let N = maxHeights.count

        var res = maxPair.value
        let index = maxPair.index
        let leftIndex = index - 1
        if (leftIndex >= 0) {
            var pre = maxHeights[leftIndex]
            for i in stride(from: leftIndex, through: 0, by: -1) {
                pre = Swift.min(pre, maxHeights[i])
                print("遍历的值为\(maxHeights[i]), 左边 下标 = \(i) 要添加的数为 \(pre), res = \(res + pre)")
                res += pre
            }
        }
        
        let rightIndex = index + 1
        if (rightIndex < N) {
            var suf = maxHeights[rightIndex]
            for i in rightIndex..<N {
                suf = Swift.min(suf, maxHeights[i])
                print("遍历的值为\(maxHeights[i]), 右边 下标 = \(i) 要添加的数为 \(suf), res = \(res + suf)")
                res += suf
            }
        }
        
        return res
    }
}

extension _2865_美丽塔I {
    public func test() {
        let testTime = 10000
        print("对数器开始工作, 执行 【\(testTime)】 次")
        
        var isSucceed = true
        for i in 0..<testTime {
            let count = Int.random(in: 1...10)
            let nums = Int.random(count: count, min: 1, max: 100);
            
            let result0 = self.maximumSumOfHeights(nums)
            let result1 = self.maximumSumOfHeights1(nums)
            
            if result0 != result1 {
                isSucceed = false
                print("第 \(i + 1) 次测试失败, nums = \(nums), result = \(result1)")
                break
            } else {
                print("第 \(i + 1) 次测试成功, nums = \(nums), result = \(result1)")
            }
        }
        
        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}

//do {
//    let s = _2865_美丽塔I()
//
//    do {
//        let result = s.maximumSumOfHeights([100, 52, 18, 85, 87, 74, 18, 97, 76, 34])
////        assert(result == 372)
//        print(result)
//
//    }
//
//    do {
//        let result = s.maximumSumOfHeights1([100, 52, 18, 85, 87, 74, 18, 97, 76, 34])
////        assert(result == 372)
//        print(result)
//
//    }
//
//
//    do {
//        let result = s.maximumSumOfHeights([5,3,4,1,1])
//        assert(result == 13)
//        print(result)
//    }
//
//    do {
//        let result = s.maximumSumOfHeights([6,5,3,9,2,7])
//        assert(result == 22)
//        print(result)
//    }
//
//    do {
//        let result = s.maximumSumOfHeights([3,2,5,5,2,3])
//        assert(result == 18)
//        print(result)
//    }
//
//    do {
//
//        let result = s.maximumSumOfHeights([3,6,3,5,5,1,2,5,5,6])
//        assert(result == 24)
//        print(result)
//    }
//
//    do {
//        let result = s.maximumSumOfHeights([1000000000])
//        assert(result == 1000000000)
//        print(result)
//    }
//
//    do {
//        let result = s.maximumSumOfHeights([1,1000000000])
//        assert(result == 1000000001)
//        print(result)
//    }
//
//    do {
//        let result = s.maximumSumOfHeights([1000000000, 1])
//        assert(result == 1000000001)
//        print(result)
//    }
//
//    do {
//        let result = s.maximumSumOfHeights([1,5,2,5,6,4,6,3,4,5])
//        assert(result == 33)
//        print(result)
//    }
//
//
//    s.test()
//}


//: [Next](@next)
