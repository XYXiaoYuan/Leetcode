/**
 https://leetcode.cn/problems/decode-string/
 
 给定一个经过编码的字符串，返回它解码后的字符串。
 
 编码规则为: k[encoded_string]，表示其中方括号内部的 encoded_string 正好重复 k 次。注意 k 保证为正整数。
 
 你可以认为输入字符串总是有效的；输入字符串中没有额外的空格，且输入的方括号总是符合格式要求的。
 
 此外，你可以认为原始数据不包含数字，所有的数字只表示重复的次数 k ，例如不会出现像 3a 或 2[4] 的输入。
 
  
 
 示例 1：
 
 输入：s = "3[a]2[bc]"
 输出："aaabcbc"
 示例 2：
 
 输入：s = "3[a2[c]]"
 输出："accaccacc"
 示例 3：
 
 输入：s = "2[abc]3[cd]ef"
 输出："abcabccdcdcdef"
 示例 4：
 
 输入：s = "abc3[cd]xyz"
 输出："abccdcdcdxyz"
  
 
 提示：
 
 1 <= s.length <= 30
 s 由小写英文字母、数字和方括号 '[]' 组成
 s 保证是一个 有效 的输入。
 s 中所有整数的取值范围为 [1, 300]
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/decode-string
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _241_为运算表达式设计优先级 {
    public init() {}
    //class Solution class Solution {
    
    /// 过滤子问题，避免重复计算
    var memo = [String: [Int]]()
    
    public func diffWaysToCompute(_ expression: String) -> [Int] {
        let s = expression
        /// 避免重复计算
        if let value = memo[s] {
            return value
        }
        
        var res = [Int]()
        for (i, exp) in s.enumerated() {
            let c = String(exp)
            // 扫描算式 expression 中的运算符
            if c == "-" || c == "*" || c == "+" {
                // 分，以运算符为中心，分割成两个字符串，分别递归计算
                let left = diffWaysToCompute(String(s.prefix(i)))
                let right = diffWaysToCompute(String(s.suffix(s.count - 1 - i)))
                
                // 治，通过子问题的结果，合成原问题的结果
                for a in left {
                    for b in right {
                        switch c {
                        case "+":
                            res.append(a + b)
                        case "-":
                            res.append(a - b)
                        case "*":
                            res.append(a * b)
                        default:
                            break
                        }
                    }
                }
            }
        }
        
        // base case
        // 如果res为空，说明算式是一个数字，没有运算符
        if res.isEmpty, let value = Int(s) {
            res.append(value)
        }
        // 将结果添加进备忘录
        memo[s] = res
        
        return res
    }
}

//do {
//    let s = _241_为运算表达式设计优先级()
//    let result = s.diffWaysToCompute("2-1-1")
//    print("\(s) --- \(result)")
//}

