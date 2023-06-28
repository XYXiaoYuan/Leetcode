/**
 https://leetcode.cn/problems/buy-two-chocolates/
 
 给你一个整数数组 prices ，它表示一个商店里若干巧克力的价格。同时给你一个整数 money ，表示你一开始拥有的钱数。

 你必须购买 恰好 两块巧克力，而且剩余的钱数必须是 非负数 。同时你想最小化购买两块巧克力的总花费。

 请你返回在购买两块巧克力后，最多能剩下多少钱。如果购买任意两块巧克力都超过了你拥有的钱，请你返回 money 。注意剩余钱数必须是非负数。

  

 示例 1：

 输入：prices = [1,2,2], money = 3
 输出：0
 解释：分别购买价格为 1 和 2 的巧克力。你剩下 3 - 3 = 0 块钱。所以我们返回 0 。
 示例 2：

 输入：prices = [3,2,3], money = 3
 输出：3
 解释：购买任意 2 块巧克力都会超过你拥有的钱数，所以我们返回 3 。
  

 提示：

 2 <= prices.length <= 50
 1 <= prices[i] <= 100
 1 <= money <= 100


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/buy-two-chocolates
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
// import XCTest

public class _2706_购买两块巧克力 {
    //class Solution {
    public init() {}

    /// 不用排序,遍历取出最小和次小
    public func buyChoco(_ prices: [Int], _ money: Int) -> Int {
        var min1 = Int.max, min2 = Int.max
        for price in prices {
            if price < min1 {
                min2 = min1
                min1 = price
            } else if price < min2 {
                min2 = price
            }
        }
        let sum = min1 + min2
        return sum > money ? money : money - sum
    }
    
    /// 排序后, 取第一个和第二个相加, 和money对比
    public func buyChoco1(_ prices: [Int], _ money: Int) -> Int {
        let prices = prices.sorted()
        let sum = prices[0] + prices[1]
        return sum > money ? money : money - sum
    }
    
}

extension _2706_购买两块巧克力 {
    public func test() {
        let testTime = 10000
        print("对数器开始工作, 执行 【\(testTime)】 次")

        var isSucceed = true
        for i in 0..<testTime {
            let count = Int.random(in: 2...50)
            var prices = [Int]()
            for _ in 0..<count {
                let t = Int.random(in: 1...100)
                prices.append(t)
            }
            
            let money = Int.random(in: 1...100)
                        
            let result0 = self.buyChoco(prices, money)
            let result1 = self.buyChoco1(prices, money)

            if result0 != result1 {
                isSucceed = false
                print("第 \(i + 1) 次测试失败, ranks = \(prices), money = \(money), result = \(result1)")
                break
            } else {
                print("第 \(i + 1) 次测试成功, ranks = \(prices), money = \(money), result = \(result1)")
            }
        }

        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}

//do {
//    let s = _2706_购买两块巧克力()
//
//    let result1 = s.buyChoco([1,2,2], 3)
//    assert(result1 == 0)
//    print(result1)
//
//    let result2 = s.buyChoco([3,2,3], 3)
//    assert(result2 == 3)
//    print(result2)
//
//    let result3 = s.buyChoco([98,54,6,34,66,63,52,39], 62)
//    assert(result3 == 22)
//    print(result3)
//
//    s.test()
//}


//: [Next](@next)
