/**
 https://leetcode-cn.com/problems/n-th-tribonacci-number/
 
 泰波那契序列 Tn 定义如下：

 T0 = 0, T1 = 1, T2 = 1, 且在 n >= 0 的条件下 Tn+3 = Tn + Tn+1 + Tn+2

 给你整数 n，请返回第 n 个泰波那契数 Tn 的值。

  

 示例 1：

 输入：n = 4
 输出：4
 解释：
 T_3 = 0 + 1 + 1 = 2
 T_4 = 1 + 1 + 2 = 4
 示例 2：

 输入：n = 25
 输出：1389537
  

 提示：

 0 <= n <= 37
 答案保证是一个 32 位整数，即 answer <= 2^31 - 1。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/n-th-tribonacci-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _1137_第N个泰波那契数 {
//class Solution {
    public init() {}
    
    /// 发现只跟3个值有关,可以用三个变量来推演
    public func tribonacci(_ n: Int) -> Int {
        if n <= 1 {
            return n
        }
        
        if n <= 2 {
            return 1
        }
        
        var first = 0
        var second = 1
        var third = 1
        
        for _ in 3...n {
            third = third + second + first
            second = third - second - first
            first = third - second - first
        }
        
        return third
    }
    
    /// 动态规划解法, dp[n] = dp[n - 3] + dp[n - 2] + dp[n - 1]
    public func tribonacci1(_ n: Int) -> Int {
        if n <= 1 {
            return n
        }
        
        if n <= 2 {
            return 1
        }
        
        var dp: [Int] = [Int].init(repeating: 0, count: n + 1)
        dp[0] = 0
        dp[1] = 1
        dp[2] = 1
        dp[3] = 2

        for i in 3...n {
            dp[i] = dp[i - 1] + dp[i - 2] + dp[i - 3]
        }
                
        return dp[n]
    }
}

//let s = _1137_第N个泰波那契数()
//let result = s.tribonacci(4)
//print(result)
//
//assert(s.tribonacci(4) == 4)
//assert(s.tribonacci(25) == 1389537)
//
///// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}

