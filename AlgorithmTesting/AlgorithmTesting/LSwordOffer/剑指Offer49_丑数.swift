/**
 https://leetcode-cn.com/problems/chou-shu-lcof/
 
 我们把只包含质因子 2、3 和 5 的数称作丑数（Ugly Number）。求按从小到大的顺序的第 n 个丑数。

  

 示例:

 输入: n = 10
 输出: 12
 解释: 1, 2, 3, 4, 5, 6, 8, 9, 10, 12 是前 10 个丑数。
 说明:

 1 是丑数。
 n 不超过1690。
 注意：本题与主站 264 题相同：https://leetcode-cn.com/problems/ugly-number-ii/



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/chou-shu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _剑指Offer49_丑数 {
//class Solution {
    public init() {}
    
    public func nthUglyNumber(_ n: Int) -> Int {
        var dp = [Int].init(repeating: 1, count: n + 1)
        dp[1] = 1
        var p2 = 1, p3 = 1, p5 = 1
        for i in 2..<n+1 {
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

//let s = _剑指Offer49_丑数()
//let result = s.nthUglyNumber(10)
//print(result)

//assert(s.maxValue(input1) == 12)

/// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}

