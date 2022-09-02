/**
 https://leetcode.cn/problems/valid-triangle-number/
 
 给定一个包含非负整数的数组 nums ，返回其中可以组成三角形三条边的三元组个数。

  

 示例 1:

 输入: nums = [2,2,3,4]
 输出: 3
 解释:有效的组合是:
 2,3,4 (使用第一个 2)
 2,3,4 (使用第二个 2)
 2,2,3
 示例 2:

 输入: nums = [4,2,3,4]
 输出: 4
  

 提示:

 1 <= nums.length <= 1000
 0 <= nums[i] <= 1000


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/valid-triangle-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
// import XCTest

public class _611_有效三角形的个数 {
    //class Solution {
    public init() {}

    public func triangleNumber1(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        let n = nums.count
        var ans = 0
        for i in 0..<n {
            var k = i
            for j in (i + 1)..<n {
                while k + 1 < n, nums[k + 1] < nums[i] + nums[j] {
                    k += 1
                }
                ans += max(k - j, 0)
            }
        }
        return ans
    }

    public func triangleNumber(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        let n = nums.count
        var ans = 0
        for i in 0..<n {
            var k = i
            for j in (i + 1)..<n {
                while k + 1 < n, nums[k + 1] < nums[i] + nums[j] {
                    k += 1
                }
                ans += max(k - j, 0)
            }
        }
        return ans
    }
}

extension _611_有效三角形的个数 {
    public func test() {
        let testTime = 10
        var isSucceed = true
        let min = 1
        let max = 100
        for _ in 0..<testTime {
            let count = Int.random(in: 3..<10)
            let nums = Int.random(count: count, min: min, max: max)
            /// 方法一
            let result = triangleNumber(nums)

            /// 待验证的：方法二
            let result1 = triangleNumber1(nums)

            if result != result1 {
                isSucceed = false
                print("nums = \(nums) --- result = \(result)")
                break
            }
        }

        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}

//do {
//    let s = _611_有效三角形的个数()
//    let result1 = s.triangleNumber([2,2,3,4])
//    assert(result1 == 3)
//    let result2 = s.triangleNumber([4,2,3,4])
//    assert(result2 == 4)
//
//    print("\(s) result1 = \(result1) ---- result2 = \(result2)")
//    
//    /// 对数器测试
////    s.test()
//}

//: [Next](@next)
