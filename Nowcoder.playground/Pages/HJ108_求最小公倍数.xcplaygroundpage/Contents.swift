/**
 https://www.nowcoder.com/practice/22948c2cad484e0291350abad86136c3?tpId=37&&tqId=21331&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 正整数A和正整数B 的最小公倍数是指 能被A和B整除的最小的正整数值，设计一个算法，求输入A和B的最小公倍数。

 输入描述：
 输入两个正整数A和B。

 输出描述：
 输出A和B的最小公倍数。

 示例1
 输入：
 5 7
 复制
 输出：
 35

 */

import Foundation

while let line = readLine() {
    func minRate(_ a: inout Int, _ b: inout Int) -> Int {
        while a % b > 0 {
            let tmp = a
            a = b
            b = tmp % b
        }
        return b
    }
    
    let parts = line.split(separator: " ")

    var num1 = Int(parts[0])!
    var num2 = Int(parts[1])!
    
    let num = num1 * num2 / minRate(&num1, &num2)
    
    print(num)
}

