/**
 https://leetcode-cn.com/problems/sqrtx/
 
 实现 int sqrt(int x) 函数。

 计算并返回 x 的平方根，其中 x 是非负整数。

 由于返回类型是整数，结果只保留整数的部分，小数部分将被舍去。

 示例 1:

 输入: 4
 输出: 2
 示例 2:

 输入: 8
 输出: 2
 说明: 8 的平方根是 2.82842...,
      由于返回类型是整数，小数部分将被舍去。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sqrtx
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _069_x_的平方根 {
//class Solution {
    public init() {}
    
    public func mySqrt(_ x: Int) -> Int {
        var low = 0
        var high = x
        while low <= high {
            let mid = low + (high - low) / 2
            let sq = mid * mid
            if sq > x {
                if (mid - 1) * (mid - 1) < x {
                    return mid - 1
                }
                high = mid - 1
            } else if sq < x  {
                if (mid + 1) * (mid + 1) > x {
                    return mid
                }
                low = mid + 1
            } else {
                return mid
            }
        }
        return 0
    }
}

//let s = _069_x_的平方根()
//let result = s.mySqrt(4)
//print(result)
//
//assert(s.mySqrt(4) == 2)
//assert(s.mySqrt(8) == 2)
//
///// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}

