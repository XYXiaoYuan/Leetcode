/**
 https://www.nowcoder.com/practice/8f3df50d2b9043208c5eed283d1d4da6?tpId=37&&tqId=21228&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 写出一个程序，接受一个十六进制的数，输出该数值的十进制表示。

 输入描述：
 输入一个十六进制的数值字符串。注意：一个用例会同时有多组输入数据，请参考帖子https://www.nowcoder.com/discuss/276处理多组输入的问题。

 输出描述：
 输出该数值的十进制字符串。不同组的测试用例用\n隔开。

 示例1
 输入：
 0xA
 0xAA
 复制
 输出：
 10
 170
 复制
 */

import Foundation
 
while let line = readLine() {
     
    let str = line.uppercased().suffix(line.count - 2)

    var sum = 0
    for i in str.utf8 {
        sum = sum * 16 + Int(i) - 48 // 0-9 从48开始
        if i >= 65 {                 // A-Z 从65开始，但有初始值10，所以应该是减去55
            sum -= 7
        }
    }
    print(sum)
     
     
}
