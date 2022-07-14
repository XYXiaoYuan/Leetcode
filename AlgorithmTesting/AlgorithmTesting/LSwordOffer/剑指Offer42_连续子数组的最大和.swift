//: [Previous](@previous)

/// https://leetcode-cn.com/problems/lian-xu-zi-shu-zu-de-zui-da-he-lcof/

/**
 输入一个整型数组，数组中的一个或连续多个整数组成一个子数组。求所有子数组的和的最大值。

 要求时间复杂度为O(n)。

  

 示例1:

 输入: nums = [-2,1,-3,4,-1,2,1,-5,4]
 输出: 6
 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
  

 提示：

 1 <= arr.length <= 10^5
 -100 <= arr[i] <= 100


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/lian-xu-zi-shu-zu-de-zui-da-he-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _剑指Offer42_连续子数组的最大和 {
//class Solution {
    public init() {}
    
    public func maxSubArray(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }

        // dp[i]是以 nums[i]结尾的最大连续子序列和
        var dp: [Int] = [Int].init(repeating: 0, count: nums.count)
        dp[0] = nums[0]
        var maxValue = dp[0]
        
        for i in 1..<dp.count {
            // 状态转移方程
            if dp[i - 1] <= 0 {
                dp[i] = nums[i]
            } else {
                dp[i] = dp[i - 1] + nums[i]
            }
            maxValue = max(dp[i], maxValue)
            
//            print("dp[\(i)] = \(dp[i])")
        }

        return maxValue
    }
}

//let s = _剑指Offer42_连续子数组的最大和()
//let result = s.maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
//print("结果result = \(result)")


//: [Next](@next)
