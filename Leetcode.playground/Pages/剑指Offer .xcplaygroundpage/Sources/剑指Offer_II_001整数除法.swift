/**
 https://leetcode-cn.com/problems/xoh6Oh/
 
 给定两个整数 a 和 b ，求它们的除法的商 a/b ，要求不得使用乘号 '*'、除号 '/' 以及求余符号 '%' 。

  

 注意：

 整数除法的结果应当截去（truncate）其小数部分，例如：truncate(8.345) = 8 以及 truncate(-2.7335) = -2
 假设我们的环境只能存储 32 位有符号整数，其数值范围是 [−231, 231−1]。本题中，如果除法结果溢出，则返回 231 − 1
  

 示例 1：

 输入：a = 15, b = 2
 输出：7
 解释：15/2 = truncate(7.5) = 7
 示例 2：

 输入：a = 7, b = -3
 输出：-2
 解释：7/-3 = truncate(-2.33333..) = -2
 示例 3：

 输入：a = 0, b = 1
 输出：0
 示例 4：

 输入：a = 1, b = 1
 输出：1
  

 提示:

 -231 <= a, b <= 231 - 1
 b != 0
  

 注意：本题与主站 29 题相同：https://leetcode-cn.com/problems/divide-two-integers/



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/xoh6Oh
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */


public class _剑指Offer_II_001整数除法 {
//class Solution {
    public init() {}
    
    public func divide(_ dividend: Int, _ divisor: Int) -> Int {
        if dividend == 0 { return 0 }
        
        if divisor == 1 { return dividend }
        
        if divisor == -1 {
            // 如果被除数比最小值还小，除以-1之后，就会比边界值还打，所以此时返回最大边界值，其他情况，返回相反数
            if dividend > Int(Int32.min) {
                return -dividend
            }
            return Int(Int32.max)
        }
        // 结果是正数还是负数标志
        let sign = dividend > 0 && divisor > 0 || dividend < 0 && divisor < 0
        let a = dividend > 0 ? dividend : -dividend
        let b = divisor > 0 ? divisor : -divisor
        let res = div(a, b)
        
        return sign ? res : -res
    }

    func div(_ a: Int, _ b: Int) -> Int {
        if a < b {
            return 0
        }
        
        var count = 1
        var result = b
        while result + result <= a {
            count += count
            result += result
        }
        
        return count + div(a - result, b)
    }
}
