/**
 https://www.nowcoder.com/practice/196534628ca6490ebce2e336b47b3607?tpId=37&&tqId=21229&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 功能:输入一个正整数，按照从小到大的顺序输出它的所有质因子（重复的也要列举）（如180的质因子为2 2 3 3 5 ）

 最后一个数后面也要有空格

 输入描述：
 输入一个long型整数

 输出描述：
 按照从小到大的顺序输出它的所有质数的因子，以空格隔开。最后一个数后面也要有空格。

 示例1
 输入：
 180
 复制
 输出：
 2 2 3 3 5
 复制
 */

import Foundation

while let line = readLine(), var num = Int(line) {
    var i = 2
    
    while i * i <= num {
        if 0 == num % i {
            print(i, terminator: " ")
            num /= i
            i -= 1
        }
        i += 1
    }
    print(num, terminator: " ")
}
