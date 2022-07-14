/**
 https://leetcode-cn.com/problems/shu-zhi-de-zheng-shu-ci-fang-lcof/
 
 实现 pow(x, n) ，即计算 x 的 n 次幂函数（即，xn）。不得使用库函数，同时不需要考虑大数问题。

  

 示例 1：

 输入：x = 2.00000, n = 10
 输出：1024.00000
 示例 2：

 输入：x = 2.10000, n = 3
 输出：9.26100
 示例 3：

 输入：x = 2.00000, n = -2
 输出：0.25000
 解释：2-2 = 1/22 = 1/4 = 0.25
  

 提示：

 -100.0 < x < 100.0
 -231 <= n <= 231-1
 -104 <= xn <= 104


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/shu-zhi-de-zheng-shu-ci-fang-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _剑指Offer16_数值的整数次方 {
//class Solution {
    public init() {}
    
    public func myPow(_ x: Double, _ n: Int) -> Double {
        if x == 0 {
            return 0
        }

        var result: Double = 1.0
        var x = x
        var b = n
        if b < 0 {
            x = 1 / x
            b = -b
        }

        while b > 0 {
            if b & 1 == 1 {
                result *= x
            }
            x *= x
            b >>= 1
        }
    
        return result
    }
}

//let s = _剑指Offer16_数值的整数次方()
//let result = s.myPow(2.00000, 10)
//print(result)

//assert(s.maxValue(input1) == 12)

/// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}

