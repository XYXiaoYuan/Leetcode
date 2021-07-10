/**
 https://www.nowcoder.com/practice/769d45d455fe40b385ba32f97e7bcded?tpId=37&&tqId=21296&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 根据输入的日期，计算是这一年的第几天。


 输入描述：
 输入一行，每行空格分割，分别是年，月，日

 输出描述：
 输出是这一年的第几天
 示例1
 输入：
 2012 12 31
 复制
 输出：
 366
 复制
 示例2
 输入：
 1982 3 4
 复制
 输出：
 63
 复制
 
 */

import Foundation

while let line = readLine() {
    let parts = line.split(separator: " ")
    
    let year: Int = Int(parts[0])!
    let month: Int = Int(parts[1])!
    let day: Int = Int(parts[2])!
    
    func isLeapYear(_ y: Int) -> Bool {
        return (y % 100 != 0 && y % 4 == 0) || (y % 100 == 0 && y % 400 == 0)
    }
        
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
    
    print(count)
}
