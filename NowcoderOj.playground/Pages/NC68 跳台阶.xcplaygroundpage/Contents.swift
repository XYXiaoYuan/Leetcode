/**
 https://www.nowcoder.com/practice/8c82a5b80378478f9484d87d1c5f12a4?tpId=196&&tqId=37098&rp=1&ru=/activity/oj&qru=/ta/job-code-total/question-ranking
 
 
 描述
 一只青蛙一次可以跳上1级台阶，也可以跳上2级。求该青蛙跳上一个n级的台阶总共有多少种跳法（先后次序不同算不同的结果）。
 示例1
 输入：
 2
 复制
 返回值：
 2
 复制
 示例2
 输入：
 7
 复制
 返回值：
 21
 复制

 */
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param number int整型
     * @return int整型
     */
    
    func jumpFloor( _ n: Int) -> Int {
            if n < 2 {
                return 1
            }
            
            var dp: [Int] = [Int].init(repeating: 0, count: n + 1)
            dp[0] = 1
            dp[1] = 1
            
            let mod = 1000000007
            for i in 2..<(n + 1) {
                dp[i] += dp[i - 1] + dp[i - 2]
                dp[i] %= mod
            }
            
            return dp[n]
        }
    
    func jumpFloor1( _ number: Int) -> Int {
        if number <= 2 {
            return number
        }
        return jumpFloor(number - 1) + jumpFloor(number - 2)
    }
}
