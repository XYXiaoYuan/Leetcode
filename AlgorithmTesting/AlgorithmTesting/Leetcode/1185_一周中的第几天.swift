/**
 https://leetcode-cn.com/problems/day-of-the-week/
 
 给你一个日期，请你设计一个算法来判断它是对应一周中的哪一天。

 输入为三个整数：day、month 和 year，分别表示日、月、年。

 您返回的结果必须是这几个值中的一个 {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}。

  

 示例 1：

 输入：day = 31, month = 8, year = 2019
 输出："Saturday"
 示例 2：

 输入：day = 18, month = 7, year = 1999
 输出："Sunday"
 示例 3：

 输入：day = 15, month = 8, year = 1993
 输出："Sunday"


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/day-of-the-week
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _1185_一周中的第几天 {
//class Solution {
    public init() {}

    public func dayOfTheWeek(_ day: Int, _ month: Int, _ year: Int) -> String {
        let res: [String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
        var myMonth = month
        var myYear = year
        if (myMonth == 1 || myMonth == 2) {
            myMonth = myMonth + 12 ;
            myYear -= 1
        }
        var index = 0 ;
        //基姆拉尔森计算公式
        index = (day + 2 * myMonth + 3 * ( myMonth + 1 ) / 5 + myYear + myYear / 4 - myYear / 100 + myYear / 400 ) % 7 ;
        
        return res[index] ;
    }
}

//let s = _1185_一周中的第几天()
//let result = s.dayOfTheWeek(31, 8, 2019)
//print(result)
//
//assert(s.dayOfTheWeek(31, 8, 2019) == "Saturday")
//assert(s.dayOfTheWeek(18, 7, 1999) == "Sunday")
//assert(s.dayOfTheWeek(15, 8, 1993) == "Sunday")
//
///// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}

