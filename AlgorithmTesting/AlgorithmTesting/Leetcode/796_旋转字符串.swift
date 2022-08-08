/**
 https://leetcode.cn/problems/rotate-string/
 
 给定两个字符串, s 和 goal。如果在若干次旋转操作之后，s 能变成 goal ，那么返回 true 。

 s 的 旋转操作 就是将 s 最左边的字符移动到最右边。

 例如, 若 s = 'abcde'，在旋转一次之后结果就是'bcdea' 。
  

 示例 1:

 输入: s = "abcde", goal = "cdeab"
 输出: true
 示例 2:

 输入: s = "abcde", goal = "abced"
 输出: false
  

 提示:

 1 <= s.length, goal.length <= 100
 s 和 goal 由小写英文字母组成


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/rotate-string
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
// import XCTest

public class _796_旋转字符串 {
    //class Solution {
    public init() {}
    
    public func rotateString(_ s: String, _ goal: String) -> Bool {
        guard s.isEmpty || goal.isEmpty || s.count == goal.count else {
            return false
        }

        let new = s + s
        return getIndexOf(new, goal) != -1
    }
    
    /// 获取match字符串在s字符串第一次出现的位置 ,如果没有出现,返回-1
    /// - Parameters:
    ///   - s: 源字符串
    ///   - m: 匹配字符串
    func getIndexOf(_ s: String, _ m: String) -> Int {
        if s.count < m.count {
            return -1
        }
        
        let ss = s.map { Character(extendedGraphemeClusterLiteral: $0) }
        let ms = m.map { Character(extendedGraphemeClusterLiteral: $0) }
        var si = 0
        var mi = 0
        let next = getNextArray(ms)
        
        while si < ss.count, mi < ms.count {
            if ss[si] == ms[mi] {
                si += 1
                mi += 1
            } else if next[mi] == -1 {
                si += 1
            } else {
                mi = next[mi]
            }
        }
        
        return mi == ms.count ? si - mi : -1
    }
    
    /// 之前这坨字符串最长前缀和最长后缀相等时的匹配长度数组
    /// - Parameters:
    ///   - ms: 匹配字符串数组
    func getNextArray(_ ms: [Character]) -> [Int] {
        if ms.count == 1 {
            return [-1]
        }
        
        var next = [Int].init(repeating: 0, count: ms.count)
        next[0] = -1
        next[1] = 0
        
        var pos = 2
        var cn = 0
        while pos < next.count {
            if ms[pos - 1] == ms[cn] {
                cn += 1
                next[pos] = cn
                pos += 1
            } else if cn > 0 {
                cn = next[cn]
            } else {
                next[pos] = 0
                pos += 1
            }
        }
        
        return next
    }
    
    public func rotateString0(_ s: String, _ goal: String) -> Bool {
        guard s.isEmpty || goal.isEmpty || s.count == goal.count else {
            return false
        }

        let new = s + s
        return new.contains(goal)
    }
}

public extension _796_旋转字符串 {
    func test() {
        let testTime = 10
        var isSucceed = true
        
        let lowercaseLetterValues = Unicode.Scalar("a").value...Unicode.Scalar("z").value
        let letters = lowercaseLetterValues.map { String(Unicode.Scalar($0) ?? " ")}
        let minCount = 1
        let maxCount = 100
        let count = Int.random(in: minCount...maxCount)
        for _ in 0..<testTime {
            var s = ""
            var goal = ""
            for _ in 0..<count {
                let sIndex = Int.random(in: 0..<letters.count)
                s += letters[sIndex]

                let goalIndex = Int.random(in: 0..<letters.count)
                goal += letters[goalIndex]
            }
                        
            /// 方法一
            let result1 = rotateString0(s, goal)
            
            /// 待验证的：方法二
            let result2 = rotateString(s, goal)
            
            if result1 != result2 {
                isSucceed = false
                print("s = \(s) --- goal = \(goal)")
                break
            }
        }
        
        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
    
}

//do {
//    let s = _796_旋转字符串()
//    let result1 = s.rotateString("aa", "a")
//    let result2 = s.rotateString("abcde", "cdeab")
//    let result3 = s.rotateString("abcde", "abced")
//    print("\(s) --- \(result1), --- \(result2), ---- \(result3)")
//
//    /// 对数器测试
//    s.test()
//}

//: [Next](@next)
