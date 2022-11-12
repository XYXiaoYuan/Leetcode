/**
 https://leetcode.cn/problems/target-sum/?favorite=2cktkvj
 
 给你一个整数数组 nums 和一个整数 target 。

 向数组中的每个整数前添加 '+' 或 '-' ，然后串联起所有整数，可以构造一个 表达式 ：

 例如，nums = [2, 1] ，可以在 2 之前添加 '+' ，在 1 之前添加 '-' ，然后串联起来得到表达式 "+2-1" 。
 返回可以通过上述方法构造的、运算结果等于 target 的不同 表达式 的数目。

  

 示例 1：

 输入：nums = [1,1,1,1,1], target = 3
 输出：5
 解释：一共有 5 种方法让最终目标和为 3 。
 -1 + 1 + 1 + 1 + 1 = 3
 +1 - 1 + 1 + 1 + 1 = 3
 +1 + 1 - 1 + 1 + 1 = 3
 +1 + 1 + 1 - 1 + 1 = 3
 +1 + 1 + 1 + 1 - 1 = 3
 示例 2：

 输入：nums = [1], target = 1
 输出：1
  

 提示：

 1 <= nums.length <= 20
 0 <= nums[i] <= 1000
 0 <= sum(nums[i]) <= 1000
 -1000 <= target <= 1000


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/target-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

 */

import Foundation
import Darwin
// import XCTest

public class _494_目标和 {
    //class Solution {
    public init() {}
    
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        let sum = nums.reduce(0, { $0 + $1 })
        // 这两种情况，不可能存在合法的子集划分
        if (sum < Swift.abs(target) || (sum + target) % 2 == 1) {
            return 0
        }
        return subsets(nums, (sum + target) / 2);
    }

    private func subsets(_ nums: [Int], _ sum: Int) -> Int {
        let n = nums.count
        var dp = [Int].init(repeating: 0, count: sum + 1)
        // base case
        dp[0] = 1
        
        for i in 1...n {
            // j 要从后往前遍历
            for j in stride(from: sum, through: 0, by: -1) {
                // 状态转移方程
                if (j >= nums[i - 1]) {
                    dp[j] = dp[j] + dp[j - nums[i - 1]]
                }
            }
        }

        return dp[sum]
    }
    
    private var memo = [String: Int]()
    
    func findTargetSumWays0(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else { return 0 }
        return dp(nums, 0, target)
    }
    
    private func dp(_ nums: [Int], _ i: Int, _ remain: Int) -> Int {
        /// base case
        if i == nums.count {
            return remain == 0 ? 1 : 0;
        }
        
        /// 把它俩转成字符串才能作为哈希表的key
        let key = "\(i)$\(remain)"
        /// 避免重复计算
        if let v = memo[key] {
            return v
        }
        /// 还是穷举
        let result = dp(nums, i + 1, remain - nums[i]) + dp(nums, i + 1, remain + nums[i])
        /// 记入备忘录
        memo[key] = result

        return result
    }
}

extension _494_目标和 {
    public static func test() {
        let testTime = 100
        var isSucceed = true
        for _ in 0..<testTime {
            let count = Int.random(in: 0...20)
            let nums = Int.random(count: count, min: 0, max: 1000)
            let k = Int.random(in: -1000...1000)
            let s = _494_目标和()
            /// 方法一
            let result = s.findTargetSumWays0(nums, k)

            /// 待验证的：方法二
            let result1 = s.findTargetSumWays(nums, k)

            if result != result1 {
                isSucceed = false
                print("startPos = \(nums), --- result = \(result)")
                break
            }
        }

        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}

//do {
//    let s = _494_目标和()
//    let result1 = s.findTargetSumWays([1,1,1,1,1], 3)
//    assert(result1 == 5)
//
//    let result2 = s.findTargetSumWays([1], 1)
//    assert(result2 == 1)
//
//    print("\(s) result1 = \(result1) ---- result2 = \(result2)")
//
//    /// 对数器测试
//    _494_目标和.test()
//}

//: [Next](@next)
