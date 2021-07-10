/**
 https://www.nowcoder.com/practice/ba241b85371c409ea01ac0aa1a8d957b?tpId=37&&tqId=21278&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 输出7有关数字的个数，包括7的倍数，还有包含7的数字（如17，27，37...70，71，72，73...）的个数（一组测试用例里可能有多组数据，请注意处理）

 输入描述：
 一个正整数N。(N不大于30000)

 输出描述：
 不大于N的与7有关的数字个数，例如输入20，与7有关的数字包括7,14,17.

 示例1
 输入：
 20
 10
 复制
 输出：
 3
 1
 复制

 
 */

import Foundation

while let line = readLine(), let number = Int(line) {
    
    var count: Int = 0
    
    for num in 1...number {
        let stringNum = String(num)
        if (stringNum.contains("7") || num % 7 == 0) {
//             print("进来的num = \(num)")
            count += 1
        }
    }
    
    print(count)
}
