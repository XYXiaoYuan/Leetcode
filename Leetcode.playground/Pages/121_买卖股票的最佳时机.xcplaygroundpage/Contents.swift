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

/**
 股票问题团灭
 
 每天都有三种「选择」：买⼊、卖出、⽆操作，我们⽤ buy, sell, rest 表⽰这三种选择。但问题是，并不是每天都可以任意选择这三 种选择的，因为 sell 必须在 buy 之后，buy 必须在 sell 之后。那么 rest 操作 还应该分两种状态，⼀种是 buy 之后的 rest（持有了股票），⼀种是 sell 之 后的 rest（没有持有股票）。⽽且别忘了，我们还有交易次数 k 的限制，就 是说你 buy 还只能在 k > 0 的前提下操作。 很复杂对吧，不要怕，我们现在的⽬的只是穷举，你有再多的状态，⽼夫要 做的就是⼀把梭全部列举出来。这个问题的「状态」有三个，第⼀个是天 数，第⼆个是允许交易的最⼤次数，第三个是当前的持有状态（即之前说的 rest 的状态，我们不妨⽤ 1 表⽰持有，0 表⽰没有持有）。然后我们⽤⼀个 三维数组就可以装下这⼏种状态的全部组合：
 
 dp[i][k][0 or 1]
 0 <= i <= n-1, 1 <= k <= K
 n 为天数，⼤ K 为最多交易数
 此问题共 n × K × 2 种状态，全部穷举就能搞定。
 for 0 <= i < n:
     for 1 <= k <= K:
         for s in {0, 1}:
             dp[i][k][s] = max(buy, sell, rest)
 
 ⽽且我们可以⽤⾃然语⾔描述出每⼀个状态的含义，⽐如说 dp[3][2][1] 的含义就是：今天是第三天，我现在⼿上持有着股票，⾄今最多进⾏ 2 次交 易。再⽐如 dp[2][3][0] 的含义：今天是第⼆天，我现在⼿上没有持有股 票，⾄今最多进⾏ 3 次交易。很容易理解，对吧？ 我们想求的最终答案是 dp[n - 1][K][0]，即最后⼀天，最多允许 K 次交易， 最多获得多少利润。读者可能问为什么不是 dp[n - 1][K][1]？因为 [1] 代表⼿ 上还持有股票，[0] 表⽰⼿上的股票已经卖出去了，很显然后者得到的利润 ⼀定⼤于前者。 记住如何解释「状态」，⼀旦你觉得哪⾥不好理解，把它翻译成⾃然语⾔就 容易理解了。
 
 dp[i][k][0] = max(dp[i-1][k][0], dp[i-1][k][1] + prices[i])
               max( 选择 rest , 选择 sell )
 解释：今天我没有持有股票，有两种可能： 要么是我昨天就没有持有，然后今天选择 rest，所以我今天还是没有持有； 要么是我昨天持有股票，但是今天我 sell 了，所以我今天没有持有股票了。
 
 dp[i][k][1] = max(dp[i-1][k][1], dp[i-1][k-1][0] - prices[i])
               max( 选择 rest , 选择 buy )
 解释：今天我持有着股票，有两种可能： 要么我昨天就持有着股票，然后今天选择 rest，所以我今天还持有着股票； 要么我昨天本没有持有，但今天我选择 buy，所以今天我就持有股票了。
 */

/**
 k = 1 直接套状态转移⽅程，根据 base case，可以做⼀些化简：
 dp[i][1][0] = max(dp[i-1][1][0], dp[i-1][1][1] + prices[i])
 dp[i][1][1] = max(dp[i-1][1][1], dp[i-1][0][0] - prices[i])
           = max(dp[i-1][1][1], -prices[i])
 
 解释：k = 0 的 base case，所以 dp[i-1][0][0] = 0。
 现在发现 k 都是 1，不会改变，即 k 对状态转移已经没有影响了。
 可以进⾏进⼀步化简去掉所有 k：
 dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i])
 dp[i][1] = max(dp[i-1][1], -prices[i])
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
    
    func maxProfit2(_ prices: [Int]) -> Int {
        if prices.isEmpty {
            return 0
        }
        
        let n = prices.count
        
        var dp_i_0 = 0
        var dp_i_1 = Int.min
        
        for i in 0..<n {
            dp_i_0 = max(dp_i_0, dp_i_1 + prices[i])
            dp_i_1 = max(dp_i_1, -prices[i])
        }
        return dp_i_0
    }
    
    func maxProfit1(_ prices: [Int]) -> Int {
        if prices.isEmpty {
            return 0
        }
        
        let n = prices.count
        var dp: [[Int]] = [[Int]].init(repeating: [Int].init(repeating: 0, count: 2), count: n)
        
        for i in 0..<n {
            if i - 1 == -1 {
                dp[i][0] = 0
                dp[i][1] = -prices[i]
                continue
            }
            dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] + prices[i])
            dp[i][1] = max(dp[i - 1][1], -prices[i])
        }
        
        return dp[n - 1][0]
    }
}

let s = Solution()
let input1 = [7,1,5,3,6,4]
let input2 = [7,6,4,3,1]
let result = s.maxProfit(input1)
print(result)

assert(s.maxProfit(input1) == 5)
assert(s.maxProfit(input2) == 0)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

