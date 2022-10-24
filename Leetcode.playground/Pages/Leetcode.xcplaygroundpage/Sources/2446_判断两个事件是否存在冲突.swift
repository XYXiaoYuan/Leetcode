/**
 https://leetcode.cn/problems/determine-if-two-events-have-conflict/
 
 给你两个字符串数组 event1 和 event2 ，表示发生在同一天的两个闭区间时间段事件，其中：

 event1 = [startTime1, endTime1] 且
 event2 = [startTime2, endTime2]
 事件的时间为有效的 24 小时制且按 HH:MM 格式给出。

 当两个事件存在某个非空的交集时（即，某些时刻是两个事件都包含的），则认为出现 冲突 。

 如果两个事件之间存在冲突，返回 true ；否则，返回 false 。

  

 示例 1：

 输入：event1 = ["01:15","02:00"], event2 = ["02:00","03:00"]
 输出：true
 解释：两个事件在 2:00 出现交集。
 示例 2：

 输入：event1 = ["01:00","02:00"], event2 = ["01:20","03:00"]
 输出：true
 解释：两个事件的交集从 01:20 开始，到 02:00 结束。
 示例 3：

 输入：event1 = ["10:00","11:00"], event2 = ["14:00","15:00"]
 输出：false
 解释：两个事件不存在交集。
  

 提示：

 evnet1.length == event2.length == 2.
 event1[i].length == event2[i].length == 5
 startTime1 <= endTime1
 startTime2 <= endTime2
 所有事件的时间都按照 HH:MM 格式给出


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/determine-if-two-events-have-conflict
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

 */

import Foundation
import Darwin
// import XCTest

public class _2446_判断两个事件是否存在冲突 {
    //class Solution {
    public init() {}
    
    func haveConflict(_ event1: [String], _ event2: [String]) -> Bool {
        guard let e1First = event1.first,
                let e1Last = event1.last,
                let e2First = event2.first,
                let e2Last = event2.last else { return false }

        return e1First <= e2Last && e1Last >= e2First
    }
}

extension _2446_判断两个事件是否存在冲突 {
    public static func test() {
        let testTime = 5
        var isSucceed = true
        let min = 0
        let max = 100000
        for _ in 0..<testTime {
            let nums = Int.random(in: min...max)
            let s = _2446_判断两个事件是否存在冲突()
            /// 方法一
            let result = s.haveConflict([], [])

            /// 待验证的：方法二
            let result1 = s.haveConflict([], [])

            if result != result1 {
                isSucceed = false
                print("startPos = \(nums), --- result = \(result)")
                break
            }
        }

        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}

//do {
//    let s = _2446_判断两个事件是否存在冲突()
//    let result1 = s.haveConflict(["01:15","02:00"], ["02:00","03:00"])
//    assert(result1 == true)
//
//    let result2 = s.haveConflict(["01:00","02:00"], ["01:20","03:00"])
//    assert(result2 == true)
//
//    let result3 = s.haveConflict(["10:00","11:00"], ["14:00","15:00"])
//    assert(result3 == false)
//
//    print("\(s) result1 = \(result1) ---- result2 = \(result2) ---- result3 = \(result3)")
//
//    /// 对数器测试
//    _2446_判断两个事件是否存在冲突.test()
//}

//: [Next](@next)
