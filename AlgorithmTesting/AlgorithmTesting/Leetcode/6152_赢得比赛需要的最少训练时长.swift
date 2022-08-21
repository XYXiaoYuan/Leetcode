/**
 https://leetcode.cn/problems/minimum-hours-of-training-to-win-a-competition/

 你正在参加一场比赛，给你两个 正 整数 initialEnergy 和 initialExperience 分别表示你的初始精力和初始经验。

 另给你两个下标从 0 开始的整数数组 energy 和 experience，长度均为 n 。

 你将会 依次 对上 n 个对手。第 i 个对手的精力和经验分别用 energy[i] 和 experience[i] 表示。当你对上对手时，需要在经验和精力上都 严格 超过对手才能击败他们，然后在可能的情况下继续对上下一个对手。

 击败第 i 个对手会使你的经验 增加 experience[i]，但会将你的精力 减少  energy[i] 。

 在开始比赛前，你可以训练几个小时。每训练一个小时，你可以选择将增加经验增加 1 或者 将精力增加 1 。

 返回击败全部 n 个对手需要训练的 最少 小时数目。

  

 示例 1：

 输入：initialEnergy = 5, initialExperience = 3, energy = [1,4,3,2], experience = [2,6,3,1]
 输出：8
 解释：在 6 小时训练后，你可以将精力提高到 11 ，并且再训练 2 个小时将经验提高到 5 。
 按以下顺序与对手比赛：
 - 你的精力与经验都超过第 0 个对手，所以获胜。
   精力变为：11 - 1 = 10 ，经验变为：5 + 2 = 7 。
 - 你的精力与经验都超过第 1 个对手，所以获胜。
   精力变为：10 - 4 = 6 ，经验变为：7 + 6 = 13 。
 - 你的精力与经验都超过第 2 个对手，所以获胜。
   精力变为：6 - 3 = 3 ，经验变为：13 + 3 = 16 。
 - 你的精力与经验都超过第 3 个对手，所以获胜。
   精力变为：3 - 2 = 1 ，经验变为：16 + 1 = 17 。
 在比赛前进行了 8 小时训练，所以返回 8 。
 可以证明不存在更小的答案。
 示例 2：

 输入：initialEnergy = 2, initialExperience = 4, energy = [1], experience = [3]
 输出：0
 解释：你不需要额外的精力和经验就可以赢得比赛，所以返回 0 。
  

 提示：

 n == energy.length == experience.length
 1 <= n <= 100
 1 <= initialEnergy, initialExperience, energy[i], experience[i] <= 100
 */

import Foundation
import Darwin
// import XCTest

public class _6152_赢得比赛需要的最少训练时长 {
    //class Solution {
    public init() {}

    public func minNumberOfHours(_ initialEnergy: Int, _ initialExperience: Int, _ energy: [Int], _ experience: [Int]) -> Int {
        var res = 0
        
        var totalEnergy = 0
        var cur_exp = initialExperience
        
        for (ene, exp) in zip(energy, experience) {
            totalEnergy += ene
            
            if cur_exp <= exp {
                let value = exp - cur_exp + 1
                res += value
                cur_exp += value
            }
            
            /// 经验值增加
            cur_exp += exp
        }
        
        res += initialEnergy > totalEnergy ? 0 : totalEnergy - initialEnergy + 1
        
        return res
    }
    
}

//extension _6152_赢得比赛需要的最少训练时长 {
//    public func test() {
//        let testTime = 1
//        var isSucceed = true
//        for _ in 0..<testTime {
//            var pattern = ""
//            let count = Int.random(in: 1...8)
//            for _ in 0..<count {
//                pattern.append(Bool.random() ? "D" : "I")
//            }
//
//            /// 方法一
//            let result1 = smallestNumber(pattern)
//
//            /// 待验证的：方法二
//            let result2 = smallestNumber(pattern)
//
//            if result1 != result2 {
//                isSucceed = false
//                print("nums = \(pattern)")
//                break
//            }
//        }
//
//        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
//    }
//
//}

//do {
//    let s = _6152_赢得比赛需要的最少训练时长()
//
//    let result1 = s.minNumberOfHours(5, 3, [1,4,3,2], [2,6,3,1])
//    assert(result1 == 8)
//    print(result1)
//
//    let result2 = s.minNumberOfHours(2, 4, [1], [3])
//    assert(result2 == 0)
//    print(result2)
//
//    let result3 = s.minNumberOfHours(1, 1, [1,1,1,1], [1,1,1,50])
//    assert(result2 == 51)
//    print(result3)
//
//    let result4 = s.minNumberOfHours(5, 3, [1,4], [2,5])
//    assert(result4 == 2)
//    print(result4)
//    /// 对数器测试
////    s.test()
//}

//: [Next](@next)
