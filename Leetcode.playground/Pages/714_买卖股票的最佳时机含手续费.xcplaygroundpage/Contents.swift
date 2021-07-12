/**
 https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/
 
 给定一个整数数组 prices，其中第 i 个元素代表了第 i 天的股票价格 ；整数 fee 代表了交易股票的手续费用。

 你可以无限次地完成交易，但是你每笔交易都需要付手续费。如果你已经购买了一个股票，在卖出它之前你就不能再继续购买股票了。

 返回获得利润的最大值。

 注意：这里的一笔交易指买入持有并卖出股票的整个过程，每笔交易你只需要为支付一次手续费。

  

 示例 1：

 输入：prices = [1, 3, 2, 8, 4, 9], fee = 2
 输出：8
 解释：能够达到的最大利润:
 在此处买入 prices[0] = 1
 在此处卖出 prices[3] = 8
 在此处买入 prices[4] = 4
 在此处卖出 prices[5] = 9
 总利润: ((8 - 1) - 2) + ((9 - 4) - 2) = 8
 示例 2：

 输入：prices = [1,3,7,5,10,3], fee = 3
 输出：6


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

class Solution {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        if prices.isEmpty {
            return 0
        }
        
        // 前面扫描过的最小价格
        var cost = prices[0]
        
        // 前在扫描过的最大利润
        var profit = 0
        
        // 扫描所有的价格
        for i in 1..<prices.count {
            profit = max(profit, prices[i] - cost - fee)
            cost = min(cost, prices[i] - profit)
        }
        
        return profit
    }
}


let s = Solution()
let input1 = [1, 3, 2, 8, 4, 9]
let input2 = [1,3,7,5,10,3]
let result = s.maxProfit(input1, 2)
print(result)

assert(s.maxProfit(input1, 2) == 8)
assert(s.maxProfit(input2, 3) == 6)
