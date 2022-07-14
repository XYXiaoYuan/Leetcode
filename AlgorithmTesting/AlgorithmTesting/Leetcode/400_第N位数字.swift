import Darwin
/**
 https://leetcode-cn.com/problems/nth-digit/
 
 给你一个整数 n ，请你在无限的整数序列 [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, ...] 中找出并返回第 n 位上的数字。

  

 示例 1：

 输入：n = 3
 输出：3
 示例 2：

 输入：n = 11
 输出：0
 解释：第 11 位数字在序列 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, ... 里是 0 ，它是 10 的一部分。
  

 提示：

 1 <= n <= 231 - 1


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/nth-digit
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。 */


public class _400_第N位数字 {
//class Solution {
    public init() {}
        
    public func findNthDigit(_ n: Int) -> Int {
        // 先找到digits
        var digits = 1
        var base = 9
        var n = n
        
        while n - base * digits > 0 {
            n -= base * digits
            base *= 10
            digits += 1
        }
        
        // 找到目标的数字
        // 计算后n是对应的在当前digits下的序号
        // 例子1 位数是3， n=4 表示的是第四个， 对应的数字就是 100 + 3/3 = 101 里的 3%4=1的第一个数字
        // 例子2 位数是3，n=3 表示的是第三个，对应的数字是 100 + 3/3-1 = 100 里的 3%3+3=3的第三个数字
        // 考虑基数 10^(digits-1)
        var t = 1
        for _ in 1..<digits {
            t *= 10
        }
        // 这里考虑一下对应的是第几个数字，需要考虑前面提到边缘情况就是正好能被digits整除
        let index = (n % digits == 0) ? digits : n % digits
        t += (index == digits) ? n / digits - 1 : n / digits
        
        // 按照位数去找对应的一位数字，这里是使用倒序的实现
        // 如果是最后一位，index=digits, 那么一次除法都没有
        // 如果是第一位，index=0, 则需要除digits-1次
        // 总结就是 digits - 位数
        for _ in index..<digits {
            t /= 10
        }
        
        // 取10的模得到对应的单个数字
        return t % 10
    }
    
    public func findNthDigit1(_ n: Int) -> Int {
        if n < 10 {return n }
        var n = n
        
        // len 表示数字的长度，即位数
        // 比如数字 123 长度为 3 ，即位数为 3
        // 比如数字 5678 长度为 4 ，即位数为 4
        var len = 1

        // weight 表示数字所在的位数的数字的权重
        // 比如长度为 2 的数字的权重是 10
        // 比如长度为 3 的数字的权重是 100
        // 即 10^(len-1)
        var weight = 1

        // 1、先找出 n 是落在长度为多少的数字上
        // 公式就是：n =  n - 9 * 1 * 1 - 9 * 10 * 2 - 9 * 100 * 3 - 9 * 1000 * 4 ...
        // 直到在减的过程中发现 n 再去剪后面的数字为变成负数为止。
        // 由于 n 会很大，避免溢出，转一下类型
        while n > 9 * len * weight {
            // 公式就是：n =  n - 9 * 1 * 1 - 9 * 10 * 2 - 9 * 100 * 3 - 9 * 1000 * 4 ...
            n = n - 9 * len * weight
             
            // 数字的位数在不断增加
            len += 1

            // 数字的权重也在不断增加
            weight *= 10
        }

        // 2、再找出 n 落在哪个数字上
        let curNum = weight + (n - 1 ) / len

        // 3、再找出 n 落在这个数字的第几位
        let count = (n - 1) % len

        // 4、最后计算出这个数位来
        let pow = pow(10, Float(len - count - 1))
        return (curNum / Int(pow)) % 10

    }
}
