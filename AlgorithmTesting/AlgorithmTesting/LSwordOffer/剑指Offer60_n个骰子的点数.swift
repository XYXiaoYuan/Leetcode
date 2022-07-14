/**
 https://leetcode-cn.com/problems/nge-tou-zi-de-dian-shu-lcof/
 
 把n个骰子扔在地上，所有骰子朝上一面的点数之和为s。输入n，打印出s的所有可能的值出现的概率。

  

 你需要用一个浮点数数组返回答案，其中第 i 个元素代表这 n 个骰子所能掷出的点数集合中第 i 小的那个的概率。

  

 示例 1:

 输入: 1
 输出: [0.16667,0.16667,0.16667,0.16667,0.16667,0.16667]
 示例 2:

 输入: 2
 输出: [0.02778,0.05556,0.08333,0.11111,0.13889,0.16667,0.13889,0.11111,0.08333,0.05556,0.02778]
  

 限制：

 1 <= n <= 11



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/nge-tou-zi-de-dian-shu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _剑指Offer60_n个骰子的点数 {
//class Solution {
    public init() {}
    
   public func dicesProbability(_ n: Int) -> [Double] {
        var dp = [Double].init(repeating: 1.0 / 6.0, count: 6)
        if n < 2 {
            return dp
        }
        
        for i in 2...n {
            var tmp = [Double].init(repeating: 0.0, count: 5 * i + 1)
            for j in 0..<dp.count {
                for k in 0..<6 {
                    tmp[j + k] += dp[j] / 6.0
                }
            }
            dp = tmp
        }
        return dp
    }
}

//let s = _剑指Offer60_n个骰子的点数()
//let result = s.dicesProbability(2)
//print(result)

//assert(s.maxValue(input1) == 12)

/// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}

