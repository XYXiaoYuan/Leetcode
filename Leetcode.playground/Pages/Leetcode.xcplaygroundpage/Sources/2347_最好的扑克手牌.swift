/**
 https://leetcode.cn/problems/best-poker-hand/
 
 给你一个整数数组 ranks 和一个字符数组 suit 。你有 5 张扑克牌，第 i 张牌大小为 ranks[i] ，花色为 suits[i] 。

 下述是从好到坏你可能持有的 手牌类型 ：

 "Flush"：同花，五张相同花色的扑克牌。
 "Three of a Kind"：三条，有 3 张大小相同的扑克牌。
 "Pair"：对子，两张大小一样的扑克牌。
 "High Card"：高牌，五张大小互不相同的扑克牌。
 请你返回一个字符串，表示给定的 5 张牌中，你能组成的 最好手牌类型 。

 注意：返回的字符串 大小写 需与题目描述相同。

  

 示例 1：

 输入：ranks = [13,2,3,1,9], suits = ["a","a","a","a","a"]
 输出："Flush"
 解释：5 张扑克牌的花色相同，所以返回 "Flush" 。
 示例 2：

 输入：ranks = [4,4,2,4,4], suits = ["d","a","a","b","c"]
 输出："Three of a Kind"
 解释：第一、二和四张牌组成三张相同大小的扑克牌，所以得到 "Three of a Kind" 。
 注意我们也可以得到 "Pair" ，但是 "Three of a Kind" 是更好的手牌类型。
 有其他的 3 张牌也可以组成 "Three of a Kind" 手牌类型。
 示例 3：

 输入：ranks = [10,10,2,12,9], suits = ["a","b","c","a","d"]
 输出："Pair"
 解释：第一和第二张牌大小相同，所以得到 "Pair" 。
 我们无法得到 "Flush" 或者 "Three of a Kind" 。
  

 提示：

 ranks.length == suits.length == 5
 1 <= ranks[i] <= 13
 'a' <= suits[i] <= 'd'
 任意两张扑克牌不会同时有相同的大小和花色。


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/best-poker-hand
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
// import XCTest

public class _2347_最好的扑克手牌 {
    //class Solution {
    public init() {}
        
    public func bestHand(_ ranks: [Int], _ suits: [Character]) -> String {
        if Set(suits).count == 1 {
            return "Flush"
        }
        
        var groups = [Int: Int]()
        for r in ranks {
            groups[r, default: 0] += 1
        }
        var isThree = false
        var isPair = false
        for (_, v) in groups {
            if v >= 3 {
                isThree = true
            } else if v == 2 {
                isPair = true
            }
        }
        if isThree {
            return "Three of a Kind"
        }
        if isPair {
            return "Pair"
        }
        return "High Card"
    }

    public func bestHand0(_ ranks: [Int], _ suits: [Character]) -> String {
        var suitsSet = Set<Character>()
        for s in suits {
            suitsSet.insert(s)
        }
        if suitsSet.count == 1 {
            return "Flush"
        }
        
        var ranksDict = [Int: Int]()
        let ranks = ranks.sorted()
        for r in ranks {
            ranksDict.updateValue((ranksDict[r] ?? 0) + 1, forKey: r)
        }
        if ranksDict.filter({ $0.value == 1 }).count == 5 {
            return "High Card"
        } else {
            ranksDict = ranksDict.filter({ $0.value >= 3 })
            if ranksDict.isEmpty {
                return "Pair"
            } else {
                return "Three of a Kind"
            }
        }
    }
    
}

extension _2347_最好的扑克手牌 {
    public func test() {
        let testTime = 10
        print("对数器开始工作, 执行 【\(testTime)】 次")
        let suitsCharacter: [Character] = ["a", "b", "c", "d"]

        var isSucceed = true
        for i in 0..<testTime {
            let count = 5
            var ranks = [Int]()
            for _ in 0..<count {
                let t = Int.random(in: 1...13)
                ranks.append(t)
            }
            
            var suits = [Character]()
            for _ in 0..<count {
                let t = suitsCharacter[Int.random(in: 0...suitsCharacter.count - 1)]
                suits.append(t)
            }
            
            let result0 = self.bestHand0(ranks, suits)
            let result1 = self.bestHand(ranks, suits)

            if result0 != result1 {
                isSucceed = false
                print("第 \(i + 1) 次测试失败, ranks = \(ranks), suits = \(suits), result = \(result1)")
                break
            } else {
                print("第 \(i + 1) 次测试成功, ranks = \(ranks), suits = \(suits), result = \(result1)")
            }
        }

        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}

//do {
//    let s = _2347_最好的扑克手牌()
//
//    let result1 = s.bestHand([13,2,3,1,9], ["a","a","a","a","a"])
//    assert(result1 == "Flush")
//    print(result1)
//
//    let result2 = s.bestHand([4,4,2,4,4], ["d","a","a","b","c"])
//    assert(result2 == "Three of a Kind")
//    print(result2)
//
//    let result3 = s.bestHand([10,10,2,12,9], ["a","b","c","a","d"])
//    assert(result3 == "Pair")
//    print(result3)
//
//    do {
//        let result3 = s.bestHand([2,10,7,10,7], ["a","b","a","d","b"])
//        assert(result3 == "Pair")
//        print(result3)
//
//    }
//
//    s.test()
//}


//: [Next](@next)
