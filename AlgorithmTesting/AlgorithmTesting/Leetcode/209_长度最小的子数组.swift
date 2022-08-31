/**
 https://leetcode.cn/problems/minimum-size-subarray-sum/
 
 给定一个含有 n 个正整数的数组和一个正整数 target 。

 找出该数组中满足其和 ≥ target 的长度最小的 连续子数组 [numsl, numsl+1, ..., numsr-1, numsr] ，并返回其长度。如果不存在符合条件的子数组，返回 0 。

  

 示例 1：

 输入：target = 7, nums = [2,3,1,2,4,3]
 输出：2
 解释：子数组 [4,3] 是该条件下的长度最小的子数组。
 示例 2：

 输入：target = 4, nums = [1,4,4]
 输出：1
 示例 3：

 输入：target = 11, nums = [1,1,1,1,1,1,1,1]
 输出：0
  

 提示：

 1 <= target <= 109
 1 <= nums.length <= 105
 1 <= nums[i] <= 105
  

 进阶：

 如果你已经实现 O(n) 时间复杂度的解法, 请尝试设计一个 O(n log(n)) 时间复杂度的解法。


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/minimum-size-subarray-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
// import XCTest

public class _209_长度最小的子数组 {
    //class Solution {
    public init() {}

    // 滑动窗口
    public func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        let n = nums.count
        
        var ans = Int.max
        var start = 0, end = 0
        var sum = 0
        while end < n {
            sum += nums[end]
            while sum >= target {
                ans = min(ans, end - start + 1)
                sum -= nums[start]
                start += 1
            }
            end += 1
        }
        
        return ans == Int.max ? 0 : ans
    }

    public func minSubArrayLen1(_ target: Int, _ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        let n = nums.count
        
        var ans = Int.max
        for i in 0..<n {
            var sum = 0
            for j in i..<n {
                sum += nums[j]
                if sum >= target {
                    ans = min(ans, j - i + 1)
                    break
                }
            }
        }
        
        return ans == Int.max ? 0 : ans
    }
}

extension _209_长度最小的子数组 {
    public func test() {
        let testTime = 10
        var isSucceed = true
        let min = 1
        let max = 10
        for _ in 0..<testTime {
            let count = Int.random(in: min...max)
            let nums = Int.random(count: count, min: min, max: max)
            let target = Int.random(in: min..<max)
            
            /// 方法一
            let result = minSubArrayLen(target, nums)

            /// 待验证的：方法二
            let result1 = minSubArrayLen1(target, nums)

            if result != result1 {
                isSucceed = false
                print("nums = \(nums) --- target = \(target), result = \(result)")
                break
            }
        }

        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}


//do {
//    let s = _209_长度最小的子数组()
//    let result1 = s.minSubArrayLen(7, [2,3,1,2,4,3])
//    assert(result1 == 2)
//    let result2 = s.minSubArrayLen(4 ,[1,4,4])
//    assert(result2 == 1)
//    let result3 = s.minSubArrayLen(11 ,[1,1,1,1,1,1,1,1])
//    assert(result3 == 0)
//
//    print("\(s) result1 = \(result1) ---- result2 = \(result2) ---- result3 = \(result3)")
//    
//    /// 对数器测试
//    s.test()
//}

//: [Next](@next)
