/**
 https://leetcode.cn/problems/final-prices-with-a-special-discount-in-a-shop/
 
 给你一个数组 prices ，其中 prices[i] 是商店里第 i 件商品的价格。

 商店里正在进行促销活动，如果你要买第 i 件商品，那么你可以得到与 prices[j] 相等的折扣，其中 j 是满足 j > i 且 prices[j] <= prices[i] 的 最小下标 ，如果没有满足条件的 j ，你将没有任何折扣。

 请你返回一个数组，数组中第 i 个元素是折扣后你购买商品 i 最终需要支付的价格。

  

 示例 1：

 输入：prices = [8,4,6,2,3]
 输出：[4,2,4,2,3]
 解释：
 商品 0 的价格为 price[0]=8 ，你将得到 prices[1]=4 的折扣，所以最终价格为 8 - 4 = 4 。
 商品 1 的价格为 price[1]=4 ，你将得到 prices[3]=2 的折扣，所以最终价格为 4 - 2 = 2 。
 商品 2 的价格为 price[2]=6 ，你将得到 prices[3]=2 的折扣，所以最终价格为 6 - 2 = 4 。
 商品 3 和 4 都没有折扣。
 示例 2：

 输入：prices = [1,2,3,4,5]
 输出：[1,2,3,4,5]
 解释：在这个例子中，所有商品都没有折扣。
 示例 3：

 输入：prices = [10,1,1,6]
 输出：[9,0,1,6]
  

 提示：

 1 <= prices.length <= 500
 1 <= prices[i] <= 10^3


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/final-prices-with-a-special-discount-in-a-shop
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
// import XCTest

public class _1475_商品折扣后的最终价格 {
    //class Solution {
    public init() {}

    public func finalPrices(_ prices: [Int]) -> [Int] {
        var ans = [Int]()
        for (i, price) in prices.enumerated() {
            var discount = 0
            var index = i
            while index < prices.count - 1 {
                let next = prices[index + 1]
                if next <= price {
                    discount = next
                    break
                }
                index += 1
            }
            
            ans.append(discount == 0 ? price : price - discount)
        }
        
        return ans
    }
}

extension _1475_商品折扣后的最终价格 {
    public func test() {
        let testTime = 10
        var isSucceed = true
        let min = 1
        let max = 10
        for _ in 0..<testTime {
            let count = Int.random(in: min...max)
            let nums = Int.random(count: count, min: min, max: max)
            
            /// 方法一
            let result = finalPrices(nums)

            /// 待验证的：方法二
            let result1 = finalPrices(nums)

            if result != result1 {
                isSucceed = false
                print("nums = \(nums) --- result = \(result)")
                break
            }
        }

        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}

//do {
//    let s = _1475_商品折扣后的最终价格()
//    let result1 = s.finalPrices([8,4,6,2,3])
//    assert(result1 == [4,2,4,2,3])
//    let result2 = s.finalPrices([1,2,3,4,5])
//    assert(result2 == [1,2,3,4,5])
//    let result3 = s.finalPrices([10,1,1,6])
//    assert(result3 == [9,0,1,6])
//
//    print("\(s) result1 = \(result1) ---- result2 = \(result2) ---- result3 = \(result3)")
//
//    /// 对数器测试
//    s.test()
//}

//: [Next](@next)
