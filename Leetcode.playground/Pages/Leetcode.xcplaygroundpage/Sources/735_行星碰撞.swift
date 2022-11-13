/**
 https://leetcode.cn/problems/asteroid-collision/
 
 给定一个整数数组 asteroids，表示在同一行的行星。

 对于数组中的每一个元素，其绝对值表示行星的大小，正负表示行星的移动方向（正表示向右移动，负表示向左移动）。每一颗行星以相同的速度移动。

 找出碰撞后剩下的所有行星。碰撞规则：两个行星相互碰撞，较小的行星会爆炸。如果两颗行星大小相同，则两颗行星都会爆炸。两颗移动方向相同的行星，永远不会发生碰撞。

  

 示例 1：

 输入：asteroids = [5,10,-5]
 输出：[5,10]
 解释：10 和 -5 碰撞后只剩下 10 。 5 和 10 永远不会发生碰撞。
 示例 2：

 输入：asteroids = [8,-8]
 输出：[]
 解释：8 和 -8 碰撞后，两者都发生爆炸。
 示例 3：

 输入：asteroids = [10,2,-5]
 输出：[10]
 解释：2 和 -5 发生碰撞后剩下 -5 。10 和 -5 发生碰撞后剩下 10 。
  

 提示：

 2 <= asteroids.length <= 104
 -1000 <= asteroids[i] <= 1000
 asteroids[i] != 0


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/asteroid-collision
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin

public class _735_行星碰撞 {
    //class Solution {
    public init() {}
    
    public func asteroidCollision1(_ asteroids: [Int]) -> [Int] {
        var stack = [Int].init(repeating: 0, count: asteroids.count)
        var top = -1
        for asteroid in asteroids {
            var alive = true
            while asteroid < 0, alive, top != -1, stack[top] > 0 {
                alive = stack[top] < -asteroid
                if stack[top] <= -asteroid {
                    top -= 1
                }
            }
            if alive {
                top += 1
                stack[top] = asteroid
            }
        }
        
        var res = [Int]()
        for i in 0..<(top + 1) {
            res.append(stack[i])
        }
        return res
    }
    
    public func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var stack = [Int].init(repeating: 0, count: asteroids.count)
        var top = -1
        for asteroid in asteroids {
            var alive = true
            while asteroid < 0, alive, top != -1, stack[top] > 0 {
                alive = stack[top] < -asteroid
                if stack[top] <= -asteroid {
                    top -= 1
                }
            }
            if alive {
                top += 1
                stack[top] = asteroid
            }
        }
        
        var res = [Int]()
        for i in 0..<(top + 1) {
            res.append(stack[i])
        }
        return res
    }
    
}

extension _735_行星碰撞 {
    public func test() {
        let testTime = 1
        let minValue = -1000
        let maxValue = 1000
        let count = Int.random(in: 2...10000)
        var isSucceed = true
        for _ in 0..<testTime {
            let randomArr = Int.random(count: count, min: minValue, max: maxValue)

            /// 方法一
            let result = asteroidCollision(randomArr)

            /// 待验证的：方法二
            let result2 = asteroidCollision(randomArr)
            
            if result != result2 {
                isSucceed = false
                print("randomArr = \(randomArr)")
                break
            }
        }
        
        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}

//do {
//    let s = _735_行星碰撞()
//    let result = s.asteroidCollision([5,10,-5])
//    print("\(s) --- \(result)")
//
//    /// 对数器测试
//    s.test()
//}

//: [Next](@next)
