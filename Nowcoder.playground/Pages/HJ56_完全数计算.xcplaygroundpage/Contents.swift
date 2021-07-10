/**
 https://www.nowcoder.com/practice/7299c12e6abb437c87ad3e712383ff84?tpId=37&&tqId=21279&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 完全数（Perfect number），又称完美数或完备数，是一些特殊的自然数。

 它所有的真因子（即除了自身以外的约数）的和（即因子函数），恰好等于它本身。

 例如：28，它有约数1、2、4、7、14、28，除去它本身28外，其余5个数相加，1+2+4+7+14=28。s

 输入n，请输出n以内(含n)完全数的个数。计算范围, 0 < n <= 500000


 本题输入含有多组样例。

 输入描述：
 输入一个数字n

 输出描述：
 输出不超过n的完全数的个数

 示例1
 输入：
 1000
 7
 100
 复制
 输出：
 3
 1
 2
 复制

 */

import Foundation

while let line = readLine(), let number = Int(line) {
    
    var count: Int = 0
    
    for i in 1...number {
        var list: [Int] = [Int]()
        for j in 1..<i where i % j == 0 {
            list.append(j)
        }
        
        let sum = list.reduce(0, { $0 + $1 })
        if sum == i {
//             print("sum = \(sum), number = \(i)")
            count += 1
        }
    }
        
    print(count)
}
