/**
 https://leetcode-cn.com/problems/ugly-number-ii/
 
 给你一个整数 n ，请你找出并返回第 n 个 丑数 。

 丑数 就是只包含质因数 2、3 和/或 5 的正整数。

  

 示例 1：

 输入：n = 10
 输出：12
 解释：[1, 2, 3, 4, 5, 6, 8, 9, 10, 12] 是由前 10 个丑数组成的序列。
 示例 2：

 输入：n = 1
 输出：1
 解释：1 通常被视为丑数。
  

 提示：

 1 <= n <= 1690


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/ugly-number-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        var dp = [Int].init(repeating: 1, count: n + 1)
        dp[1] = 1
        var p2 = 1, p3 = 1, p5 = 1
        for i in 2..<dp.count {
            let num2 = dp[p2] * 2, num3 = dp[p3] * 3, num5 = dp[p5] * 5
            dp[i] = min(min(num2, num3), num5)
            if dp[i] == num2 {
                p2 += 1
            }
            if dp[i] == num3 {
                p3 += 1
            }
            if dp[i] == num5 {
                p5 += 1
            }
        }
                
        return dp[n]
    }
}


let s = Solution()
let result = s.nthUglyNumber(10)
print(result)

//assert(s.maxValue(input1) == 12)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

