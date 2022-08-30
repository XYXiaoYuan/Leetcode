/**
 https://leetcode.cn/problems/minimum-amount-of-time-to-collect-garbage/
 
 给你一个下标从 0 开始的字符串数组 garbage ，其中 garbage[i] 表示第 i 个房子的垃圾集合。garbage[i] 只包含字符 'M' ，'P' 和 'G' ，但可能包含多个相同字符，每个字符分别表示一单位的金属、纸和玻璃。垃圾车收拾 一 单位的任何一种垃圾都需要花费 1 分钟。

 同时给你一个下标从 0 开始的整数数组 travel ，其中 travel[i] 是垃圾车从房子 i 行驶到房子 i + 1 需要的分钟数。

 城市里总共有三辆垃圾车，分别收拾三种垃圾。每辆垃圾车都从房子 0 出发，按顺序 到达每一栋房子。但它们 不是必须 到达所有的房子。

 任何时刻只有 一辆 垃圾车处在使用状态。当一辆垃圾车在行驶或者收拾垃圾的时候，另外两辆车 不能 做任何事情。

 请你返回收拾完所有垃圾需要花费的 最少 总分钟数。

  

 示例 1：

 输入：garbage = ["G","P","GP","GG"], travel = [2,4,3]
 输出：21
 解释：
 收拾纸的垃圾车：
 1. 从房子 0 行驶到房子 1
 2. 收拾房子 1 的纸垃圾
 3. 从房子 1 行驶到房子 2
 4. 收拾房子 2 的纸垃圾
 收拾纸的垃圾车总共花费 8 分钟收拾完所有的纸垃圾。
 收拾玻璃的垃圾车：
 1. 收拾房子 0 的玻璃垃圾
 2. 从房子 0 行驶到房子 1
 3. 从房子 1 行驶到房子 2
 4. 收拾房子 2 的玻璃垃圾
 5. 从房子 2 行驶到房子 3
 6. 收拾房子 3 的玻璃垃圾
 收拾玻璃的垃圾车总共花费 13 分钟收拾完所有的玻璃垃圾。
 由于没有金属垃圾，收拾金属的垃圾车不需要花费任何时间。
 所以总共花费 8 + 13 = 21 分钟收拾完所有垃圾。
 示例 2：

 输入：garbage = ["MMM","PGM","GP"], travel = [3,10]
 输出：37
 解释：
 收拾金属的垃圾车花费 7 分钟收拾完所有的金属垃圾。
 收拾纸的垃圾车花费 15 分钟收拾完所有的纸垃圾。
 收拾玻璃的垃圾车花费 15 分钟收拾完所有的玻璃垃圾。
 总共花费 7 + 15 + 15 = 37 分钟收拾完所有的垃圾。
  

 提示：

 2 <= garbage.length <= 105
 garbage[i] 只包含字母 'M' ，'P' 和 'G' 。
 1 <= garbage[i].length <= 10
 travel.length == garbage.length - 1
 1 <= travel[i] <= 100


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/minimum-amount-of-time-to-collect-garbage
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
// import XCTest

public class _2391_收集垃圾的最少总时间 {
    //class Solution {
    public init() {}
        
    public func garbageCollection(_ garbage: [String], _ travel: [Int]) -> Int {
        var pos = [Int].init(repeating: 0, count: 3)
        var ans = 0
        for (i, ga) in garbage.enumerated() {
            ans += ga.count
            for char in ga.map({ String($0) }) {
                var k = 0
                for (i, key) in ["M", "P", "G"].enumerated() where key == char {
                    k = i
                }
                while pos[k] < i {
                    ans += travel[pos[k]]
                    pos[k] += 1
                }
            }
        }
        
        return ans
    }

    /// 直译
    public func garbageCollection1(_ garbage: [String], _ travel: [Int]) -> Int {
        // 拿到金属、纸、玻璃出现的最后位置，方便后续计算途经时间
        var M = 0, P = 0, G = 0
        for (i, g) in garbage.enumerated() {
            if g.contains("M") {
                M = i
            }
            if g.contains("P") {
                P = i
            }
            if g.contains("G") {
                G = i
            }
        }
        
        var time = 0
        // 依次收集金属、纸、玻璃
        // 先算上处理垃圾的时间
        for g in garbage{
            // 因为最终都会处理完所有垃圾，所以处理时间就是就是每个字符串的长度加到一起
            time += g.count
            
        }
        // 再加上通行时间
        for i in 0..<M {
            // 清理金属的路途时间
            time += travel[i]
        }
        for i in 0..<P {
            // 清理纸屑的路途时间
            time += travel[i]
        }
        for i in 0..<G {
            // 清理玻璃的路途时间
            time += travel[i]
        }
        
        return time
    }
}

extension _2391_收集垃圾的最少总时间 {
    public func test() {
        let testTime = 10000
        var isSucceed = true
        let min = 2
        let max = 10
        let letters = ["M", "P", "G"]
        for _ in 0..<testTime {
            let count = Int.random(in: min...max)
            var garbage = [String]()
            for _ in 0..<count {
                var rubbish = ""
                for _ in 0..<Int.random(in: 1...10) {
                    let index = Int.random(in: 0..<letters.count)
                    rubbish.append(letters[index])
                }
                garbage.append(rubbish)
            }
            let travel = Int.random(count: count - 1, min: 1, max: 100)
            
            assert(garbage.count == travel.count + 1)
            
            /// 方法一
            let result1 = garbageCollection(garbage, travel)

            /// 待验证的：方法二
            let result2 = garbageCollection1(garbage, travel)

            if result1 != result2 {
                isSucceed = false
                print("garbage = \(garbage) --- travel = \(travel)")
                break
            }
        }

        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}


//do {
//    let s = _2391_收集垃圾的最少总时间()
//    let result1 = s.garbageCollection(["G","P","GP","GG"], [2,4,3])
//    assert(result1 == 21)
//    let result2 = s.garbageCollection(["MMM","PGM","GP"], [3,10])
//    assert(result2 == 37)
//
//    print("\(s) result1 = \(result1) ---- result2 = \(result2)")
//    
//    /// 对数器测试
//    s.test()
//}

//: [Next](@next)
