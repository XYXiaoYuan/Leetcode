/**
 https://leetcode-cn.com/problems/add-digits/
 
 给定一个非负整数 num，反复将各个位上的数字相加，直到结果为一位数。

 示例:

 输入: 38
 输出: 2
 解释: 各位相加的过程为：3 + 8 = 11, 1 + 1 = 2。 由于 2 是一位数，所以返回 2。
 进阶:
 你可以不使用循环或者递归，且在 O(1) 时间复杂度内解决这个问题吗？



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/add-digits
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _258_各位相加 {
//class Solution {
    public init() {}
    
    public func addDigits(_ num: Int) -> Int {
        var num = num
        var sum = 0
        
        repeat {
            if num == 0 {
                num = sum
                sum = 0
            }
            let digital = num % 10
            sum += digital
            num /= 10
        } while num != 0 || sum >= 10
        
        return sum
    }
}

//let s = _258_各位相加()
//let result = s.addDigits(38)
//print(result)

//assert(s.maxValue(input1) == 12)

/// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}

