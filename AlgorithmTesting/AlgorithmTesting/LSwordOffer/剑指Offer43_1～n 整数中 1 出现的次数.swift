/**
 https://leetcode-cn.com/problems/1nzheng-shu-zhong-1chu-xian-de-ci-shu-lcof/
 
 输入一个整数 n ，求1～n这n个整数的十进制表示中1出现的次数。

 例如，输入12，1～12这些整数中包含1 的数字有1、10、11和12，1一共出现了5次。

  

 示例 1：

 输入：n = 12
 输出：5
 示例 2：

 输入：n = 13
 输出：6
  

 限制：

 1 <= n < 2^31
 注意：本题与主站 233 题相同：https://leetcode-cn.com/problems/number-of-digit-one/



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/1nzheng-shu-zhong-1chu-xian-de-ci-shu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _剑指Offer43_1～n整数中1出现的次数 {
//class Solution {
    public init() {}
    
    public func countDigitOne(_ n: Int) -> Int {
        var count: Int = 0
        
        var cur = 1
        while cur <= n {
            let div = cur * 10
            count += (n / div) * cur + min(max(n % div - cur + 1, 0), cur)
            cur *= 10
        }
        
        return count
    }
}

//let s = _剑指Offer43_1～n整数中1出现的次数()
//let result = s.countDigitOne(13)
//print(result)
//
//assert(s.countDigitOne(13) == 6)
//assert(s.countDigitOne(0) == 0)
