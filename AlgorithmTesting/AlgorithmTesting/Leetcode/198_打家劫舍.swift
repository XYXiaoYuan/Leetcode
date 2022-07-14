//: [Previous](@previous)

/**
你是一个专业的小偷，计划偷窃沿街的房屋。每间房内都藏有一定的现金，影响你偷窃的唯一制约因素就是相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。

给定一个代表每个房屋存放金额的非负整数数组，计算你在不触动警报装置的情况下，能够偷窃到的最高金额。

示例 1:

输入: [1,2,3,1]
输出: 4
解释: 偷窃 1 号房屋 (金额 = 1) ，然后偷窃 3 号房屋 (金额 = 3)。
     偷窃到的最高金额 = 1 + 3 = 4 。
示例 2:

输入: [2,7,9,3,1]
输出: 12
解释: 偷窃 1 号房屋 (金额 = 2), 偷窃 3 号房屋 (金额 = 9)，接着偷窃 5 号房屋 (金额 = 1)。
     偷窃到的最高金额 = 2 + 9 + 1 = 12 。
*/


import Foundation

public class _198_打家劫舍 {
//class Solution {
    public init() {}
    public func rob(_ nums: [Int]) -> Int {
        if nums.count <= 0 {
            return 0
        }
        
        var first = 0, second = 0
        for i in 0..<nums.count {
            let temp = second
            second = max(nums[i] + first, second)
            first = temp
        }
        return second
    }
}

//let s = _198_打家劫舍()
//let result1 = s.rob([1,2,3,1]) // 4
//print(result1)
//
//let result2 = s.rob([2,7,9,3,1]) // 12
//print(result2)

//: [Next](@next)
