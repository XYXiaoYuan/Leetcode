/**
 https://www.nowcoder.com/practice/e45e078701ab4e4cb49393ae30f1bb04?tpId=37&&tqId=21235&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 接受一个只包含小写字母的字符串，然后输出该字符串反转后的字符串。（字符串长度不超过1000）

 输入描述：
 输入一行，为一个只包含小写字母的字符串。

 输出描述：
 输出该字符串反转后的字符串。

 示例1
 输入：
 abcd
 复制
 输出：
 dcba
 复制
 */

import Foundation
 
while let line = readLine() {
    for i in line.reversed() {
        print("\(i)", terminator: "")
    }
}
