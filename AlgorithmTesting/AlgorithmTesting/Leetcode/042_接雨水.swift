/**
 https://leetcode.cn/problems/trapping-rain-water/
 
 给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。

  

 示例 1：



 输入：height = [0,1,0,2,1,0,1,3,2,1,2,1]
 输出：6
 解释：上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。
 示例 2：

 输入：height = [4,2,0,3,2,5]
 输出：9
  

 提示：

 n == height.length
 1 <= n <= 2 * 104
 0 <= height[i] <= 105


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/trapping-rain-water
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

 */

import Foundation
import Darwin
// import XCTest

public class _42_接雨水 {
    //class Solution {
    public init() {}
    
    public func trap(_ height: [Int]) -> Int {
        if height.isEmpty || height.count < 2 {
            return 0
        }
        
        let N = height.count
        var L = 1
        var leftMax = height[0]
        var R = N - 2
        var rightMax = height[N - 1]
        var water = 0
        while L <= R {
            if leftMax <= rightMax {
                water += Swift.max(0, leftMax - height[L])
                leftMax = Swift.max(leftMax, height[L])
                L += 1
            } else {
                water += Swift.max(0, rightMax - height[R])
                rightMax = Swift.max(rightMax, height[R])
                R -= 1
            }
        }
        
        return water
    }


    
    /// 正确,但是效率不是最高的
    public func trap0(_ height: [Int]) -> Int {
        //        print("height          = \(height)")
        if height.isEmpty || height.count < 2 {
            return 0
        }
        
        let N = height.count
        var leftMaxs = [Int].init(repeating: 0, count: N)
        leftMaxs[0] = height[0]
        for i in 1..<N {
            leftMaxs[i] = Swift.max(leftMaxs[i - 1], height[i])
        }
        
        var rightMaxs = [Int].init(repeating: 0, count: N)
        rightMaxs[N - 1] = height[N - 1]
        for i in stride(from: N - 2, through: 0, by: -1) {
            rightMaxs[i] = Swift.max(rightMaxs[i + 1], height[i])
        }
        //        print("leftMaxHeights  = \(leftMaxH)\nrightMaxHeights = \(rightMaxH)")
        var water = 0
        for i in 1..<(N - 1) {
            water += Swift.max(Swift.min(leftMaxs[i - 1], rightMaxs[i + 1]) - height[i], 0)
        }
        return water
    }

}

extension _42_接雨水 {
    public static func test() {
        let testTime = 100
        var isSucceed = true
        for _ in 0..<testTime {
            let count = Int.random(in: 1...100)
            let nums = Int.random(count: count, min: 1, max: 10000)
            let s = _42_接雨水()
            /// 暴力方法
            let result = s.trap0(nums)

            /// 待验证的：方法
            let result1 = s.trap(nums)

            if result != result1 {
                isSucceed = false
                print("startPos = \(nums), --- result = \(result)\n, result1 = \(result1)")
                break
            }
        }

        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}

//do {
//    let s = _42_接雨水()
//    let result1 = s.trap([0,1,0,2,1,0,1,3,2,1,2,1])
//    assert(result1 == 6)
//
//    let result2 = s.trap([4,2,0,3,2,5])
//    assert(result2 == 9)
//
//    print("\(s) result1 = \(result1) ---- result2 = \(result2)")
//
//    /// 对数器测试
//    _42_接雨水.test()
//}

//: [Next](@next)
