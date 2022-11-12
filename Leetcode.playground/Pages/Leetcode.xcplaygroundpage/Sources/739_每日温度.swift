/**
 https://leetcode.cn/problems/daily-temperatures/?favorite=2cktkvj
 
 给定一个整数数组 temperatures ，表示每天的温度，返回一个数组 answer ，其中 answer[i] 是指对于第 i 天，下一个更高温度出现在几天后。如果气温在这之后都不会升高，请在该位置用 0 来代替。

  

 示例 1:

 输入: temperatures = [73,74,75,71,69,72,76,73]
 输出: [1,1,4,2,1,1,0,0]
 示例 2:

 输入: temperatures = [30,40,50,60]
 输出: [1,1,1,0]
 示例 3:

 输入: temperatures = [30,60,90]
 输出: [1,1,0]
  

 提示：

 1 <= temperatures.length <= 105
 30 <= temperatures[i] <= 100


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/daily-temperatures
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

 */

import Foundation
import Darwin
// import XCTest

public class _739_每日温度 {
    //class Solution {
    public init() {}
    
    public func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        let T = temperatures
        guard !T.isEmpty else { return [Int]() }
        let n = T.count
        var values = [Int].init(repeating: 0, count: T.count)
        for i in stride(from: n - 2, through: 0, by: -1) {
            var j = i + 1
            while (true) {
                if (T[i] < T[j]) {
                    values[i] = j - i
                    break
                } else if (values[j] == 0) {
                    values[i] = 0
                    break
                }
                // 当T[i] == T[j]的时候
                j = j + values[j]
            }
        }
        return values
    }

    /// 正确,但是超时
    public func dailyTemperatures0(_ temperatures: [Int]) -> [Int] {
        let n = temperatures.count
        var ans = [Int].init(repeating: 0, count: n)
        for i in 0..<n {
            let v1 = temperatures[i]
            for j in i..<n {
                let v2 = temperatures[j]
                if v2 > v1 {
                    ans[i] = abs(j - i)
                    break
                }
            }
        }
        
        return ans
    }

}

extension _739_每日温度 {
    public static func test() {
        let testTime = 100
        var isSucceed = true
        for _ in 0..<testTime {
            let count = Int.random(in: 0...10)
            let nums = Int.random(count: count, min: 30, max: 100)
            let s = _739_每日温度()
            /// 暴力方法
            let result = s.dailyTemperatures0(nums)

            /// 待验证的：方法
            let result1 = s.dailyTemperatures(nums)

            if result != result1 {
                isSucceed = false
                print("startPos = \(nums), --- result = \(result)\n, result1 = \(result1)")
                break
            }
        }

        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}

//do {
//    let s = _739_每日温度()
//    let result1 = s.dailyTemperatures([73,74,75,71,69,72,76,73])
//    assert(result1 == [1,1,4,2,1,1,0,0])
//    
//    let result2 = s.dailyTemperatures([30,40,50,60])
//    assert(result2 == [1,1,1,0])
//
//    let result3 = s.dailyTemperatures([30,60,90])
//    assert(result3 == [1,1,0])
//
//    print("\(s) result1 = \(result1) ---- result2 = \(result2) ---- result3 = \(result3)")
//
//    /// 对数器测试
//    _739_每日温度.test()
//}

//: [Next](@next)
