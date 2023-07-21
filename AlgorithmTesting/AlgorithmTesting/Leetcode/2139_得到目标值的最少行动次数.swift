/**
 https://leetcode.cn/problems/minimum-moves-to-reach-target-score/
 
 你正在玩一个整数游戏。从整数 1 开始，期望得到整数 target 。

 在一次行动中，你可以做下述两种操作之一：

 递增，将当前整数的值加 1（即， x = x + 1）。
 加倍，使当前整数的值翻倍（即，x = 2 * x）。
 在整个游戏过程中，你可以使用 递增 操作 任意 次数。但是只能使用 加倍 操作 至多 maxDoubles 次。

 给你两个整数 target 和 maxDoubles ，返回从 1 开始得到 target 需要的最少行动次数。

  

 示例 1：

 输入：target = 5, maxDoubles = 0
 输出：4
 解释：一直递增 1 直到得到 target 。
 示例 2：

 输入：target = 19, maxDoubles = 2
 输出：7
 解释：最初，x = 1 。
 递增 3 次，x = 4 。
 加倍 1 次，x = 8 。
 递增 1 次，x = 9 。
 加倍 1 次，x = 18 。
 递增 1 次，x = 19 。
 示例 3：

 输入：target = 10, maxDoubles = 4
 输出：4
 解释：
 最初，x = 1 。
 递增 1 次，x = 2 。
 加倍 1 次，x = 4 。
 递增 1 次，x = 5 。
 加倍 1 次，x = 10 。
  

 提示：

 1 <= target <= 109
 0 <= maxDoubles <= 100


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/minimum-moves-to-reach-target-score
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
// import XCTest

public class _2139_得到目标值的最少行动次数 {
    //class Solution {
    public init() {}

    public func minMoves(_ target: Int, _ maxDoubles: Int) -> Int {
        var target = target, maxDoubles = maxDoubles
        var count = 0
        while target != 1, maxDoubles != 0 {
            if target % 2 == 1 {
                target -= 1
            } else {
                target /= 2
                maxDoubles -= 1
            }
            count += 1
        }
        
        count += target - 1
        
        return count
    }
    
}

extension _2139_得到目标值的最少行动次数 {
    public func test() {
        let testTime = 10000
        print("对数器开始工作, 执行 【\(testTime)】 次")

        var isSucceed = true
        for i in 0..<testTime {
            let target = Int.random(in: 1...50)
            let maxDoubles = Int.random(in: 1...50)
                        
            let result0 = self.minMoves(target, maxDoubles)
            let result1 = self.minMoves(target, maxDoubles)

            if result0 != result1 {
                isSucceed = false
                print("第 \(i + 1) 次测试失败, target = \(target), maxDoubles = \(maxDoubles), result = \(result1)")
                break
            } else {
                print("第 \(i + 1) 次测试成功, target = \(target), maxDoubles = \(maxDoubles), result = \(result1)")
            }
        }

        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}

//do {
//    let s = _2139_得到目标值的最少行动次数()
//
//    let result1 = s.minMoves(5, 0)
//    assert(result1 == 4)
//    print(result1)
//
//    let result2 = s.minMoves(19, 2)
//    assert(result2 == 7)
//    print(result2)
//
//    let result3 = s.minMoves(10, 4)
//    assert(result3 == 4)
//    print(result3)
//
//    let result4 = s.minMoves(766972377, 92)
//    assert(result4 == 45)
//    print(result4)
//
////    s.test()
//}


//: [Next](@next)
