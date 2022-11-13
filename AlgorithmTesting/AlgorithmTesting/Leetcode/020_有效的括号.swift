/**
 https://leetcode.cn/problems/valid-parentheses/
 
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 每个右括号都有一个对应的相同类型的左括号。
  

 示例 1：

 输入：s = "()"
 输出：true
 示例 2：

 输入：s = "()[]{}"
 输出：true
 示例 3：

 输入：s = "(]"
 输出：false
  

 提示：

 1 <= s.length <= 104
 s 仅由括号 '()[]{}' 组成


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/valid-parentheses
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

 */

import Foundation
import Darwin
// import XCTest

public class _020_有效的括号 {
    //class Solution {
    public init() {}
    
    private static let map = [
        "(": ")",
        "{": "}",
        "[": "]",
    ]
    public func isValid(_ s: String) -> Bool {
        let str = s.map { String($0) }
        var stack = Stack<String>()
        let N = s.count
        for i in 0..<N {
            let c = str[i]
            if let _ = Self.map[c] { // 左括号
                stack.push(c)
            } else { // 右括号
                if stack.isEmpty {
                    return false
                }
                
                if let top = stack.pop(), let v = Self.map[top], c != v {
                    return false
                }
            }
        }
        
        return stack.isEmpty
    }
    
    public func isValid0(_ s: String) -> Bool {
        let str = s.map { String($0) }
        var stack = Stack<String>()
        let N = s.count
        for i in 0..<N {
            let c = str[i]
            if let _ = Self.map[c] { // 左括号
                stack.push(c)
            } else { // 右括号
                if stack.isEmpty {
                    return false
                }
                
                if let top = stack.pop(), let v = Self.map[top], c != v {
                    return false
                }
            }
        }
        
        return stack.isEmpty
    }
}

extension _020_有效的括号 {
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
            let result1 = isValid0(pattern)

            /// 待验证的：方法二
            let result2 = isValid0(pattern)

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
//    let s = _020_有效的括号()
//
//    let result1 = s.isValid("()")
//    assert(result1 == true)
//    print(result1)
//
//    let result2 = s.isValid("()[]{}")
//    assert(result2 == true)
//    print(result2)
//    
//    let result3 = s.isValid("(]")
//    assert(result3 == false)
//    print(result3)
//
//    /// 对数器测试
//    s.test()
//}


//: [Next](@next)
