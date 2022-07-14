/**
 https://leetcode.cn/problems/basic-calculator-ii/
 
 给你一个字符串表达式 s ，请你实现一个基本计算器来计算并返回它的值。
 
 整数除法仅保留整数部分。
 
 你可以假设给定的表达式总是有效的。所有中间结果将在 [-231, 231 - 1] 的范围内。
 
 注意：不允许使用任何将字符串作为数学表达式计算的内置函数，比如 eval() 。
 
  
 
 示例 1：
 
 输入：s = "3+2*2"
 输出：7
 示例 2：
 
 输入：s = " 3/2 "
 输出：1
 示例 3：
 
 输入：s = " 3+5 / 2 "
 输出：5
  
 
 提示：
 
 1 <= s.length <= 3 * 105
 s 由整数和算符 ('+', '-', '*', '/') 组成，中间由一些空格隔开
 s 表示一个 有效表达式
 表达式中的所有整数都是非负整数，且在范围 [0, 231 - 1] 内
 题目数据保证答案是一个 32-bit 整数
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/basic-calculator-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _227_基本计算器II {
    public init() {}
    //class Solution class Solution {
    
    public func calculate(_ s: String) -> Int {
        var op: Character = "+"
        var result = 0
        var temp = 0
        var num = 0
        
        // Updates `temp` and resets `num`
        func processNum() {
            switch op {
            case "+":
                temp += num
            case "-":
                temp -= num
            case "*":
                temp *= num
            case "/":
                temp /= num
            default:
                break
            }
            num = 0
        }
        
        // Process each character in string
        for char in s {
            switch char {
            case "+", "-":
                processNum()
                op = char
                result += temp
                temp = 0
            case "*", "/":
                processNum()
                op = char
            case _ where char.isNumber:
                num = (num * 10) + (Int(String(char)) ?? 0)
            default:
                break
            }
        }
        
        // Handle last number and update result
        processNum()
        return result + temp
    }
}

//do {
//    let s = _227_基本计算器II()
//    let result = s.calculate("16*4/2")
//    print("\(s) --- \(result)")
//}

