/**
 
 https://leetcode.cn/problems/maximum-subarray/description/?lang=pythondata?envType=daily-question&envId=2023-11-20
 
 给你一个整数数组 nums ，请你找出一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

 子数组 是数组中的一个连续部分。

  

 示例 1：

 输入：nums = [-2,1,-3,4,-1,2,1,-5,4]
 输出：6
 解释：连续子数组 [4,-1,2,1] 的和最大，为 6 。
 示例 2：

 输入：nums = [1]
 输出：1
 示例 3：

 输入：nums = [5,4,-1,7,8]
 输出：23
 
 
 提示：

 1 <= nums.length <= 105
 -104 <= nums[i] <= 104
 */

import Foundation
import Darwin
// import XCTest

public class _053_最大字数组和 {
    //class Solution {
    public init() {}
    
    public func maxSubArray(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }

        /// dp[i]是以 nums[i]结尾的最大连续子序列和
        var dp: [Int] = [Int].init(repeating: 0, count: nums.count)
        dp[0] = nums[0]
        var maxValue = dp[0]
        
        for i in 1..<dp.count {
            /// 状态转移方程
            if dp[i - 1] <= 0 {
                dp[i] = nums[i]
            } else {
                dp[i] = dp[i - 1] + nums[i]
            }
            maxValue = max(dp[i], maxValue)
            
//            print("dp[\(i)] = \(dp[i])", "maxValue = \(maxValue)")
        }

        return maxValue
    }
}

extension _053_最大字数组和 {
    public func test() {
        let testTime = 10000
        print("对数器开始工作, 执行 【\(testTime)】 次")
        
        var isSucceed = true
        for i in 0..<testTime {
            let n = Int.random(in: 1...50)
            let k = Int.random(in: 1...50)
            
            let count = Int.random(in: 1...10)
            let nums = Int.random(count: count, min: 1, max: 100);
            
            let result0 = self.maxSubArray(nums)
            let result1 = self.maxSubArray(nums)
            
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
//    let s = _053_最大字数组和()
//
//    let result1 = s.maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
//    //    assert(result1 == 6)
//    print(result1)
//
//    let result2 = s.maxSubArray([1])
//    //    assert(result2 == 1)
//    print(result2)
//
//    let result3 = s.maxSubArray([5,4,-1,7,8])
////    assert(result3 == 23)
//    print(result3)
//
//    //    s.test()
//}


//: [Next](@next)
