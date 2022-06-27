/**
 https://leetcode-cn.com/problems/qing-wa-tiao-tai-jie-wen-ti-lcof/
 
 一只青蛙一次可以跳上1级台阶，也可以跳上2级台阶。求该青蛙跳上一个 n 级的台阶总共有多少种跳法。

 答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。

 示例 1：

 输入：n = 2
 输出：2
 示例 2：

 输入：n = 7
 输出：21
 示例 3：

 输入：n = 0
 输出：1

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/qing-wa-tiao-tai-jie-wen-ti-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

public class _剑指Offer10II_青蛙跳台阶问题 {
//class Solution {
    public init() {}
//    func numWays(_ n: Int) -> Int {
//        var a = 1
//        var b = 1
//
//        var sum = 0
//        for i in 1..<n {
//            sum = (a + b) % 1000000007
//            a = b
//            b = sum
//        }
//
//        return b
//    }
    
    public func numWays(_ n: Int) -> Int {
        if n < 2 {
            return 1
        }
        
        var dp: [Int] = [Int].init(repeating: 0, count: n + 1)
        dp[0] = 1
        dp[1] = 1
        
        let mod = 1000000007
        for i in 2..<(n + 1) {
            dp[i] += dp[i - 1] + dp[i - 2]
            dp[i] %= mod
        }
        
        return dp[n]
    }
    
    
    /// 递归超时
    public func numWays1(_ n: Int) -> Int {
        if n == 0 {
            return 1
        }
        if n <= 2 {
            return n
        }
        
        return numWays(n - 1) + numWays(n - 2)
    }
}


//let s = _剑指Offer10II_青蛙跳台阶问题()
//let result = s.numWays(2)
//print(result)
//
//assert(s.numWays(2) == 2)
//assert(s.numWays(7) == 21)
//assert(s.numWays(0) == 1)
//
///// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}

