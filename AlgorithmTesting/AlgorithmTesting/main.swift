///**
// https://leetcode.cn/problems/minimum-value-to-get-positive-step-by-step-sum/
//
// 给你一个整数数组 nums 。你可以选定任意的 正数 startValue 作为初始值。
//
// 你需要从左到右遍历 nums 数组，并将 startValue 依次累加上 nums 数组中的值。
//
// 请你在确保累加和始终大于等于 1 的前提下，选出一个最小的 正数 作为 startValue 。
//
//  
//
// 示例 1：
//
// 输入：nums = [-3,2,-3,4,2]
// 输出：5
// 解释：如果你选择 startValue = 4，在第三次累加时，和小于 1 。
//                 累加求和
//                 startValue = 4 | startValue = 5 | nums
//                   (4 -3 ) = 1  | (5 -3 ) = 2    |  -3
//                   (1 +2 ) = 3  | (2 +2 ) = 4    |   2
//                   (3 -3 ) = 0  | (4 -3 ) = 1    |  -3
//                   (0 +4 ) = 4  | (1 +4 ) = 5    |   4
//                   (4 +2 ) = 6  | (5 +2 ) = 7    |   2
// 示例 2：
//
// 输入：nums = [1,2]
// 输出：1
// 解释：最小的 startValue 需要是正数。
// 示例 3：
//
// 输入：nums = [1,-2,-3]
// 输出：5
//  
//
// 提示：
//
// 1 <= nums.length <= 100
// -100 <= nums[i] <= 100
//
//
// 来源：力扣（LeetCode）
// 链接：https://leetcode.cn/problems/minimum-value-to-get-positive-step-by-step-sum
// 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
// */
//
//import Foundation
//import Darwin
//// import XCTest
//
//public class _1413_逐步求和得到正数的最小值 {
//    //class Solution {
//    public init() {}
//
//    /**
//     由于 startValue 可设定的最小值为 1，我们可以先统计当 startValue = 1 时，累加过程中的最小值 min。
//
//     根据 min 是否符合规定（大于等于 1）来决定如何调整：
//
//     若 min 满足大于等于 1，则 startValue 可取最小值 1；
//     若 min 不满足大于等于 1，计算将 min 调整到 1 所需要的值（即 1 - min），将其累加到起始值上，即得答案 2 - min。
//     */
//    func minStartValue(_ nums: [Int]) -> Int {
//        print(nums)
//        var minValue = Int.max
//        var i = 0, sum = 1
//        while i < nums.count {
//            sum += nums[i]
//            minValue = min(minValue, sum)
//            print("minValue = \(minValue), nums[i] = \(nums[i]), -- sum = \(sum), i = \(i)")
//            i += 1
//        }
//        print("--------------------------------------------------")
//        return minValue < 1 ? 2 - minValue : 1
//    }
//}
//
//extension _1413_逐步求和得到正数的最小值 {
//    public func test() {
//        let testTime = 10
//        var isSucceed = true
//        let min = -100
//        let max = 100
//        let count = Int.random(in: 1...100)
//        for _ in 0..<testTime {
//            let nums = Int.random(count: count, min: min, max: max)
//            
//            /// 方法一
//            let result1 = minStartValue(nums)
//
//            /// 待验证的：方法二
//            let result2 = minStartValue(nums)
//
//            if result1 != result2 {
//                isSucceed = false
//                print("nums = \(nums)")
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
//    let s = _1413_逐步求和得到正数的最小值()
//
//    let result1 = s.minStartValue([-3,2,-3,4,2])
////    assert(result1 == 5)
//    print(result1)
//
//    let result2 = s.minStartValue([1,2])
////    assert(result2 == 1)
//    print(result2)
//
//    let result3 = s.minStartValue([1,-2,-3])
////    assert(result3 == 5)
//    print(result3)
//
//    /// 对数器测试
////    s.test()
//}
//
////: [Next](@next)
