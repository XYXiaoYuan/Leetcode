/**
 https://leetcode.cn/problems/count-number-of-distinct-integers-after-reverse-operations/
 
 给你一个由 正 整数组成的数组 nums 。

 你必须取出数组中的每个整数，反转其中每个数位，并将反转后得到的数字添加到数组的末尾。这一操作只针对 nums 中原有的整数执行。

 返回结果数组中 不同 整数的数目。

  

 示例 1：

 输入：nums = [1,13,10,12,31]
 输出：6
 解释：反转每个数字后，结果数组是 [1,13,10,12,31,1,31,1,21,13] 。
 反转后得到的数字添加到数组的末尾并按斜体加粗表示。注意对于整数 10 ，反转之后会变成 01 ，即 1 。
 数组中不同整数的数目为 6（数字 1、10、12、13、21 和 31）。
 示例 2：

 输入：nums = [2,2,2]
 输出：1
 解释：反转每个数字后，结果数组是 [2,2,2,2,2,2] 。
 数组中不同整数的数目为 1（数字 2）。
  

 提示：

 1 <= nums.length <= 105
 1 <= nums[i] <= 106


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/count-number-of-distinct-integers-after-reverse-operations
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

 */

import Foundation
import Darwin
// import XCTest

public class _6205_反转之后不同整数的数目 {
    //class Solution {
    public init() {}
    
    /// 暴力字符串反转 + Set去重处理
    public func countDistinctIntegers(_ nums: [Int]) -> Int {
        var set = Set<Int>()
        for num in nums {
            /// 加入当前数字
            set.insert(num)
            
            let reversed = String(num).reversed().map { String($0) }.joined()
            if let reversedNum = Int(reversed) {
//                print("\(num), reversedNum = \(reversedNum)")
                /// 加入反转后的数字
                set.insert(reversedNum)
            }
        }
        return set.count
    }
    
    /// 暴力分解 + Set去重处理
    public func countDistinctIntegers0(_ nums: [Int]) -> Int {
        var set = Set<Int>()
        for num in nums {
            /// 加入当前数字
            set.insert(num)
            
            let reversed = itoa(num)
//            print("\(num), reversed = \(reversed)")
            /// 加入反转后的数字
            set.insert(reversed)
        }
        return set.count
    }
    
    /// 分解一个数的每位数
    /// - Parameter number: 传进来的数字
    /// - Returns: 一个数的 每位数 逆序数字
    private func itoa(_ number: Int) -> Int {
        var value = number
        
        var result: Int = 0
        while value != 0 {
            let newResult = result * 10 + value % 10
            result = newResult
            value /= 10
        }
        
        return result
    }
}

extension _6205_反转之后不同整数的数目 {
    public static func test() {
        let testTime = 5
        var isSucceed = true
        let min = 1
        let max = 1000000
        for _ in 0..<testTime {
            let count = Int.random(in: 1...100000)
            let nums = Int.random(count: count, min: min, max: max)
            let s = _6205_反转之后不同整数的数目()
            /// 方法一
            let result = s.countDistinctIntegers0(nums)

            /// 待验证的：方法二
            let result1 = s.countDistinctIntegers(nums)

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
//    let s = _6205_反转之后不同整数的数目()
//    let result1 = s.countDistinctIntegers([1,13,10,12,31])
//    assert(result1 == 6)
//
//    let result2 = s.countDistinctIntegers([2,2,2])
//    assert(result2 == 1)
//
//    print("\(s) result1 = \(result1) ---- result2 = \(result2)")
//
//    /// 对数器测试
//    _6205_反转之后不同整数的数目.test()
//}

//: [Next](@next)
