/**
 https://leetcode.cn/problems/different-ways-to-add-parentheses/
 
 给你一个由数字和运算符组成的字符串 expression ，按不同优先级组合数字和运算符，计算并返回所有可能组合的结果。你可以 按任意顺序 返回答案。

 生成的测试用例满足其对应输出值符合 32 位整数范围，不同结果的数量不超过 104 。

  

 示例 1：

 输入：expression = "2-1-1"
 输出：[0,2]
 解释：
 ((2-1)-1) = 0
 (2-(1-1)) = 2
 示例 2：

 输入：expression = "2*3-4*5"
 输出：[-34,-14,-10,-10,10]
 解释：
 (2*(3-(4*5))) = -34
 ((2*3)-(4*5)) = -14
 ((2*(3-4))*5) = -10
 (2*((3-4)*5)) = -10
 (((2*3)-4)*5) = 10
  

 提示：

 1 <= expression.length <= 20
 expression 由数字和算符 '+'、'-' 和 '*' 组成。
 输入表达式中的所有整数值在范围 [0, 99]


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/different-ways-to-add-parentheses
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

