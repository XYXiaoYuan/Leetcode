/**
 https://leetcode.cn/problems/largest-positive-integer-that-exists-with-its-negative/
 
 给你一个 不包含 任何零的整数数组 nums ，找出自身与对应的负数都在数组中存在的最大正整数 k 。

 返回正整数 k ，如果不存在这样的整数，返回 -1 。

  

 示例 1：

 输入：nums = [-1,2,-3,3]
 输出：3
 解释：3 是数组中唯一一个满足题目要求的 k 。
 示例 2：

 输入：nums = [-1,10,6,7,-7,1]
 输出：7
 解释：数组中存在 1 和 7 对应的负数，7 的值更大。
 示例 3：

 输入：nums = [-10,8,6,7,-2,-3]
 输出：-1
 解释：不存在满足题目要求的 k ，返回 -1 。
  

 提示：

 1 <= nums.length <= 1000
 -1000 <= nums[i] <= 1000
 nums[i] != 0

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/largest-positive-integer-that-exists-with-its-negative
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

 */

import Foundation
import Darwin
// import XCTest

public class _6204_与对应负数同时存在的最大正整数 {
    //class Solution {
    public init() {}
    
    public func findMaxK(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        
        var l = 0
        var r = nums.count - 1
        
        while l <= r {
            if nums[l]  + nums[r] == 0 {
                return abs(nums[l])
            } else if (nums[l] + nums[r] > 0) {
                r -= 1
            } else {
                l += 1
            }
        }
        
        return -1
    }
    
    public func findMaxK1(_ nums: [Int]) -> Int {
        var ans = -1
        var pairs = Set<Int>()
        for num in nums {
            if pairs.contains(-num){
                ans = max(ans, abs(num))
            }
            pairs.insert(num)
        }
        return ans
    }
    
    public func findMaxK0(_ nums: [Int]) -> Int {
        var pairs = [Int]()
        for num1 in nums {
            for num2 in nums {
                if (-num1 == num2) {
                    pairs.append(num2)
                }
            }
        }
        return pairs.isEmpty ? -1 : pairs.max() ?? -1
    }
}

extension _6204_与对应负数同时存在的最大正整数 {
    public static func test() {
        let testTime = 10
        var isSucceed = true
        let min = -1000
        let max = 1000
        for _ in 0..<testTime {
            let count = Int.random(in: 1...1000)
            let nums = Int.random(count: count, min: min, max: max)
            let s = _6204_与对应负数同时存在的最大正整数()
            /// 方法一
            let result = s.findMaxK0(nums)

            /// 待验证的：方法二
            let result1 = s.findMaxK1(nums)

            /// 待验证的：方法三
            let result2 = s.findMaxK(nums)

            if result != result1 || result != result2 {
                isSucceed = false
                print("startPos = \(nums), --- result = \(result)")
                break
            }
        }

        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}

//do {
//    let s = _6204_与对应负数同时存在的最大正整数()
//    let result1 = s.findMaxK([-1,2,-3,3])
//    assert(result1 == 3)
//    
//    let result2 = s.findMaxK([-1,10,6,7,-7,1])
//    assert(result2 == 7)
//
//    let result3 = s.findMaxK([-10,8,6,7,-2,-3])
//    assert(result3 == -1)
//
//    print("\(s) result1 = \(result1) ---- result2 = \(result2) ---- result3 = \(result3)")
//    
//    /// 对数器测试
//    _6204_与对应负数同时存在的最大正整数.test()
//}

//: [Next](@next)
