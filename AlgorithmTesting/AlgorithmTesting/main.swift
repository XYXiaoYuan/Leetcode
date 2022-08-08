/**
 https://leetcode.cn/problems/task-scheduler-ii/

 给你一个下标从 0 开始的正整数数组 tasks ，表示需要 按顺序 完成的任务，其中 tasks[i] 表示第 i 件任务的 类型 。

 同时给你一个正整数 space ，表示一个任务完成 后 ，另一个 相同 类型任务完成前需要间隔的 最少 天数。

 在所有任务完成前的每一天，你都必须进行以下两种操作中的一种：

 完成 tasks 中的下一个任务
 休息一天
 请你返回完成所有任务所需的 最少 天数。

  

 示例 1：

 输入：tasks = [1,2,1,2,3,1], space = 3
 输出：9
 解释：
 9 天完成所有任务的一种方法是：
 第 1 天：完成任务 0 。
 第 2 天：完成任务 1 。
 第 3 天：休息。
 第 4 天：休息。
 第 5 天：完成任务 2 。
 第 6 天：完成任务 3 。
 第 7 天：休息。
 第 8 天：完成任务 4 。
 第 9 天：完成任务 5 。
 可以证明无法少于 9 天完成所有任务。
 示例 2：

 输入：tasks = [5,8,8,5], space = 2
 输出：6
 解释：
 6 天完成所有任务的一种方法是：
 第 1 天：完成任务 0 。
 第 2 天：完成任务 1 。
 第 3 天：休息。
 第 4 天：休息。
 第 5 天：完成任务 2 。
 第 6 天：完成任务 3 。
 可以证明无法少于 6 天完成所有任务。
  

 提示：

 1 <= tasks.length <= 105
 1 <= tasks[i] <= 109
 1 <= space <= tasks.length


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/task-scheduler-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
// import XCTest

public class _2365_任务调度器_II {
    //class Solution {
    public init() {}

    func taskSchedulerII(_ tasks: [Int], _ space: Int) -> Int {
        
        return 0
    }
}

extension _2365_任务调度器_II {
    public func test() {
        let testTime = 10
        var isSucceed = true
        let min = 1
        let max = 100
        let count = 10
        for _ in 0..<testTime {
            let tasks = Int.random(count: count, min: min, max: max)
            let space = 10
            
            /// 方法一
            let result1 = taskSchedulerII(tasks, space)

            /// 待验证的：方法二
            let result2 = taskSchedulerII(tasks, space)

            if result1 != result2 {
                isSucceed = false
                print("numbers = \(tasks)")
                break
            }
        }

        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }

}

//do {
//    let s = _2365_任务调度器_II()
//
//    let result1 = s.taskSchedulerII([1,2,1,2,3,1], 3)
////    assert(result1 == 9)
//    print(result1)
//
//    let result2 = s.taskSchedulerII([5,8,8,5], 2)
////    assert(result2 == 6)
//    print(result2)
//
//    /// 对数器测试
//    s.test()
//}

do {
    let lowercaseLetterValues = Unicode.Scalar("a").value...Unicode.Scalar("z").value
    let lowercaseLetters = lowercaseLetterValues.map { String(Unicode.Scalar($0) ?? " ")}
    print(lowercaseLetters)// ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

    let uppercaseLetterValues = Unicode.Scalar("A").value...Unicode.Scalar("Z").value
    let uppercaseLetters = uppercaseLetterValues.map { String(Unicode.Scalar($0) ?? " ")}
    print(uppercaseLetters)// ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
}

do {
    let lowercaseLetterValues = Unicode.Scalar("a").value...Unicode.Scalar("z").value
    let letters = lowercaseLetterValues.map { String(Unicode.Scalar($0) ?? " ")}
    print(letters)// ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
}

do {
    let uppercaseLetterValues = Unicode.Scalar("A").value...Unicode.Scalar("Z").value
    let letters = uppercaseLetterValues.map { String(Unicode.Scalar($0) ?? " ")}
    print(letters)// ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
}



//let startingValue = Int(("A" as Unicode.Scalar).value) // 65
//for i in 0 ..< 26 {
//    if let value = Unicode.Scalar(i + lowLetterValue) {
//        print(Character(value))
//    }
//}

//: [Next](@next)
