/**
 https://leetcode.cn/contest/weekly-contest-306/problems/construct-smallest-number-from-di-string/

 给你下标从 0 开始、长度为 n 的字符串 pattern ，它包含两种字符，'I' 表示 上升 ，'D' 表示 下降 。

 你需要构造一个下标从 0 开始长度为 n + 1 的字符串，且它要满足以下条件：

 num 包含数字 '1' 到 '9' ，其中每个数字 至多 使用一次。
 如果 pattern[i] == 'I' ，那么 num[i] < num[i + 1] 。
 如果 pattern[i] == 'D' ，那么 num[i] > num[i + 1] 。
 请你返回满足上述条件字典序 最小 的字符串 num。

  

 示例 1：

 输入：pattern = "IIIDIDDD"
 输出："123549876"
 解释：
 下标 0 ，1 ，2 和 4 处，我们需要使 num[i] < num[i+1] 。
 下标 3 ，5 ，6 和 7 处，我们需要使 num[i] > num[i+1] 。
 一些可能的 num 的值为 "245639871" ，"135749862" 和 "123849765" 。
 "123549876" 是满足条件最小的数字。
 注意，"123414321" 不是可行解因为数字 '1' 使用次数超过 1 次。
 示例 2：

 输入：pattern = "DDD"
 输出："4321"
 解释：
 一些可能的 num 的值为 "9876" ，"7321" 和 "8742" 。
 "4321" 是满足条件最小的数字。
  

 提示：

 1 <= pattern.length <= 8
 pattern 只包含字符 'I' 和 'D' 。
 */

import Foundation
import Darwin
// import XCTest

public class Solution {
    //class Solution {
    public init() {}
    
//    // 8个坐席
//    private let seats = [
//        0,1,2,3,4,5,6,7
//    ]
//
//    /// 一行最多显示的坐席数
//    private let maxRowSeats: Int = 4
        
    
    /// 处理当前坐席相邻的坐席号
    /// - Parameters:
    ///   - seatIndex: 当前坐席号
    ///   - maxRowSeats: 一行多少个坐席
    ///   - seats: 总坐席序号[0...n]
    /// - Returns: 当前坐席相邻的坐席号
    public func adjacentSeats(_ seatIndex: Int,
                              _ maxRowSeats: Int = 4,
                              _ seats: [Int] = [0,1,2,3,4,5,6,7]) -> [Int] {
        guard seatIndex < seats.count else { return [Int]() }

        var res = [Int]()
        
        /// 顶部
        let top = seatIndex - maxRowSeats
        if top >= 0 {
            res.append(seats[top])
        }
        
        /// 底部
        let bottom = seatIndex + maxRowSeats
        if bottom < seats.count {
            res.append(seats[bottom])
        }

        /// 左边
        let left = seatIndex - 1
        if seatIndex % maxRowSeats > 0 {
            res.append(seats[left])
        }

        /// 右边
        let right = seatIndex + 1
        if seatIndex % maxRowSeats < (maxRowSeats - 1) {
            res.append(seats[right])
        }
        
        return res.sorted()
    }
    
}

do {
    let s = Solution()
    
    for i in 0..<8 {
        let seats = s.adjacentSeats(i)
        print("第\(i)位坐席的 相邻坐席有 \(seats)")
    }
    
    print("--------------- \n")
    
    for i in 0..<10 {
        let seats = s.adjacentSeats(i, 5, [0,1,2,3,4,5,6,7,8,9])
        print("第\(i)位坐席的 相邻坐席有 \(seats)")
    }
    
    print("--------------- \n")
    
    for i in 0..<10 {
        let seats = s.adjacentSeats(i, 3, [0,1,2,3,4,5,6,7,8])
        print("第\(i)位坐席的 相邻坐席有 \(seats)")
    }
}

//: [Next](@next)
