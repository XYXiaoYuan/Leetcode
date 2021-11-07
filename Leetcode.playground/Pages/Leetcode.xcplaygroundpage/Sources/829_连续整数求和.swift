/**
 https://leetcode-cn.com/problems/consecutive-numbers-sum/
 
 给定一个正整数 N，试求有多少组连续正整数满足所有数字之和为 N?

 示例 1:

 输入: 5
 输出: 2
 解释: 5 = 5 = 2 + 3，共有两组连续整数([5],[2,3])求和后为 5。
 示例 2:

 输入: 9
 输出: 3
 解释: 9 = 9 = 4 + 5 = 2 + 3 + 4
 示例 3:

 输入: 15
 输出: 4
 解释: 15 = 15 = 8 + 7 = 4 + 5 + 6 = 1 + 2 + 3 + 4 + 5
 说明: 1 <= N <= 10 ^ 9



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/consecutive-numbers-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

/**
 等差数列、数学公式不易理解，我们来个容易理解的。
 首先，最小的两个连续正整数相加1+2=3，大点的就是2+3=5=1+2+2，再大点3+4=7=2+3+2=1+2+(2+2)，从中可以看出如果存在两个连续正整数之和等于N，那么必然N=1+2+2k(k为正整数)，N-(1+2)可以整除2，即(N-(1+2))%2 == 0.
 往下推，n个连续正整数就是，(N-(1+2+...+n))%n == 0

 作者：shi-san-dao
 链接：https://leetcode-cn.com/problems/consecutive-numbers-sum/solution/829zhao-gui-lu-jian-dan-yi-li-jie-by-shi-san-dao/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */

public class _829_连续整数求和 {
    public init() {}
    
    public func consecutiveNumbersSum(_ n: Int) -> Int {
        var i = 2
        
        var result = 1
        var sum = 1 + i
        
        while sum <= n {
            if (n - sum) % i == 0 {
                result += 1
            }
            
            i += 1
            sum += i
        }
        return result
    }
}

//let s = _829_连续整数求和()
//let result = s.consecutiveNumbersSum(15)
//print("\(s) --- \(result)")
//
//assert(s.consecutiveNumbersSum(5) == 2)
//assert(s.consecutiveNumbersSum(9) == 3)
//assert(s.consecutiveNumbersSum(15) == 4)
