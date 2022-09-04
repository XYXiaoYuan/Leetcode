/**
 https://leetcode.cn/contest/weekly-contest-309/problems/number-of-ways-to-reach-a-position-after-exactly-k-steps/
 
 给你两个 正 整数 startPos 和 endPos 。最初，你站在 无限 数轴上位置 startPos 处。在一步移动中，你可以向左或者向右移动一个位置。

 给你一个正整数 k ，返回从 startPos 出发、恰好 移动 k 步并到达 endPos 的 不同 方法数目。由于答案可能会很大，返回对 109 + 7 取余 的结果。

 如果所执行移动的顺序不完全相同，则认为两种方法不同。

 注意：数轴包含负整数。

  

 示例 1：

 输入：startPos = 1, endPos = 2, k = 3
 输出：3
 解释：存在 3 种从 1 到 2 且恰好移动 3 步的方法：
 - 1 -> 2 -> 3 -> 2.
 - 1 -> 2 -> 1 -> 2.
 - 1 -> 0 -> 1 -> 2.
 可以证明不存在其他方法，所以返回 3 。
 示例 2：

 输入：startPos = 2, endPos = 5, k = 10
 输出：0
 解释：不存在从 2 到 5 且恰好移动 10 步的方法。
  

 提示：

 1 <= startPos, endPos, k <= 1000

 */

import Foundation
import Darwin
// import XCTest

public class _6168_恰好移动k步到达某一位置的方法数目 {
    //class Solution {
    public init() {}
    
    let mod: Int64 = Int64(1e9 + 7)
    
    var s = 0
    var e = 0
    var map = [Int: Int64]()
    public func numberOfWays1(_ startPos: Int, _ endPos: Int, _ k: Int) -> Int {
        s = startPos
        e = endPos
        return Int(ways(s, k))
    }
    
    private func ways(_ index: Int, _ rest: Int) -> Int64 {
        if abs(Int32(index - e)) > rest {
            return 0 // 剪枝
        }
        // 此时rest = 0 并且因为上一个if的过滤，所以idx肯定到达了终点
        if rest == 0 { return 1 }
        
        let key = index * 1005 + rest
        if let value = map[key] {
            return value
        }
        
        let value: Int64 = (ways(index + 1, rest - 1) + ways(index - 1, rest - 1)) % mod
        map[key] = value
        return value
    }
    
    let N = 2010, M = 1010, MOD = Int64(1e9 + 7)
    public func numberOfWays(_ startPos: Int, _ endPos: Int, _ k: Int) -> Int {
        let diff = abs(Int32(startPos - endPos))
        let s = 1001, e = 1001 + diff
        var dp = [[Int64]].init(repeating: [Int64].init(repeating: 0, count: N), count: M)
        dp[0][s] = 1
        for i in 1...k {
            for j in 1..<(N - 1) {
                dp[i][j] = (dp[i - 1][j - 1] + dp[i - 1][j + 1]) % MOD
            }
        }
        return Int(dp[k][Int(e)])
    }
}

extension _6168_恰好移动k步到达某一位置的方法数目 {
    public static func test() {
        let testTime = 10
        var isSucceed = true
        let min = 1
        let max = 10
        for _ in 0..<testTime {
            let startPos = Int.random(in: min...max)
            let endPos = Int.random(in: min...max)
            let k = Int.random(in: min...max)
            let s = _6168_恰好移动k步到达某一位置的方法数目()
            /// 方法一
            let result = s.numberOfWays(startPos, endPos, k)
            
            /// 待验证的：方法二
            let result1 = s.numberOfWays1(startPos, endPos, k)
            
            if result != result1 {
                isSucceed = false
                print("startPos = \(startPos), endPos = \(endPos), k = \(k), --- result = \(result)")
                break
            }
        }
        
        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}

//do {
//    let s = _6168_恰好移动k步到达某一位置的方法数目()
//    let result1 = s.numberOfWays(1,2,3)
//    assert(result1 == 3)
//    let result2 = s.numberOfWays(2,5,10)
//    assert(result2 == 0)
//
//    print("\(s) result1 = \(result1) ---- result2 = \(result2)")
//
//    /// 对数器测试
//    _6168_恰好移动k步到达某一位置的方法数目.test()
//}

//: [Next](@next)
