/**
 https://leetcode.cn/problems/container-with-most-water/
 
 给定一个长度为 n 的整数数组 height 。有 n 条垂线，第 i 条线的两个端点是 (i, 0) 和 (i, height[i]) 。
 
 找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
 
 返回容器可以储存的最大水量。
 
 说明：你不能倾斜容器。
 
  
 
 示例 1：
 
 
 
 输入：[1,8,6,2,5,4,8,3,7]
 输出：49
 解释：图中垂直线代表输入数组 [1,8,6,2,5,4,8,3,7]。在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。
 示例 2：
 
 输入：height = [1,1]
 输出：1
  
 
 提示：
 
 n == height.length
 2 <= n <= 105
 0 <= height[i] <= 104
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/container-with-most-water
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
import XCTest

public class _11_盛最多水的容器 {
    //class Solution {
    public init() {}
    
    public func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var res = 0
        while left < right {
            let width = right - left
            let h = min(height[right], height[left])
            let size = width * h
            
            // 更新最大面积
            if size > res {
                res = size
            }
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        return res
    }
}

public extension _11_盛最多水的容器 {
    class Test: XCTestCase {
        var s = _11_盛最多水的容器()
        
        func testExample1() {
            let result = s.maxArea([1,8,6,2,5,4,8,3,7])
            print("\(s) --- \(result)")
            let answer = 49
            XCTAssertEqual(result, answer)
        }
        
        func testExample2() {
            let result = s.maxArea([1,1])
            print("\(s) --- \(result)")
            let answer = 1
            XCTAssertEqual(result, answer)
        }
    }
}

//do {
//    let s = _11_盛最多水的容器()
//    let result = s.maxArea([1,8,6,2,5,4,8,3,7])
//    print("\(s) --- \(result)")
//    let answer = 49
//    XCTAssertEqual(result, answer)
//
//    _11_盛最多水的容器.Test.defaultTestSuite.run()
//}
//


//: [Next](@next)
