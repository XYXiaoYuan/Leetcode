//: [Previous](@previous)

/// https://leetcode-cn.com/problems/climbing-stairs/

/**
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。

 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？

 注意：给定 n 是一个正整数。

 示例 1：

 输入： 2
 输出： 2
 解释： 有两种方法可以爬到楼顶。
 1.  1 阶 + 1 阶
 2.  2 阶
 示例 2：

 输入： 3
 输出： 3
 解释： 有三种方法可以爬到楼顶。
 1.  1 阶 + 1 阶 + 1 阶
 2.  1 阶 + 2 阶
 3.  2 阶 + 1 阶


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/climbing-stairs
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

/// f(x)=f(x−1)+f(x−2)

public class _070_爬楼梯 {
//class Solution {
    public init() {}
    
    public func climbStairs(_ n: Int) -> Int {
//        var p = 0, q = 0, r = 1
//        for _ in 0..<n {
//            p = q
//            q = r
//            r = p + q
//        }
//        return r
        
        return climStair(n)
    }
    
    public func climStair(_ n: Int, t1: Int = 1, t2: Int = 1) -> Int {
        if n <= 1 {
            return t2
        }
        
        /// 这里采用的是尾递归的方式，可以大大节约时间和空间的消耗。
        return climStair(n-1, t1: t2, t2: t1 + t2)
    }
}

//let s = _070_爬楼梯()
//let result = s.climbStairs(2)
//print("结果result = \(result)")

//: [Next](@next)
