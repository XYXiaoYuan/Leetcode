/**
 https://leetcode-cn.com/problems/contiguous-sequence-lcci/
 
 给定一个整数数组，找出总和最大的连续数列，并返回总和。

 示例：

 输入： [-2,1,-3,4,-1,2,1,-5,4]
 输出： 6
 解释： 连续子数组 [4,-1,2,1] 的和最大，为 6。
 进阶：

 如果你已经实现复杂度为 O(n) 的解法，尝试使用更为精妙的分治法求解。



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/contiguous-sequence-lcci
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }

        var dp = nums[0]
        var maxValue = dp

        for i in 1..<nums.count {
            dp = dp <= 0 ? nums[i] : dp + nums[i]
            maxValue = max(dp, maxValue)
        }

        return maxValue
    }
}
