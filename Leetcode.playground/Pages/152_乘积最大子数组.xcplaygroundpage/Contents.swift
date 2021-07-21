/**
 https://leetcode-cn.com/problems/maximum-product-subarray/
 
 给你一个整数数组 nums ，请你找出数组中乘积最大的连续子数组（该子数组中至少包含一个数字），并返回该子数组所对应的乘积。

  

 示例 1:

 输入: [2,3,-2,4]
 输出: 6
 解释: 子数组 [2,3] 有最大乘积 6。
 示例 2:

 输入: [-2,0,-1]
 输出: 0
 解释: 结果不能为 2, 因为 [-2,-1] 不是子数组。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/maximum-product-subarray
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var maxF = nums[0], minF = nums[0], ans = nums[0]
        let length = nums.count
        for i in 1..<length {
            let mx = maxF, mn = minF
            maxF = max(mx * nums[i], max(nums[i], mn * nums[i]))
            minF = min(mn * nums[i], min(nums[i], mx * nums[i]))
            ans = max(maxF, ans)
        }
        return ans;
    }
}

let s = Solution()
let result = s.maxProduct([-2])
print(result)

//assert(s.maxProduct([2,3,-2,4]) == 6)
//assert(s.maxProduct([-2,0,-1]) == 0)
//assert(s.maxProduct([-3,-1,-1]) == 3)
//assert(s.maxProduct([-2,3,-4]) == 24)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

