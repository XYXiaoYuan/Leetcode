/**
 https://leetcode.cn/contest/weekly-contest-309/problems/check-distances-between-same-letters/
 
 给你一个下标从 0 开始的字符串 s ，该字符串仅由小写英文字母组成，s 中的每个字母都 恰好 出现 两次 。另给你一个下标从 0 开始、长度为 26 的的整数数组 distance 。

 字母表中的每个字母按从 0 到 25 依次编号（即，'a' -> 0, 'b' -> 1, 'c' -> 2, ... , 'z' -> 25）。

 在一个 匀整 字符串中，第 i 个字母的两次出现之间的字母数量是 distance[i] 。如果第 i 个字母没有在 s 中出现，那么 distance[i] 可以 忽略 。

 如果 s 是一个 匀整 字符串，返回 true ；否则，返回 false 。

  

 示例 1：

 输入：s = "abaccb", distance = [1,3,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
 输出：true
 解释：
 - 'a' 在下标 0 和下标 2 处出现，所以满足 distance[0] = 1 。
 - 'b' 在下标 1 和下标 5 处出现，所以满足 distance[1] = 3 。
 - 'c' 在下标 3 和下标 4 处出现，所以满足 distance[2] = 0 。
 注意 distance[3] = 5 ，但是由于 'd' 没有在 s 中出现，可以忽略。
 因为 s 是一个匀整字符串，返回 true 。
 示例 2：

 输入：s = "aa", distance = [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
 输出：false
 解释：
 - 'a' 在下标 0 和 1 处出现，所以两次出现之间的字母数量为 0 。
 但是 distance[0] = 1 ，s 不是一个匀整字符串。
  

 提示：

 2 <= s.length <= 52
 s 仅由小写英文字母组成
 s 中的每个字母恰好出现两次
 distance.length == 26
 0 <= distance[i] <= 50

 */

import Foundation
import Darwin
// import XCTest

public class _6167_检查相同字母间的距离 {
    //class Solution {
    public init() {}

    public func checkDistances(_ s: String, _ distance: [Int]) -> Bool {
        let arr = s.map { String($0) }
        let aValue = Unicode.Scalar("a").value
        var dict = [String: Int]()
        for (i, char) in arr.enumerated() {
            if let startIndex = dict[char], let charV = Unicode.Scalar(char)?.value {
                let index = Int(charV - aValue)
                let value = i - startIndex - 1
                if distance[index] != value {
                    return false
                }
            }
            dict[char] = i
        }
        return true
    }
}

//extension _6167_检查相同字母间的距离 {
//    public func test() {
//        let testTime = 10
//        var isSucceed = true
//        let min = 1
//        let max = 100
//        for _ in 0..<testTime {
//            let count = Int.random(in: 3..<10)
//            let nums = Int.random(count: count, min: min, max: max)
//            /// 方法一
//            let result = checkDistances(nums)
//
//            /// 待验证的：方法二
//            let result1 = checkDistances(nums)
//
//            if result != result1 {
//                isSucceed = false
//                print("nums = \(nums) --- result = \(result)")
//                break
//            }
//        }
//
//        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
//    }
//}

//do {
//    let s = _6167_检查相同字母间的距离()
//    let result1 = s.checkDistances("abaccb", [1,3,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
////    assert(result1 == true)
//    let result2 = s.checkDistances("aa", [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
////    assert(result2 == false)
//    let result3 = s.checkDistances("zz", [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1])
//
//    print("\(s) result1 = \(result1) ---- result2 = \(result2) ---- result3 = \(result3)")
//
//    /// 对数器测试
////    s.test()
//}

//: [Next](@next)
