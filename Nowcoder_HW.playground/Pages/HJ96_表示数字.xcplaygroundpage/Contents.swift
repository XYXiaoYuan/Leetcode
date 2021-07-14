/**
 https://www.nowcoder.com/practice/637062df51674de8ba464e792d1a0ac6?tpId=37&&tqId=21319&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 将一个字符中所有的整数前后加上符号“*”，其他字符保持不变。连续的数字视为一个整数。

 注意：本题有多组样例输入。
 输入描述：
 输入一个字符串

 输出描述：
 字符中所有出现的数字前后加上符号“*”，其他字符保持不变

 示例1
 输入：
 Jkdi234klowe90a3
 5151
 复制
 输出：
 Jkdi*234*klowe*90*a*3*
 *5151*

 */

import Foundation

while let line = readLine() {
    let array = line.map {$0}
    var flag = false
    var target = ""
    for s in array {
        var num: UInt32 = 0
        for code in s.unicodeScalars {
            num = code.value
        }
        if num >= 48 && num <= 57 {
            if (!flag) {
                flag = true
                target.append("*")
            }
        } else {
            if (flag) {
                flag = false
                target.append("*")
            }
        }
        target.append(s)
    }
    if (flag) {
        target.append("*")
    }
    print(target)
}
