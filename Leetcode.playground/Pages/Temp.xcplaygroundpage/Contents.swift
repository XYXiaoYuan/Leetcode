/**
 https://leetcode.cn/problems/basic-calculator/
 
 给你一个字符串表达式 s ，请你实现一个基本计算器来计算并返回它的值。

 注意:不允许使用任何将字符串作为数学表达式计算的内置函数，比如 eval() 。

  

 示例 1：

 输入：s = "1 + 1"
 输出：2
 示例 2：

 输入：s = " 2-1 + 2 "
 输出：3
 示例 3：

 输入：s = "(1+(4+5+2)-3)+(6+8)"
 输出：23
  

 提示：

 1 <= s.length <= 3 * 105
 s 由数字、'+'、'-'、'('、')'、和 ' ' 组成
 s 表示一个有效的表达式
 '+' 不能用作一元运算(例如， "+1" 和 "+(2 + 3)" 无效)
 '-' 可以用作一元运算(即 "-1" 和 "-(2 + 3)" 是有效的)
 输入中不存在两个连续的操作符
 每个数字和运行的计算将适合于一个有符号的 32位 整数


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/basic-calculator
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _224_基本计算器 {
    public init() {}
    //class Solution class Solution {
        
    func calculate(_ s: String) -> Int {
        var result = 0, sign = 1, num = 0
        var stack = [(result: Int, sign: Int)]()
        for char in s where char != " " {
            switch char {
            case "(":
                stack.append((result, sign))
                result = 0
                sign = 1
                num = 0
                
            case ")":
                result += sign * num
                let prev = stack.removeLast()
                result = prev.result + prev.sign * result
                sign = 1
                num = 0
                
            case "+", "-":
                result += sign * num
                sign = (char == "-" ? -1 : 1)
                num = 0
                
            default:
                num = num * 10 + (Int(String(char)) ?? 0)
            }
        }
        result += sign * num
        return result
    }
}

do {
    let s = _224_基本计算器()
    let result = s.calculate("16*4/2")
    print("\(s) --- \(result)")
}

