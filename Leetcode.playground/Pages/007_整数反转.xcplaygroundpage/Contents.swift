//: [Previous](@previous)

/// https://leetcode-cn.com/problems/reverse-integer/

/**
 给你一个 32 位的有符号整数 x ，返回 x 中每位上的数字反转后的结果。

 如果反转后整数超过 32 位的有符号整数的范围 [−231,  231 − 1] ，就返回 0。

 假设环境不允许存储 64 位整数（有符号或无符号）。
  

 示例 1：

 输入：x = 123
 输出：321
 示例 2：

 输入：x = -123
 输出：-321
 示例 3：

 输入：x = 120
 输出：21
 示例 4：

 输入：x = 0
 输出：0
  

 提示：

 -2的31次方 <= x <= 2的31次方 - 1


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-integer
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func reverse(_ x: Int) -> Int {
        var res: Int = 0
        let max: Int = 214748364
        
        var varX: Int = x
        while  varX != 0 {
            /// 每次取末尾数字
            let temp: Int = varX % 10
            
            /// 判断是否 大于 最大32位整数
            if res > max || (res == max && temp > 7) {
                return 0
            }
            
            /// 判断是否 小于 最小32位整数
            if res < -max || (res == -max && temp < -8) {
                return 0
            }
            
            res = res * 10 + temp
            varX /= 10
        }
        
        return res
    }
}
//: [Next](@next)
