/**
 https://leetcode.cn/problems/find-the-maximum-achievable-number/
 
 给你两个整数 num 和 t 。

 如果整数 x 可以在执行下述操作不超过 t 次的情况下变为与 num 相等，则称其为 可达成数字 ：

 每次操作将 x 的值增加或减少 1 ，同时可以选择将 num 的值增加或减少 1 。
 返回所有可达成数字中的最大值。可以证明至少存在一个可达成数字。

  

 示例 1：

 输入：num = 4, t = 1
 输出：6
 解释：最大可达成数字是 x = 6 ，执行下述操作可以使其等于 num ：
 - x 减少 1 ，同时 num 增加 1 。此时，x = 5 且 num = 5 。
 可以证明不存在大于 6 的可达成数字。
 示例 2：

 输入：num = 3, t = 2
 输出：7
 解释：最大的可达成数字是 x = 7 ，执行下述操作可以使其等于 num ：
 - x 减少 1 ，同时 num 增加 1 。此时，x = 6 且 num = 4 。
 - x 减少 1 ，同时 num 增加 1 。此时，x = 5 且 num = 5 。
 可以证明不存在大于 7 的可达成数字。
  

 提示：

 1 <= num, t <= 50


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/find-the-maximum-achievable-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
// import XCTest

public class _2769_找出最大的可达成数字 {
    //class Solution {
    public init() {}

    public func theMaximumAchievableX(_ num: Int, _ t: Int) -> Int {
        return num + t * 2
    }
    
}

extension _2769_找出最大的可达成数字 {
    public func test() {
        let testTime = 10000
        print("对数器开始工作, 执行 【\(testTime)】 次")

        var isSucceed = true
        for i in 0..<testTime {
            let num = Int.random(in: 1...50)
            let t = Int.random(in: 1...50)
                        
            let result0 = self.theMaximumAchievableX(num, t)
            let result1 = self.theMaximumAchievableX(num, t)

            if result0 != result1 {
                isSucceed = false
                print("第 \(i + 1) 次测试失败, num = \(num), t = \(t), result = \(result1)")
                break
            } else {
                print("第 \(i + 1) 次测试成功, num = \(num), t = \(t), result = \(result1)")
            }
        }

        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}

//do {
//    let s = _2769_找出最大的可达成数字()
//    
//    let result1 = s.theMaximumAchievableX(4, 1)
//    assert(result1 == 6)
//    print(result1)
//
//    let result2 = s.theMaximumAchievableX(3, 2)
//    assert(result2 == 7)
//    print(result2)
//        
//    s.test()
//}


//: [Next](@next)
