/**
 https://leetcode.cn/problems/count-sorted-vowel-strings/
 
 给你一个整数 n，请返回长度为 n 、仅由元音 (a, e, i, o, u) 组成且按 字典序排列 的字符串数量。

 字符串 s 按 字典序排列 需要满足：对于所有有效的 i，s[i] 在字母表中的位置总是与 s[i+1] 相同或在 s[i+1] 之前。

  

 示例 1：

 输入：n = 1
 输出：5
 解释：仅由元音组成的 5 个字典序字符串为 ["a","e","i","o","u"]
 示例 2：

 输入：n = 2
 输出：15
 解释：仅由元音组成的 15 个字典序字符串为
 ["aa","ae","ai","ao","au","ee","ei","eo","eu","ii","io","iu","oo","ou","uu"]
 注意，"ea" 不是符合题意的字符串，因为 'e' 在字母表中的位置比 'a' 靠后
 示例 3：

 输入：n = 33
 输出：66045


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/count-sorted-vowel-strings
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。 */

import Foundation
import Darwin
// import XCTest

public class _1641_统计字典序元音字符串的数目 {
    //class Solution {
    public init() {}

    public func countVowelStrings1(_ n: Int) -> Int {
        return (n + 1) * (n + 2) * (n + 3) * (n + 4) / 24
    }
    
    public func countVowelStrings(_ n: Int) -> Int {
        var a = 1, e = 1, i = 1, o = 1, u = 1
        for _ in 2..<(n + 1) {
            u = a + e + i + o + u
            o = a + e + i + o
            i = a + e + i
            e = a + e
        }
        return a + e + i + o + u
    }
}

extension _1641_统计字典序元音字符串的数目 {
    public func test() {
        var isSucceed = true
        for n in 1...50 {
            /// 方法一
            let result = countVowelStrings(n)

            /// 待验证的：方法二
            let result1 = countVowelStrings1(n)

            if result != result1 {
                isSucceed = false
                print("n = \(n) --- result = \(result)")
                break
            }
        }

        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}

//do {
//    let s = _1641_统计字典序元音字符串的数目()
//    let result1 = s.countVowelStrings(1)
//    assert(result1 == 5)
//    let result2 = s.countVowelStrings(2)
//    assert(result2 == 15)
//    let result3 = s.countVowelStrings(33)
//    assert(result3 == 66045)
//
//    print("\(s) result1 = \(result1) ---- result2 = \(result2) ---- result3 = \(result3)")
//
//    /// 对数器测试
//    s.test()
//}

//: [Next](@next)
