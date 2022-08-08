///**
// https://leetcode.cn/problems/count-number-of-bad-pairs/
//
// 给你一个下标从 0 开始的整数数组 nums 。如果 i < j 且 j - i != nums[j] - nums[i] ，那么我们称 (i, j) 是一个 坏数对 。
//
// 请你返回 nums 中 坏数对 的总数目。
//
//
//
// 示例 1：
//
// 输入：nums = [4,1,3,3]
// 输出：5
// 解释：数对 (0, 1) 是坏数对，因为 1 - 0 != 1 - 4 。
// 数对 (0, 2) 是坏数对，因为 2 - 0 != 3 - 4, 2 != -1 。
// 数对 (0, 3) 是坏数对，因为 3 - 0 != 3 - 4, 3 != -1 。
// 数对 (1, 2) 是坏数对，因为 2 - 1 != 3 - 1, 1 != 2 。
// 数对 (2, 3) 是坏数对，因为 3 - 2 != 3 - 3, 1 != 0 。
// 总共有 5 个坏数对，所以我们返回 5 。
// 示例 2：
//
// 输入：nums = [1,2,3,4,5]
// 输出：0
// 解释：没有坏数对。
//
//
// 提示：
//
// 1 <= nums.length <= 105
// 1 <= nums[i] <= 109
//
//
// 来源：力扣（LeetCode）
// 链接：https://leetcode.cn/problems/count-number-of-bad-pairs
// 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
// */
//
//import Foundation
//import Darwin
//// import XCTest
//
//public class _6142_统计坏数对的数目 {
//    //class Solution {
//    public init() {}
//
//    // j - i != num2 - num1
//    // j - num2 != i - num1
//    public func countBadPairs(_ nums: [Int]) -> Int {
//        var ans = 0
//
//        var map = [Int: Int]()
//        for i in 0..<nums.count {
//            let val = i - nums[i]
//            let same = map[val] ?? 0
//            ans += i - same
//            map[val] = same + 1
////            print("ans = \(ans), -- map \(map), 😆 -- val = \(val), -- same = \(same)")
//        }
//
//        return ans
//    }
//
//    /// 正确，但是会超时
//    public func countBadPairs0(_ nums: [Int]) -> Int {
//        var ans = 0
//
//        for (i, num1) in nums.enumerated() {
//            for (j, num2) in nums.enumerated() {
//                if i < j, j - i != num2 - num1 {
//                    ans += 1
//                }
//            }
//        }
//
//        return ans
//    }
//}
//
//extension _6142_统计坏数对的数目 {
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
//            let result1 = countBadPairs0(numbers)
//
//            /// 待验证的：方法二
//            let result2 = countBadPairs(numbers)
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
//    let s = _6142_统计坏数对的数目()
//
//    let result1 = s.countBadPairs([4,1,3,3])
//    assert(result1 == 5)
//    print(result1)
//
//    let result2 = s.countBadPairs([1,2,3,4,5])
//    assert(result2 == 0)
//    print(result2)
//
//    /// 对数器测试
////    s.test()
//}
//
////: [Next](@next)
