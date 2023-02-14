/**
 https://leetcode.cn/problems/2vYnGI/
 
 小扣在秋日市集选择了一家早餐摊位，一维整型数组 staple 中记录了每种主食的价格，一维整型数组 drinks 中记录了每种饮料的价格。小扣的计划选择一份主食和一款饮料，且花费不超过 x 元。请返回小扣共有多少种购买方案。

 注意：答案需要以 1e9 + 7 (1000000007) 为底取模，如：计算初始结果为：1000000008，请返回 1

 示例 1：

 输入：staple = [10,20,5], drinks = [5,5,2], x = 15

 输出：6

 解释：小扣有 6 种购买方案，所选主食与所选饮料在数组中对应的下标分别是：
 第 1 种方案：staple[0] + drinks[0] = 10 + 5 = 15；
 第 2 种方案：staple[0] + drinks[1] = 10 + 5 = 15；
 第 3 种方案：staple[0] + drinks[2] = 10 + 2 = 12；
 第 4 种方案：staple[2] + drinks[0] = 5 + 5 = 10；
 第 5 种方案：staple[2] + drinks[1] = 5 + 5 = 10；
 第 6 种方案：staple[2] + drinks[2] = 5 + 2 = 7。

 示例 2：

 输入：staple = [2,1,1], drinks = [8,9,5,1], x = 9

 输出：8

 解释：小扣有 8 种购买方案，所选主食与所选饮料在数组中对应的下标分别是：
 第 1 种方案：staple[0] + drinks[2] = 2 + 5 = 7；
 第 2 种方案：staple[0] + drinks[3] = 2 + 1 = 3；
 第 3 种方案：staple[1] + drinks[0] = 1 + 8 = 9；
 第 4 种方案：staple[1] + drinks[2] = 1 + 5 = 6；
 第 5 种方案：staple[1] + drinks[3] = 1 + 1 = 2；
 第 6 种方案：staple[2] + drinks[0] = 1 + 8 = 9；
 第 7 种方案：staple[2] + drinks[2] = 1 + 5 = 6；
 第 8 种方案：staple[2] + drinks[3] = 1 + 1 = 2；

 提示：

 1 <= staple.length <= 10^5
 1 <= drinks.length <= 10^5
 1 <= staple[i],drinks[i] <= 10^5
 1 <= x <= 2*10^5


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/2vYnGI
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
// import XCTest

public class _LCP_18_早餐组合 {
    //class Solution {
    public init() {}
    
    public func breakfastNumber(_ staple: [Int], _ drinks: [Int], _ x: Int) -> Int {
        print("\(#function) 入参, staple = \(staple), drinks = \(drinks), x = \(x)")
        
        let staple = staple.sorted(), drinks = drinks.sorted()
        var num: Int = 0
        var j = drinks.count - 1
        
        for i in staple {
            /// 遍历找到第一个
            while j > 0, i + drinks[j] > x {
                j = j - 1
            }
            if i + drinks[j] <= x {
                num = num + j + 1
            }
        }
        
        return num % 1000000007
    }
    
    public func breakfastNumber1(_ staple: [Int], _ drinks: [Int], _ x: Int) -> Int {
        print("\(#function) 入参, staple = \(staple), drinks = \(drinks), x = \(x)")
        
        var ans: Int = 0
        var arr = [Int].init(repeating: 0, count: x + 1)
        
        for sta in staple where sta < x {
            arr[sta] += 1
        }

        let start = arr.count > 2 ? 2 : 1
        for i in start..<x {
            arr[i] += arr[i - 1]
        }
        

        for drink in drinks {
            let lt = x - drink
            if lt <= 0 {
                continue
            }
            ans += arr[lt]
        }
        
        return ans % 1000000007
    }
    
    public func breakfastNumber0(_ staple: [Int], _ drinks: [Int], _ x: Int) -> Int {
        print("\(#function) 入参, staple = \(staple), drinks = \(drinks), x = \(x)")

        var ans = 0
        
        for s in staple {
            for d in drinks {
                if s + d <= x {
                    ans += 1
                }
            }
        }
        
        return ans % 1000000007
    }
}

extension _LCP_18_早餐组合 {
    public func test() {
        
        let testTime = 10
        print("对数器开始工作, 执行 【\(testTime)】 次")
        var isSucceed = true
        for i in 0..<testTime {
            let max = 10//Int(1e5)
            let count = Int.random(in: 1...max)
            let minValue = 1
            let maxValue = max
            let staple = Int.random(count: count, min: minValue, max: maxValue)
            let drinks = Int.random(count: count, min: minValue, max: maxValue)
            let x = Int.random(in: 1...(2 * max))

            print("第 \(i) 次测试, staple = \(staple), drinks = \(drinks), x = \(x)")

            /// 方法一
            let result1 = breakfastNumber0(staple, drinks, x)

            /// 待验证的：方法二
            let result2 = breakfastNumber1(staple, drinks, x)

            /// 待验证的：方法三
            let result3 = breakfastNumber(staple, drinks, x)

            if result1 != result2 || result1 != result3 {
                isSucceed = false
                print("第 \(i + 1) 次测试失败, staple = \(staple), drinks = \(drinks), x = \(x)")
                break
            } else {
                print("第 \(i + 1) 次测试成功, staple = \(staple), drinks = \(drinks), x = \(x)")
            }
        }

        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }

}


//do {
//    let s = _LCP_18_早餐组合()
//
//    let result1 = s.breakfastNumber([10,20,5], [5,5,2], 15)
//    assert(result1 == 6)
//    print(result1)
//
//    let result2 = s.breakfastNumber([2,1,1], [8,9,5,1], 9)
//    assert(result2 == 8)
//    print(result2)
//
//    s.test()
//}


//: [Next](@next)
