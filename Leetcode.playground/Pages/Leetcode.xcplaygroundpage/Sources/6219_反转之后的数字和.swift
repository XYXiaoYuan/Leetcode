/**
 https://leetcode.cn/problems/sum-of-number-and-its-reverse/
 
 给你一个 非负 整数 num 。如果存在某个 非负 整数 k 满足 k + reverse(k) = num  ，则返回 true ；否则，返回 false 。

 reverse(k) 表示 k 反转每个数位后得到的数字。

  

 示例 1：

 输入：num = 443
 输出：true
 解释：172 + 271 = 443 ，所以返回 true 。
 示例 2：

 输入：num = 63
 输出：false
 解释：63 不能表示为非负整数及其反转后数字之和，返回 false 。
 示例 3：

 输入：num = 181
 输出：true
 解释：140 + 041 = 181 ，所以返回 true 。注意，反转后的数字可能包含前导零。
  

 提示：

 0 <= num <= 105


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/sum-of-number-and-its-reverse
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

 */

import Foundation
import Darwin
// import XCTest

public class _6219_反转之后的数字和 {
    //class Solution {
    public init() {}
    
    public func sumOfNumberAndReverse(_ num: Int) -> Bool {
        return sumOfNumberAndReverse0(num)
    }
    
    /// 暴力
    public func sumOfNumberAndReverse0(_ num: Int) -> Bool {
        for i in 0...num where i + itoa(i) == num {
            return true
        }
        return false
    }
    
    /// 分解一个数的每位数
    /// - Parameter number: 传进来的数字
    /// - Returns: 一个数的 每位数 逆序数字
    private func itoa(_ number: Int) -> Int {
        var value = number
        
        var result: Int = 0
        while value != 0 {
            result = result * 10 + value % 10
            value /= 10
        }
        
        return result
    }
}

extension _6219_反转之后的数字和 {
    public static func test() {
        let testTime = 5
        var isSucceed = true
        let min = 0
        let max = 100000
        for _ in 0..<testTime {
            let nums = Int.random(in: min...max)
            let s = _6219_反转之后的数字和()
            /// 方法一
            let result = s.sumOfNumberAndReverse0(nums)

            /// 待验证的：方法二
            let result1 = s.sumOfNumberAndReverse(nums)

            if result != result1 {
                isSucceed = false
                print("startPos = \(nums), --- result = \(result)")
                break
            }
        }

        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}

do {
    let s = _6219_反转之后的数字和()
    let result1 = s.sumOfNumberAndReverse(443)
    assert(result1 == true)

    let result2 = s.sumOfNumberAndReverse(63)
    assert(result2 == false)

    let result3 = s.sumOfNumberAndReverse(181)
    assert(result3 == true)

    print("\(s) result1 = \(result1) ---- result2 = \(result2) ---- result3 = \(result3)")

    /// 对数器测试
    _6219_反转之后的数字和.test()
}

//: [Next](@next)
