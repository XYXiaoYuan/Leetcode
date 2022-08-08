///**
// https://leetcode.cn/problems/count-nice-pairs-in-an-array/
//
// 给你一个数组 nums ，数组中只包含非负整数。定义 rev(x) 的值为将整数 x 各个数字位反转得到的结果。比方说 rev(123) = 321 ， rev(120) = 21 。我们称满足下面条件的下标对 (i, j) 是 好的 ：
//
// 0 <= i < j < nums.length
// nums[i] + rev(nums[j]) == nums[j] + rev(nums[i])
// 请你返回好下标对的数目。由于结果可能会很大，请将结果对 109 + 7 取余 后返回。
//
//
//
// 示例 1：
//
// 输入：nums = [42,11,1,97]
// 输出：2
// 解释：两个坐标对为：
//  - (0,3)：42 + rev(97) = 42 + 79 = 121, 97 + rev(42) = 97 + 24 = 121 。
//  - (1,2)：11 + rev(1) = 11 + 1 = 12, 1 + rev(11) = 1 + 11 = 12 。
// 示例 2：
//
// 输入：nums = [13,10,35,24,76]
// 输出：4
//
//
// 提示：
//
// 1 <= nums.length <= 105
// 0 <= nums[i] <= 109
//
//
// 来源：力扣（LeetCode）
// 链接：https://leetcode.cn/problems/count-nice-pairs-in-an-array
// 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
// */
//
//import Foundation
//import Darwin
//// import XCTest
//
//public class _1814_统计一个数组中好对子的数目 {
//    //class Solution {
//    public init() {}
//
//    private func rev(_ x: Int) -> Int {
//        let rawString = String(x)
//        let str = String(rawString.reversed())
//        return Int(str) ?? 0
//    }
//
//    //0 <= i < j < nums.length
//    //nums[i] + rev(nums[j]) == nums[j] + rev(nums[i])
//    public func countNicePairs(_ nums: [Int]) -> Int {
//        var dict = [Int: Int]()
//        let mod = 1000000007
//        var ans = 0
//
//        for i in nums {
//            dict[i - rev(i), default: 0] += 1
//        }
//
//        for (_, value) in dict {
//            ans += ((value - 1) * value) / 2
//            ans %=  mod
//        }
//
//        return ans
//    }
//
//    /// 正确，但是会超时
//    public func countNicePairs0(_ nums: [Int]) -> Int {
//        var ans = 0
//        let mod = 1000000007
//
//        for i in 0..<nums.count {
//            for j in 0..<nums.count {
//                if i < j, nums[i] + rev(nums[j]) == nums[j] + rev(nums[i]) {
//                    ans += 1
//                }
//            }
//        }
//
//        return ans % mod
//    }
//}
//
//extension _1814_统计一个数组中好对子的数目 {
//    public func test() {
//        let testTime = 10
//        var isSucceed = true
//        let min = 1
//        let max = 100
//        let count = 10
//        for _ in 0..<testTime {
//            let numbers = Int.random(count: count, min: min, max: max)
//
//            /// 方法一
//            let result1 = countNicePairs0(numbers)
//
//            /// 待验证的：方法二
//            let result2 = countNicePairs(numbers)
//
//            if result1 != result2 {
//                isSucceed = false
//                print("numbers = \(numbers)")
//                break
//            }
//        }
//
//        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
//    }
//
//}
//
//do {
//    let s = _1814_统计一个数组中好对子的数目()
//
//    let result1 = s.countNicePairs0([42,11,1,97])
//    assert(result1 == 2)
//    print(result1)
//
//    let result2 = s.countNicePairs0([13,10,35,24,76])
//    assert(result2 == 4)
//    print(result2)
//
//    /// 对数器测试
//    s.test()
//}
//
////: [Next](@next)
