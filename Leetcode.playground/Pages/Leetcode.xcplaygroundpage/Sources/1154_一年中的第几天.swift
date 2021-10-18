/**
 https://leetcode-cn.com/problems/day-of-the-year/
 
 给你一个按 YYYY-MM-DD 格式表示日期的字符串 date，请你计算并返回该日期是当年的第几天。

 通常情况下，我们认为 1 月 1 日是每年的第 1 天，1 月 2 日是每年的第 2 天，依此类推。每个月的天数与现行公元纪年法（格里高利历）一致。

  

 示例 1：

 输入：date = "2019-01-09"
 输出：9
 示例 2：

 输入：date = "2019-02-10"
 输出：41
 示例 3：

 输入：date = "2003-03-01"
 输出：60
 示例 4：

 输入：date = "2004-03-01"
 输出：61


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/day-of-the-year
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

var greeting = "Hello, playground"

public class _1154_一年中的第几天 {
//class Solution {
    public init() {}

    public func dayOfYear(_ date: String) -> Int {
        let myDate = date.split(separator: "-")
        let year = Int(myDate[0])!
        let month = Int(myDate[1])!
        let day = Int(myDate[2])!
        
        let months: [Int] = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

        var count: Int = 0
        for i in 1...month {
            if i == month {
                count += day
            } else if i == 2 {
                count += isLeapYear(year) ? 29 : 28
            } else {
                count += months[i]
            }
        }
        
        return count
    }
    
    private func isLeapYear(_ y: Int) -> Bool {
        return (y % 100 != 0 && y % 4 == 0) || (y % 100 == 0 && y % 400 == 0)
    }
        
}

//let s = _1154_一年中的第几天()
//let result = s.dayOfYear("2019-01-09")
//print(result)
//
//assert(s.dayOfYear("2019-01-09") == 9)
//assert(s.dayOfYear("2019-02-10") == 41)
//assert(s.dayOfYear("2003-03-01") == 60)
//assert(s.dayOfYear("2004-03-01") == 61)
//
///// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}


