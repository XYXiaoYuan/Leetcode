/**
 https://leetcode.cn/problems/removing-stars-from-a-string/
 
 给你一个包含若干星号 * 的字符串 s 。

 在一步操作中，你可以：

 选中 s 中的一个星号。
 移除星号 左侧 最近的那个 非星号 字符，并移除该星号自身。
 返回移除 所有 星号之后的字符串。

 注意：

 生成的输入保证总是可以执行题面中描述的操作。
 可以证明结果字符串是唯一的。
  

 示例 1：

 输入：s = "leet**cod*e"
 输出："lecoe"
 解释：从左到右执行移除操作：
 - 距离第 1 个星号最近的字符是 "leet**cod*e" 中的 't' ，s 变为 "lee*cod*e" 。
 - 距离第 2 个星号最近的字符是 "lee*cod*e" 中的 'e' ，s 变为 "lecod*e" 。
 - 距离第 3 个星号最近的字符是 "lecod*e" 中的 'd' ，s 变为 "lecoe" 。
 不存在其他星号，返回 "lecoe" 。
 示例 2：

 输入：s = "erase*****"
 输出：""
 解释：整个字符串都会被移除，所以返回空字符串。
  

 提示：

 1 <= s.length <= 105
 s 由小写英文字母和星号 * 组成
 s 可以执行上述操作

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/removing-stars-from-a-string
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
// import XCTest

public class _2390_从字符串中移除星号 {
    //class Solution {
    public init() {}
    
    public func removeStars(_ s: String) -> String {
        let arr = s.map { String($0) }
        var stack = Stack<String>()
        for char in arr {
            stack.push(char)
            if let top = stack.top, top == "*" {
                stack.pop()
                stack.pop()
            }
        }
        
        var res = [String]()
        while !stack.isEmpty {
            res.append(stack.pop() ?? "")
        }
                        
        return res.reversed().joined(separator: "")
    }
    
    public func removeStars1(_ s: String) -> String {
        var arr = s.map { String($0) }
                
        for (i, char) in arr.enumerated() {
            if char == "*" {
                arr[i] = ""
                var index = i - 1
                while arr[index] == "", index > 0 {
                    index -= 1
                }
                arr[index] = ""
            }
        }
                
        return arr.joined(separator: "")
    }
}

extension _2390_从字符串中移除星号 {
    public func test() {
        let testTime = 10000
        var isSucceed = true
        let min = 1
        let max = 10
        let letters = String.lowercaseLetters()
        for _ in 0..<testTime {
            let count = Int.random(in: min...max)
            var target = [String]()
            for _ in 0..<count {
                let index = Int.random(in: 0..<letters.count)
                target.append(letters[index])
                if Bool.random() {
                    target.append("*")
                }
            }
            let s = target.joined(separator: "")
            
            /// 方法一
            let result1 = removeStars(s)

            /// 待验证的：方法二
            let result2 = removeStars1(s)

            if result1 != result2 {
                isSucceed = false
                print("s = \(s)")
                break
            }
        }

        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }

}


//do {
//    let s = _2390_从字符串中移除星号()
//    let result1 = s.removeStars("leet**cod*e")
//    assert(result1 == "lecoe")
//    let result2 = s.removeStars("erase*****")
//    assert(result2 == "")
//
//    print("\(s) result1 = \(result1) ---- result2 = \(result2)")
//    
//    /// 对数器测试
//    s.test()
//}

//: [Next](@next)
