/**
 https://leetcode-cn.com/problems/min-cost-climbing-stairs/
 
 数组的每个下标作为一个阶梯，第 i 个阶梯对应着一个非负数的体力花费值 cost[i]（下标从 0 开始）。

 每当你爬上一个阶梯你都要花费对应的体力值，一旦支付了相应的体力值，你就可以选择向上爬一个阶梯或者爬两个阶梯。

 请你找出达到楼层顶部的最低花费。在开始时，你可以选择从下标为 0 或 1 的元素作为初始阶梯。

  

 示例 1：

 输入：cost = [10, 15, 20]
 输出：15
 解释：最低花费是从 cost[1] 开始，然后走两步即可到阶梯顶，一共花费 15 。
  示例 2：

 输入：cost = [1, 100, 1, 1, 1, 100, 1, 1, 100, 1]
 输出：6
 解释：最低花费方式是从 cost[0] 开始，逐个经过那些 1 ，跳过 cost[3] ，一共花费 6 。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/min-cost-climbing-stairs
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var minCost0 = 0
        var minCost1 = min(cost[0], cost[1])
        
        var minCost = minCost1
        for i in 2..<cost.count {
            minCost = min(minCost1 + cost[i], minCost0 + cost[i - 1])
            minCost0 = minCost1
            minCost1 = minCost
        }
        
        return minCost
    }
    
    func minCostClimbingStairs1(_ cost: [Int]) -> Int {
        let n = cost.count
        var dp: [Int] = [Int].init(repeating: 0, count: n)
        dp[0] = 0
        dp[1] = min(cost[0], cost[1])
        
        for i in 2..<n {
            dp[i] = min(dp[i - 1] + cost[i], dp[i - 2] + cost[i - 1])
        }
        
        return dp[n - 1]
    }
}

let s = Solution()
let result = s.minCostClimbingStairs([1, 100])
print(result)

assert(s.minCostClimbingStairs([10, 15, 20]) == 15)
assert(s.minCostClimbingStairs([1, 100, 1, 1, 1, 100, 1, 1, 100, 1]) == 6)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

