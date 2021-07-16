/**
 https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-iv/
 
 给定一个整数数组 prices ，它的第 i 个元素 prices[i] 是一支给定的股票在第 i 天的价格。

 设计一个算法来计算你所能获取的最大利润。你最多可以完成 k 笔交易。

 注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。

  

 示例 1：

 输入：k = 2, prices = [2,4,1]
 输出：2
 解释：在第 1 天 (股票价格 = 2) 的时候买入，在第 2 天 (股票价格 = 4) 的时候卖出，这笔交易所能获得利润 = 4-2 = 2 。
 示例 2：

 输入：k = 2, prices = [3,2,6,5,0,3]
 输出：7
 解释：在第 2 天 (股票价格 = 2) 的时候买入，在第 3 天 (股票价格 = 6) 的时候卖出, 这笔交易所能获得利润 = 6-2 = 4 。
      随后，在第 5 天 (股票价格 = 0) 的时候买入，在第 6 天 (股票价格 = 3) 的时候卖出, 这笔交易所能获得利润 = 3-0 = 3 。
  

 提示：

 0 <= k <= 100
 0 <= prices.length <= 1000
 0 <= prices[i] <= 1000


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-iv
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

/**
 k = any integer 277
 团灭 LeetCode 股票买卖问题 有了上⼀题 k = 2 的铺垫，
 这题应该和上⼀题的第⼀个解法没啥区别。
 但是 出现了⼀个超内存的错误，原来是传⼊的 k 值会⾮常⼤，dp 数组太⼤了。
 现在想想，交易次数 k 最多有多⼤呢？
 ⼀次交易由买⼊和卖出构成，⾄少需要两天。
 所以说有效的限制 k 应该不超 过 n/2，
 如果超过，就没有约束作⽤了，
 相当于 k = +infinity。这种情况是之 前解决过的。
 */
class Solution {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        let max_k = k
        let n = prices.count
        if (max_k > n / 2) {
            return maxProfit_k_inf(prices)
        }
        var dp: [[[Int]]] = [[[Int]]].init(repeating: [[Int]].init(repeating: [Int].init(repeating: 0, count: 2), count: max_k + 1), count: n)
        for i in 0..<n {
            for k in stride(from: max_k, through: 1, by: -1) {
                if (i - 1 == -1) {
                    /* 处理 base case */
                    dp[i][k][0] = 0
                    dp[i][k][1] = -prices[i]
                    continue
                }
                dp[i][k][0] = max(dp[i - 1][k][0], dp[i - 1][k][1] + prices[i])
                dp[i][k][1] = max(dp[i - 1][k][1], dp[i - 1][k - 1][0] - prices [i])
            }
        }
        return dp[n - 1][max_k][0]
    }
    
    func maxProfit_k_inf(_ prices: [Int]) -> Int {
        let n = prices.count
        var dp_i_0 = 0
        var dp_i_1 = Int.min
        
        for i in 0..<n {
            let temp = dp_i_0
            dp_i_0 = max(dp_i_0, dp_i_1 + prices[i])
            dp_i_1 = max(dp_i_1, temp - prices[i])
        }

        return dp_i_0
    }
}
