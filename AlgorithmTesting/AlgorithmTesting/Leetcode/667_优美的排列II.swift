/**
 https://leetcode.cn/problems/beautiful-arrangement-ii/
 
 给你两个整数 n 和 k ，请你构造一个答案列表 answer ，该列表应当包含从 1 到 n 的 n 个不同正整数，并同时满足下述条件：
 
 假设该列表是 answer = [a1, a2, a3, ... , an] ，那么列表 [|a1 - a2|, |a2 - a3|, |a3 - a4|, ... , |an-1 - an|] 中应该有且仅有 k 个不同整数。
 返回列表 answer 。如果存在多种答案，只需返回其中 任意一种 。
 
 
 
 示例 1：
 
 输入：n = 3, k = 1
 输出：[1, 2, 3]
 解释：[1, 2, 3] 包含 3 个范围在 1-3 的不同整数，并且 [1, 1] 中有且仅有 1 个不同整数：1
 示例 2：
 
 输入：n = 3, k = 2
 输出：[1, 3, 2]
 解释：[1, 3, 2] 包含 3 个范围在 1-3 的不同整数，并且 [2, 1] 中有且仅有 2 个不同整数：1 和 2
 
 
 提示：
 
 1 <= k < n <= 104
 
 */

import Foundation
import Darwin
// import XCTest

public class _667_优美的排列II {
    //class Solution {
    public init() {}
    
    public func constructArray(_ n: Int, _ k: Int) -> [Int] {
        var ans = [Int].init(repeating: 0, count: n)
        let t = n - (k + 1)
        for i in 0..<t {
            ans[i] = i + 1
        }
        var i = t, a = n - k, b = n
        while i < n {
            ans[i] = a;
            i += 1
            a += 1
            if i < n {
                ans[i] = b
                i += 1
                b -= 1
            }
        }
        return ans
    }
    
    private func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a, b = b
        while a != 0 {
            let tmp = a
            a = b % a
            b = tmp
        }
        return b
    }
}

extension _667_优美的排列II {
    public func test() {
        let testTime = 10000
        print("对数器开始工作, 执行 【\(testTime)】 次")
        
        var isSucceed = true
        for i in 0..<testTime {
            let n = Int.random(in: 1...50)
            let k = Int.random(in: 1...50)
            
            let result0 = self.constructArray(n, k)
            let result1 = self.constructArray(n, k)
            
            if result0 != result1 {
                isSucceed = false
                print("第 \(i + 1) 次测试失败, targetX = \(n), targetY = \(k), result = \(result1)")
                break
            } else {
                print("第 \(i + 1) 次测试成功, targetX = \(n), targetY = \(k), result = \(result1)")
            }
        }
        
        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}

//do {
//    let s = _667_优美的排列II()
//    
//    let result1 = s.constructArray(3, 1)
//    //    assert(result1 == [1,2,3])
//    print(result1)
//    
//    let result2 = s.constructArray(3, 2)
//    //    assert(result2 == [1,3,2])
//    print(result2)
//    
//    //    s.test()
//}


//: [Next](@next)
