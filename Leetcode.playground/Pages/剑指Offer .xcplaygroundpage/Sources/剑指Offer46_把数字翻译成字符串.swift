/**
 https://leetcode-cn.com/problems/ba-shu-zi-fan-yi-cheng-zi-fu-chuan-lcof/
 
 给定一个数字，我们按照如下规则把它翻译为字符串：0 翻译成 “a” ，1 翻译成 “b”，……，11 翻译成 “l”，……，25 翻译成 “z”。一个数字可能有多个翻译。请编程实现一个函数，用来计算一个数字有多少种不同的翻译方法。

  

 示例 1:

 输入: 12258
 输出: 5
 解释: 12258有5种不同的翻译，分别是"bccfi", "bwfi", "bczi", "mcfi"和"mzi"
  

 提示：

 0 <= num < 231


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/ba-shu-zi-fan-yi-cheng-zi-fu-chuan-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _剑指Offer46_把数字翻译成字符串 {
//class Solution {
    public init() {}
    
    public func translateNum(_ num: Int) -> Int {
        if num < 10 {
            return 1
        }
        
        // 先转数组
        var numArr = String(num).map { String($0) }
        var dp = [Int](repeating:0, count:numArr.count)
        // 初始化前两个元素
        dp[0] = 1
        dp[1] = Int(numArr[0] + numArr[1])! <= 25 ? 2 : 1
        
        for i in 2..<numArr.count {
            // 说明当前值+前一个值能翻译 a-z
            if numArr[i-1] != "0" && Int(numArr[i-1] + numArr[i])! <= 25 {
                /*
                 如果最后俩元素能翻译，那么最后那俩元素能够组成 2 种结果：
                 前dp[i-2] 应该乘以 2（假设前面dp[i-2]能组成5种，最后俩能组成2种，那总共应该10种）
                 注意：应该加上dp[i-1]和dp[i-2]的差值。
                 
                 如果最后两个不能组成a-z，那么dp[i] = dp[i-1] (有你跟没你一样)
                 */
                dp[i] = dp[i - 2] * 2 + (dp[i - 1] - dp[i - 2])
            } else {
                dp[i] = dp[i - 1]
            }
            
        }
        
        return dp.last ?? 0
    }
}
