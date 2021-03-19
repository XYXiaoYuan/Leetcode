//: [Previous](@previous)

/// https://leetcode-cn.com/problems/longest-increasing-subsequence/

/**
 给你一个整数数组 nums ，找到其中最长严格递增子序列的长度。

 子序列是由数组派生而来的序列，删除（或不删除）数组中的元素而不改变其余元素的顺序。例如，[3,6,2,7] 是数组 [0,3,1,6,2,2,7] 的子序列。

  
 示例 1：

 输入：nums = [10,9,2,5,3,7,101,18]
 输出：4
 解释：最长递增子序列是 [2,3,7,101]，因此长度为 4 。
 示例 2：

 输入：nums = [0,1,0,3,2,3]
 输出：4
 示例 3：

 输入：nums = [7,7,7,7,7,7,7]
 输出：1
  

 提示：

 1 <= nums.length <= 2500
 -10^4 <= nums[i] <= 10^4


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-increasing-subsequence
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        
        var dp: [Int] = [Int].init(repeating: 0, count: nums.count)
        dp[0] = 1
        var maxValue = 1
        for i in 1..<dp.count {
            dp[i] = 1
            for j in 0..<i {
                if nums[i] <= nums[j] {
                    continue
                }
                dp[i] = max(dp[i], dp[j] + 1)
            }
            maxValue = max(dp[i], maxValue)
        }
        
        return maxValue
    }
}

let s = Solution()
let result = s.lengthOfLIS([10,9,2,5,3,7,101,18])
print("结果result = \(result)")


//: [Next](@next)
