/**
 https://leetcode.cn/problems/sliding-window-maximum/
 
 给你一个整数数组 nums，有一个大小为 k 的滑动窗口从数组的最左侧移动到数组的最右侧。你只可以看到在滑动窗口内的 k 个数字。滑动窗口每次只向右移动一位。

 返回 滑动窗口中的最大值 。

  

 示例 1：

 输入：nums = [1,3,-1,-3,5,3,6,7], k = 3
 输出：[3,3,5,5,6,7]
 解释：
 滑动窗口的位置                最大值
 ---------------               -----
 [1  3  -1] -3  5  3  6  7       3
  1 [3  -1  -3] 5  3  6  7       3
  1  3 [-1  -3  5] 3  6  7       5
  1  3  -1 [-3  5  3] 6  7       5
  1  3  -1  -3 [5  3  6] 7       6
  1  3  -1  -3  5 [3  6  7]      7
 示例 2：

 输入：nums = [1], k = 1
 输出：[1]
  

 提示：

 1 <= nums.length <= 105
 -104 <= nums[i] <= 104
 1 <= k <= nums.length


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/sliding-window-maximum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

 */

import Foundation
import Darwin
// import XCTest

public class _239_滑动窗口最大值 {
    //class Solution {
    public init() {}
    
    public func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count
        var prefixMax = [Int].init(repeating: 0, count: n)
        var suffixMax = [Int].init(repeating: 0, count: n)
        for i in 0..<n {
            if (i % k == 0) {
                prefixMax[i] = nums[i]
            } else {
                prefixMax[i] = Swift.max(prefixMax[i - 1], nums[i])
            }
        }
        for i in stride(from: n - 1, through: 0, by: -1) {
            if (i == n - 1 || (i + 1) % k == 0) {
                suffixMax[i] = nums[i]
            } else {
                suffixMax[i] = Swift.max(suffixMax[i + 1], nums[i])
            }
        }

        var ans = [Int].init(repeating: 0, count: n - k + 1)
        for i in 0...(n - k) {
            ans[i] = Swift.max(suffixMax[i], prefixMax[i + k - 1])
        }
        return ans
    }
}

extension _239_滑动窗口最大值 {
    public static func test() {
        let testTime = 5
        var isSucceed = true
        let min = 0
        let max = 100000
        for _ in 0..<testTime {
            let nums = Int.random(count: 6, min: -10, max: 10)
            let k = Int.random(in: 1...4)
            let s = _239_滑动窗口最大值()
            /// 方法一
            let result = s.maxSlidingWindow(nums, k)

            /// 待验证的：方法二
            let result1 = s.maxSlidingWindow(nums, k)

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
//    let s = _239_滑动窗口最大值()
//    let result1 = s.maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3)
//    assert(result1 == [3,3,5,5,6,7])
//
//    let result2 = s.maxSlidingWindow([1], 1)
//    assert(result2 == [1])
//
//    print("\(s) result1 = \(result1) ---- result2 = \(result2)")
//
//    /// 对数器测试
//    _239_滑动窗口最大值.test()
//}

//: [Next](@next)
