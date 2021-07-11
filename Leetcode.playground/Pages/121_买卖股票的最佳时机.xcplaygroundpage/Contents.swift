/**
 https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock/
 
 给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。

 你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。设计一个算法来计算你所能获取的最大利润。

 返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。

  

 示例 1：

 输入：[7,1,5,3,6,4]
 输出：5
 解释：在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
      注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格；同时，你不能在买入前卖出股票。
 示例 2：

 输入：prices = [7,6,4,3,1]
 输出：0
 解释：在这种情况下, 没有交易完成, 所以最大利润为 0。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.isEmpty {
            return 0
        }
        
        // 前面扫描过的最小价格
        var minPrice = prices[0]
        
        // 前在扫描过的最大利润
        var maxProfit = 0
        
        // 扫描所有的价格
        for i in 1..<prices.count {
            if prices[i] < minPrice {
                minPrice = prices[i]
            } else {
                maxProfit = max(maxProfit, prices[i] - minPrice)
            }
        }
        
        return maxProfit
    }
}

let s = Solution()
let input1 = [7,1,5,3,6,4]
let input2 = [7,6,4,3,1]
let result = s.maxProfit([7,1,5,3,6,4])
print(result)

assert(s.maxProfit(input1) == 5)
assert(s.maxProfit(input2) == 0)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

