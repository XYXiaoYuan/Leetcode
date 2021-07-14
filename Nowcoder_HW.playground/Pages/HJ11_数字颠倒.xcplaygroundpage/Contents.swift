/**
 https://www.nowcoder.com/practice/ae809795fca34687a48b172186e3dafe?tpId=37&&tqId=21234&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 输入一个整数，将这个整数以字符串的形式逆序输出
 程序不考虑负数的情况，若数字含有0，则逆序形式也含有0，如输入为100，则输出为001


 输入描述：
 输入一个int整数

 输出描述：
 将这个整数以字符串的形式逆序输出

 示例1
 输入：
 1516000
 复制
 输出：
 0006151
 复制
 */

import Foundation
 
while let line = readLine() {
    for i in line.reversed() {
        print("\(i)", terminator: "")
    }
}
