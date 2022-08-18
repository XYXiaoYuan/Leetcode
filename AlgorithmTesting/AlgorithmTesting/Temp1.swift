/**
 https://leetcode.cn/contest/weekly-contest-306/problems/construct-smallest-number-from-di-string/

 给你下标从 0 开始、长度为 n 的字符串 pattern ，它包含两种字符，'I' 表示 上升 ，'D' 表示 下降 。

 你需要构造一个下标从 0 开始长度为 n + 1 的字符串，且它要满足以下条件：

 num 包含数字 '1' 到 '9' ，其中每个数字 至多 使用一次。
 如果 pattern[i] == 'I' ，那么 num[i] < num[i + 1] 。
 如果 pattern[i] == 'D' ，那么 num[i] > num[i + 1] 。
 请你返回满足上述条件字典序 最小 的字符串 num。

  

 示例 1：

 输入：pattern = "IIIDIDDD"
 输出："123549876"
 解释：
 下标 0 ，1 ，2 和 4 处，我们需要使 num[i] < num[i+1] 。
 下标 3 ，5 ，6 和 7 处，我们需要使 num[i] > num[i+1] 。
 一些可能的 num 的值为 "245639871" ，"135749862" 和 "123849765" 。
 "123549876" 是满足条件最小的数字。
 注意，"123414321" 不是可行解因为数字 '1' 使用次数超过 1 次。
 示例 2：

 输入：pattern = "DDD"
 输出："4321"
 解释：
 一些可能的 num 的值为 "9876" ，"7321" 和 "8742" 。
 "4321" 是满足条件最小的数字。
  

 提示：

 1 <= pattern.length <= 8
 pattern 只包含字符 'I' 和 'D' 。
 */

import Foundation
import Darwin
// import XCTest

public class _6150_根据模式串构造最小数字 {
    //class Solution {
    public init() {}

    public func smallestNumber(_ pattern: String) -> String {
        let pattern = pattern.map { String($0) }
        let n = pattern.count
        var ans = (1...n+1).map { $0 }
        
        print(ans)
        
        var i = 0
        while i < n {
            if pattern[i] == "I" {
                i += 1
                continue
            }
            
            let i0 = i
            i += 1
            while i < n, pattern[i] == "D" {
                i += 1
            }

            
            var j = i0, k = i
            while j < i + 1 || k > i0 {
                print("i = \(i) --- j = \(j) --- k = \(k)")
//                var a = ans[j], b = ans[k]
//                swap(&a, &b)
                let tmp = ans[j]
                ans[j] = ans[k]
                ans[k] = tmp
//                (ans[j], ans[k]) = (ans[k], ans[j])
//                exchangeValue(&ans, j, k)
                j += 1
                k -= 1
                print("xxx ans = \(ans)")
            }
        }
        
//        print(ans)
        
        return ""
    }
    
    private func exchangeValue<T>(_ nums: inout [T], _ a: Int, _ b: Int) {
        (nums[a], nums[b]) = (nums[b], nums[a])
    }

    func countSpecialNumbers(_ n: Int) -> Int {
        var res = 0
        for i in 1...n {
            let nums = itoa(i)
            if nums.count == String(i).count {
                res += 1
            }
        }
        return res
    }
    
    /// 分解一个数的每位数
    /// - Parameter number: 传进来的数字
    /// - Returns: 一个数的 每位数 逆序数字数组
    private func itoa(_ number: Int) -> Set<Int> {
        var n = number
        
        var result = Set<Int>()
        while n >= 10 {
            result.insert(n % 10)
            n /= 10
        }
        result.insert(n)
        
        return result
    }
}

extension _6150_根据模式串构造最小数字 {
    public func test() {
        let testTime = 1
        var isSucceed = true
        for _ in 0..<testTime {
            var pattern = ""
            let count = Int.random(in: 1...8)
            for _ in 0..<count {
                pattern.append(Bool.random() ? "D" : "I")
            }

            /// 方法一
            let result1 = smallestNumber(pattern)

            /// 待验证的：方法二
            let result2 = smallestNumber(pattern)

            if result1 != result2 {
                isSucceed = false
                print("nums = \(pattern)")
                break
            }
        }

        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }

}

//do {
//    let s = _6150_根据模式串构造最小数字()
//
//    let result1 = s.smallestNumber("IIIDIDDD")
////    assert(result1 == 123549876)
//    print(result1)
//
////    let result2 = s.smallestNumber("DDD")
////    assert(result2 == 4321)
////    print(result2)
//
////    print(s.countSpecialNumbers(20))
////    print(s.countSpecialNumbers(5))
////    print(s.countSpecialNumbers(135))
//
//    /// 对数器测试
////    s.test()
//}

//: [Next](@next)
