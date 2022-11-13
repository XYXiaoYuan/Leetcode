/**
 https://leetcode.cn/problems/minimum-add-to-make-parentheses-valid/
 
 只有满足下面几点之一，括号字符串才是有效的：

 它是一个空字符串，或者
 它可以被写成 AB （A 与 B 连接）, 其中 A 和 B 都是有效字符串，或者
 它可以被写作 (A)，其中 A 是有效字符串。
 给定一个括号字符串 s ，在每一次操作中，你都可以在字符串的任何位置插入一个括号

 例如，如果 s = "()))" ，你可以插入一个开始括号为 "(()))" 或结束括号为 "())))" 。
 返回 为使结果字符串 s 有效而必须添加的最少括号数。

  

 示例 1：

 输入：s = "())"
 输出：1
 示例 2：

 输入：s = "((("
 输出：3
  

 提示：

 1 <= s.length <= 1000
 s 只包含 '(' 和 ')' 字符。


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/minimum-add-to-make-parentheses-valid
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

 */

import Foundation
import Darwin
// import XCTest

public class _921_使括号有效的最少添加 {
    //class Solution {
    public init() {}
    
    public func minAddToMakeValid(_ s: String) -> Int {
        let str = s.map { String($0) }
        var count = 0
        var need = 0
        for i in 0..<str.count {
            if str[i] == "(" {
                count += 1
            } else { // 遇到的是 ')'
                if count == 0 {
                    need += 1
                } else {
                    count -= 1
                }
            }
        }
        return count + need
    }
}

extension _921_使括号有效的最少添加 {
    public static func test() {
        let testTime = 100
        var isSucceed = true
        for _ in 0..<testTime {
            var str = ""
            let count = Int.random(in: 1...100)
            for i in 0..<count {
                let temp = Bool.random() ? "(" : ")"
                str.append(temp)
            }
            let s = _921_使括号有效的最少添加()
            /// 暴力方法
            let result = s.minAddToMakeValid(str)

            /// 待验证的：方法
            let result1 = s.minAddToMakeValid(str)

            if result != result1 {
                isSucceed = false
                print("startPos = \(str), --- result = \(result)\n, result1 = \(result1)")
                break
            }
        }

        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}

//do {
//    let s = _921_使括号有效的最少添加()
//    let result1 = s.minAddToMakeValid("())")
//    assert(result1 == 1)
//
//    let result2 = s.minAddToMakeValid("(((")
//    assert(result2 == 3)
//
//    print("\(s) result1 = \(result1) ---- result2 = \(result2)")
//
//    /// 对数器测试
//    _921_使括号有效的最少添加.test()
//}

//: [Next](@next)
