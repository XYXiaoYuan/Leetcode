/**
 https://leetcode-cn.com/problems/shu-zi-xu-lie-zhong-mou-yi-wei-de-shu-zi-lcof/
 
 数字以0123456789101112131415…的格式序列化到一个字符序列中。在这个序列中，第5位（从下标0开始计数）是5，第13位是1，第19位是4，等等。

 请写一个函数，求任意第n位对应的数字。

  

 示例 1：

 输入：n = 3
 输出：3
 示例 2：

 输入：n = 11
 输出：0
  

 限制：

 0 <= n < 2^31
 注意：本题与主站 400 题相同：https://leetcode-cn.com/problems/nth-digit/



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/shu-zi-xu-lie-zhong-mou-yi-wei-de-shu-zi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution {
    func findNthDigit(_ n: Int) -> Int {
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
        for i in 1..<digits {
            t *= 10
        }
        // 这里考虑一下对应的是第几个数字，需要考虑前面提到边缘情况就是正好能被digits整除
        let index = (n % digits == 0) ? digits : n % digits
        t += (index == digits) ? n / digits - 1 : n / digits

        // 按照位数去找对应的一位数字，这里是使用倒序的实现
        // 如果是最后一位，index=digits, 那么一次除法都没有
        // 如果是第一位，index=0, 则需要除digits-1次
        // 总结就是 digits - 位数
        for i in index..<digits {
            t /= 10
        }

        // 取10的模得到对应的单个数字
        return t % 10
    }
}
