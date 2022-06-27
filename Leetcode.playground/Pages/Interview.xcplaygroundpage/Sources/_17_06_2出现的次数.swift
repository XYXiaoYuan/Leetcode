/**
 https://leetcode.cn/problems/number-of-2s-in-range-lcci/
 
 编写一个方法，计算从 0 到 n (含 n) 中数字 2 出现的次数。

 示例:

 输入: 25
 输出: 9
 解释: (2, 12, 20, 21, 22, 23, 24, 25)(注意 22 应该算作两次)
 提示：

 n <= 10^9


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/number-of-2s-in-range-lcci
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _17_06_2出现的次数 {
    public init() {}

//class Solution class Solution {
    public func numberOf2sInRange(_ n: Int) -> Int {
        var ans = 0
        var count: Int
        var res: Int
        let value = 2
        
        var i = 1
        while i < n {
            count = (n / (i * 10)) * i
            res = min(max(n % (i * 10) - (i * value - 1), 0), i)
            ans += (count + res)
            
            i *= 10
        }
        return ans
    }
}

//do {
//    let s = _17_06_2出现的次数()
//    let result = s.numberOf2sInRange(25)
//    print(result)
//}

