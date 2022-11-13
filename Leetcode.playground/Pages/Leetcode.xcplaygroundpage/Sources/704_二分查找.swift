/**
 https://leetcode.cn/problems/binary-search/
 
 给定一个 n 个元素有序的（升序）整型数组 nums 和一个目标值 target  ，写一个函数搜索 nums 中的 target，如果目标值存在返回下标，否则返回 -1。


 示例 1:

 输入: nums = [-1,0,3,5,9,12], target = 9
 输出: 4
 解释: 9 出现在 nums 中并且下标为 4
 示例 2:

 输入: nums = [-1,0,3,5,9,12], target = 2
 输出: -1
 解释: 2 不存在 nums 中因此返回 -1
  

 提示：

 你可以假设 nums 中的所有元素是不重复的。
 n 将在 [1, 10000]之间。
 nums 的每个元素都将在 [-9999, 9999]之间。


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/binary-search
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
// import XCTest

public class _704_二分查找 {
    //class Solution {
    public init() {}
    
    public func search(_ nums: [Int], _ target: Int) -> Int {
        var L = 0
        var R = nums.count - 1
        
        while L <= R {
            let M = L + (R - L) >> 1
            if nums[M] == target {
                return M
            } else if nums[M] < target {
                L = M + 1
            } else if nums[M] > target {
                R = M - 1
            }
        }
        
        return -1
    }
}

extension _704_二分查找 {
    public func test() {
        let testTime = 10
        var isSucceed = true
        let min = 1
        let max = 100
        let count = 10
        for _ in 0..<testTime {
            let nums = Int.random(count: count, min: min, max: max)
            let target = Int.random(in: 0...10)
            
            /// 方法一
            let result1 = search(nums, target)

            /// 待验证的：方法二
            let result2 = search(nums, target)

            if result1 != result2 {
                isSucceed = false
                print("numbers = \(nums)")
                break
            }
        }

        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }

}

//do {
//    let s = _704_二分查找()
//
//    let result1 = s.search([-1,0,3,5,9,12], 9)
//    assert(result1 == 4)
//    print(result1)
//
//    let result2 = s.search([-1,0,3,5,9,12], 2)
//    assert(result2 == -1)
//    print(result2)
//
//    /// 对数器测试
//    s.test()
//}


//: [Next](@next)
