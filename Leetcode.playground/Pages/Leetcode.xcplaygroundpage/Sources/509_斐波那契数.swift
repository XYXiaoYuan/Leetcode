//: [Previous](@previous)

/**
 斐波那契数，通常用 F(n) 表示，形成的序列称为斐波那契数列。该数列由 0 和 1 开始，后面的每一项数字都是前面两项数字的和。也就是：

 F(0) = 0,   F(1) = 1
 F(N) = F(N - 1) + F(N - 2), 其中 N > 1.
 给定 N，计算 F(N)。

  

 示例 1：

 输入：2
 输出：1
 解释：F(2) = F(1) + F(0) = 1 + 0 = 1.
 示例 2：

 输入：3
 输出：2
 解释：F(3) = F(2) + F(1) = 1 + 1 = 2.
 示例 3：

 输入：4
 输出：3
 解释：F(4) = F(3) + F(2) = 2 + 1 = 3.
  

 提示：

 0 ≤ N ≤ 30

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/fibonacci-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

public class _509_斐波那契数 {
//class Solution {
    public init() {}
    
    /// 直接用两个变量来推演
    public func fib(_ n: Int) -> Int {
        var n = n
        if n <= 1 { return n }
        var first = 0
        var second = 1
        
        while n > 1 {
            second += first
            first = second - first
            n -= 1
        }
        return second
    }
    
    /// 动态规划2,数组个数为2
    public func fib12(_ n: Int) -> Int {
        if n <= 1 {
            return n
        }
        
        var dp = [Int].init(repeating: 0, count: 2)
        dp[0] = 0
        dp[1] = 1
        
        for _ in 2...n {
            let sum = dp[0] + dp[1]
            dp[0] = dp[1]
            dp[1] = sum
        }
        return dp[1]
    }
    
    /// 动态规划1, 数组个数为n
    public func fib11(_ n: Int) -> Int {
        if n <= 1 {
            return n
        }
        
        var dp = [Int].init(repeating: 0, count: n + 1)
        dp[0] = 0
        dp[1] = 1
        
        for i in 2...n {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        return dp[n]
    }
    
    /// 递归实现
    public func fib0(_ n: Int) -> Int {
        if n <= 1 { return n }
        if n == 2 { return 1 }
        
        return fib0(n - 1)  + fib0(n - 2)
    }
}

//let s = _509_斐波那契数()
//let result = s.fib(92)
//print(result)

//: [Next](@next)
