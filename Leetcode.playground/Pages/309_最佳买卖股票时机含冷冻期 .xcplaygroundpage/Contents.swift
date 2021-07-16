/**
 https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/
 
 给定一个整数数组，其中第 i 个元素代表了第 i 天的股票价格 。

 设计一个算法计算出最大利润。在满足以下约束条件下，你可以尽可能地完成更多的交易（多次买卖一支股票）:

 你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。
 卖出股票后，你无法在第二天买入股票 (即冷冻期为 1 天)。
 示例:

 输入: [1,2,3,0,2]
 输出: 3
 解释: 对应的交易状态为: [买入, 卖出, 冷冻期, 买入, 卖出]


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-with-cooldown
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

/**
 k = +infinity with cooldown
 每次 sell 之后要等⼀天才能继续交易。
 只要把这个特点融⼊上⼀题的状态转 移⽅程即可：
 dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i]) dp[i][1] = max(dp[i-1][1],
 dp[i-2][0] - prices[i])
 解释：
 第 i 天选择 buy 的时候，要从 i-2 的状态转移，⽽不是 i-1 。
 */
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        var dp_i_0 = 0
        var dp_i_1 = Int.min
        var dp_pre_0 = 0; // 代表 dp[i-2][0]
        for i in 0..<n {
            let temp = dp_i_0
            dp_i_0 = max(dp_i_0, dp_i_1 + prices[i])
            dp_i_1 = max(dp_i_1, dp_pre_0 - prices[i])
            dp_pre_0 = temp
        }
        return dp_i_0
    }
}
