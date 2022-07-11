
import Foundation
import Darwin

/// 星座
public class constellation {
    //class Solution {
    public init() {}
    
    /// 用两个数组的方式实现
    public func getconstellationByMonth(_ month: Int, _ day: Int) -> String {
        let dayArr = [20, 19, 21, 20, 21, 22, 23, 23, 23, 24, 23, 22]
        let constellationArr = ["摩羯座", "水瓶座", "双鱼座", "白羊座", "金牛座", "双子座", "巨蟹座", "狮子座", "处女座", "天秤座","天蝎座", "射手座", "摩羯座"];
        return day < dayArr[month - 1] ? constellationArr[month - 1] : constellationArr[month]
    }
    
    /// 老方法实现(正确)
    public func getconstellationByMonthOld(_ month: Int, _ day: Int) -> String {
        var constellation = ""
        switch month {
        case 1:
            if day >= 20 {
                constellation = "水瓶座"
            } else {
                constellation = "摩羯座"
            }
        case 2:
            if day >= 19 {
                constellation = "双鱼座"
            } else {
                constellation = "水瓶座"
            }
        case 3:
            if day >= 21 {
                constellation = "白羊座"
            } else {
                constellation = "双鱼座"
            }
        case 4:
            if day >= 20 {
                constellation = "金牛座"
            } else {
                constellation = "白羊座"
            }
        case 5:
            if day >= 21 {
                constellation = "双子座"
            } else {
                constellation = "金牛座"
            }
        case 6:
            if day >= 22 {
                constellation = "巨蟹座"
            } else {
                constellation = "双子座"
            }
        case 7:
            if day >= 23 {
                constellation = "狮子座"
            } else {
                constellation = "巨蟹座"
            }
        case 8:
            if day >= 23 {
                constellation = "处女座"
            } else {
                constellation = "狮子座"
            }
        case 9:
            if day >= 23 {
                constellation = "天秤座"
            } else {
                constellation = "处女座"
            }
        case 10:
            if day >= 24 {
                constellation = "天蝎座"
            } else {
                constellation = "天秤座"
            }
        case 11:
            if day >= 23 {
                constellation = "射手座"
            } else {
                constellation = "天蝎座"
            }
        case 12:
            if day >= 22 {
                constellation = "摩羯座"
            } else {
                constellation = "射手座"
            }
        default:
            constellation = "未知"
        }
        return constellation
    }
    
    /// 对数器测试
    func test() {
        /// 测试样本次数
        let testTime = 100_0000
        var isSucceed = true
        /// 正常的月日
        let normalMonthDay = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        /// 闰年的月日
        let leapMonthDay = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        
        for _ in 0..<testTime {
            let monthDay = Bool.random() ? normalMonthDay : leapMonthDay
            /// 生成随机月份
            let month = Int.random(in: 1...(monthDay.count))
            /// 获得每个月最大的日
            let maxDay = monthDay[month - 1]
            /// 生成每月的随机日
            let day = Int.random(in: 1...maxDay)
            
            /// 方法一:一定对的
            let result1 = getconstellationByMonthOld(month, day)
            
            /// 待验证的：方法二(数组辅助)
            let result2 = getconstellationByMonth(month, day)
            
            if result1 != result2 {
                isSucceed = false
                print("month = \(month) --- day = \(day)")
                break
            }
        }
        
        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}

do {
    let s = constellation()
    s.test()
}



//: [Next](@next)
