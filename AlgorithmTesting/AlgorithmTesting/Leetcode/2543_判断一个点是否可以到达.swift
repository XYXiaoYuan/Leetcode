/**
 https://leetcode.cn/problems/check-if-point-is-reachable/
 
 给你一个无穷大的网格图。一开始你在 (1, 1) ，你需要通过有限步移动到达点 (targetX, targetY) 。

 每一步 ，你可以从点 (x, y) 移动到以下点之一：

 (x, y - x)
 (x - y, y)
 (2 * x, y)
 (x, 2 * y)
 给你两个整数 targetX 和 targetY ，分别表示你最后需要到达点的 X 和 Y 坐标。如果你可以从 (1, 1) 出发到达这个点，请你返回true ，否则返回 false 。

  

 示例 1：

 输入：targetX = 6, targetY = 9
 输出：false
 解释：没法从 (1,1) 出发到达 (6,9) ，所以返回 false 。
 示例 2：

 输入：targetX = 4, targetY = 7
 输出：true
 解释：你可以按照以下路径到达：(1,1) -> (1,2) -> (1,4) -> (1,8) -> (1,7) -> (2,7) -> (4,7) 。
  

 提示：

 1 <= targetX, targetY <= 109


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/check-if-point-is-reachable
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
// import XCTest

public class _2543_判断一个点是否可以到达 {
    //class Solution {
    public init() {}
    
    public func isReachable(_ targetX: Int, _ targetY: Int) -> Bool {
        let g = gcd(targetX, targetY)
        return (g & (g - 1)) == 0
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

extension _2543_判断一个点是否可以到达 {
    public func test() {
        let testTime = 10000
        print("对数器开始工作, 执行 【\(testTime)】 次")

        var isSucceed = true
        for i in 0..<testTime {
            let targetX = Int.random(in: 1...50)
            let targetY = Int.random(in: 1...50)
                        
            let result0 = self.isReachable(targetX, targetY)
            let result1 = self.isReachable(targetX, targetY)

            if result0 != result1 {
                isSucceed = false
                print("第 \(i + 1) 次测试失败, targetX = \(targetX), targetY = \(targetY), result = \(result1)")
                break
            } else {
                print("第 \(i + 1) 次测试成功, targetX = \(targetX), targetY = \(targetY), result = \(result1)")
            }
        }

        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}

//do {
//    let s = _2543_判断一个点是否可以到达()
//    
//    let result1 = s.isReachable(6, 9)
////    assert(result1 == false)
//    print(result1)
//
//    let result2 = s.isReachable(4, 7)
////    assert(result2 == true)
//    print(result2)
//    
////    s.test()
//}


//: [Next](@next)
