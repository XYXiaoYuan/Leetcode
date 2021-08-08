/**
 https://leetcode-cn.com/problems/biao-shi-shu-zhi-de-zi-fu-chuan-lcof/
 
 请实现一个函数用来判断字符串是否表示数值（包括整数和小数）。

 数值（按顺序）可以分成以下几个部分：

 若干空格
 一个 小数 或者 整数
 （可选）一个 'e' 或 'E' ，后面跟着一个 整数
 若干空格
 小数（按顺序）可以分成以下几个部分：

 （可选）一个符号字符（'+' 或 '-'）
 下述格式之一：
 至少一位数字，后面跟着一个点 '.'
 至少一位数字，后面跟着一个点 '.' ，后面再跟着至少一位数字
 一个点 '.' ，后面跟着至少一位数字
 整数（按顺序）可以分成以下几个部分：

 （可选）一个符号字符（'+' 或 '-'）
 至少一位数字
 部分数值列举如下：

 ["+100", "5e2", "-123", "3.1416", "-1E-16", "0123"]
 部分非数值列举如下：

 ["12e", "1a3.14", "1.2.3", "+-5", "12e+5.4"]
  

 示例 1：

 输入：s = "0"
 输出：true
 示例 2：

 输入：s = "e"
 输出：false
 示例 3：

 输入：s = "."
 输出：false
 示例 4：

 输入：s = "    .1  "
 输出：true
  

 提示：

 1 <= s.length <= 20
 s 仅含英文字母（大写和小写），数字（0-9），加号 '+' ，减号 '-' ，空格 ' ' 或者点 '.' 。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/biao-shi-shu-zhi-de-zi-fu-chuan-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func isNumber(_ s: String) -> Bool {
        let states: [[String: Int]] = [
            [" ": 0, "s": 1, "d": 2, ".": 4], // 0
            ["d": 2, ".": 4],                 // 1
            ["d": 2, ".": 3, "e": 5, " ": 8], // 2
            ["d": 3, "e": 5, " ": 8],         // 3
            ["d": 3],                         // 4
            ["s": 6, "d": 7],                 // 5
            ["d": 7],                         // 6
            ["d": 7, " ": 8],                 // 7
            [" ": 8],                         // 8
        ]
        
        var p = 0
        var t: String = ""
        let sArray = s.map { String($0) }
        for c in sArray {
            if let intVal = Int(c), intVal >= 0, intVal <= 9 {
                t = "d"
            } else if c == "+" || c == "-" {
                t = "s"
            } else if c == "e" || c == "E" {
                t = "e"
            } else if c == "." || c == " " {
                t = c
            } else {
                t = "?"
            }
            
            guard let value = states[p][t] else {
                return false
            }
            p = value
        }
        
        return p == 2 || p == 3 || p == 7 || p == 8
    }
}

let s = Solution()
let result = s.isNumber("0")
print(result)

assert(s.isNumber("0") == true)
assert(s.isNumber("e") == false)
assert(s.isNumber(".") == false)
assert(s.isNumber("    .1  ") == true)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

